import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({Key? key}) : super(key: key);

  @override
  _SetLocationScreenState createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  late GoogleMapController mapController;
  LatLng _pinPosition = const LatLng(-6.200000, 106.816666); // Ganti dengan lokasi default Anda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Lokasi'),
        backgroundColor: const Color(0xFF1B795E),
      ),
      body: Stack(
        children: [
          // Peta
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _pinPosition,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('pin'),
                position: _pinPosition,
              ),
            },
            onTap: (LatLng position) {
              setState(() {
                _pinPosition = position; // Set pin location on tap
              });
              mapController.animateCamera(CameraUpdate.newLatLng(position));
            },
          ),
          // Kolom pencarian di atas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Cari lokasi...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
