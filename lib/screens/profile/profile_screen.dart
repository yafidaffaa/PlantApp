import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:plantapp/components/bottom_nav_bar.dart';
import 'package:plantapp/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Lokasi awal peta (misal Jakarta)
  static const LatLng _initialPosition = LatLng(-7.747034, 110.355398);
  late GoogleMapController _mapController;

  LatLng _pickedLocation = _initialPosition;
  String _address = "tidak ada alamat yang dipilih";

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        setState(() {
          _address = "${place.street}, ${place.locality}, ${place.country}";
        });
      } else {
        setState(() {
          _address = "alamat tidak ditemukan";
        });
      }
    } catch (e) {
      setState(() {
        _address = "error pengambilan alamat";
      });
    }
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _pickedLocation = position;
      _address = "Loading...";
    });
    _getAddressFromLatLng(position);
  }

  Future<void> _saveData(String imagePath, String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_image', imagePath);
    await prefs.setString('saved_address', address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage:
                    _imageFile != null ? FileImage(_imageFile!) : null,
                child: _imageFile == null ? Icon(Icons.person, size: 70) : null,
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: Icon(Icons.camera),
                    label: Text("Camera"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: Icon(Icons.photo_library),
                    label: Text("Gallery"),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                height: 300,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 14,
                  ),
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  tiltGesturesEnabled: false,
                  scrollGesturesEnabled: true,
                  compassEnabled: true,
                  zoomGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  trafficEnabled: true,
                  buildingsEnabled: true,
                  indoorViewEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  onTap: _onMapTap,
                  markers: {
                    Marker(
                      markerId: MarkerId('picked-location'),
                      position: _pickedLocation,
                    ),
                  },
                ),
              ),

              const SizedBox(height: 16),

              Text(
                "Alamat yang dipilih:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_address),

              ElevatedButton.icon(
                onPressed: () async {
                  if (_imageFile != null &&
                      _address != "Tidak ada alamat yang dipilih") {
                    await _saveData(_imageFile!.path, _address);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data berhasil disimpan!")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Mohon pilih foto dan lokasi terlebih dahulu.",
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(Icons.save),
                label: Text("Simpan Data"),
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(key: UniqueKey()),
    );
  }
}
