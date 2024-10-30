import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PengaturanProfilScreen extends StatefulWidget {
  const PengaturanProfilScreen({Key? key}) : super(key: key);

  @override
  _PengaturanProfilScreenState createState() => _PengaturanProfilScreenState();
}

class _PengaturanProfilScreenState extends State<PengaturanProfilScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final CollectionReference _profilesCollection = FirebaseFirestore.instance.collection('profiles');
  File? _image; // Untuk menyimpan gambar profil

  @override
  void initState() {
    super.initState();
    _fetchProfileData(); // Ambil data profil saat widget diinisialisasi
  }

  @override
  void dispose() {
    // Jangan lupa untuk membersihkan controller
    _emailController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _fetchProfileData() async {
    // Ambil data profil dari Firestore
    final snapshot = await _profilesCollection.limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      var data = snapshot.docs[0].data() as Map<String, dynamic>;
      _emailController.text = data['email'] ?? '';
      _nameController.text = data['name'] ?? '';
      _addressController.text = data['address'] ?? '';
      _phoneController.text = data['phone'] ?? '';
    }
  }

  void _updateProfile() async {
    final profileData = {
      'email': _emailController.text,
      'name': _nameController.text,
      'address': _addressController.text,
      'phone': _phoneController.text,
      // Anda bisa menambahkan URL gambar profil jika ingin menyimpannya di Firestore
    };

    // Menyimpan data profil ke Firestore pada dokumen baru
    await _profilesCollection.add(profileData);

    Get.snackbar(
      'Profil Diperbarui',
      'Profil Anda telah diperbarui!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Mengosongkan form setelah pembaruan (jika ingin tetap menampilkan data, hilangkan bagian ini)
    // setState(() {
    //   _emailController.clear();
    //   _nameController.clear();
    //   _addressController.clear();
    //   _phoneController.clear();
    // });
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path); // Simpan gambar yang dipilih
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Profil'),
      ),
      body: Container(
        color: Colors.grey[200], // Ubah warna background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null ? const Icon(Icons.camera_alt, size: 50) : null,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              child: const Text('Perbarui Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
