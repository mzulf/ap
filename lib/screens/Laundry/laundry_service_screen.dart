import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/routes/app_pages.dart'; // Pastikan jalur import sesuai dengan struktur folder Anda

class LaundryServiceScreen extends StatefulWidget {
  const LaundryServiceScreen({Key? key}) : super(key: key);

  @override
  _LaundryServiceScreenState createState() => _LaundryServiceScreenState();
}

class _LaundryServiceScreenState extends State<LaundryServiceScreen> {
  // Menyimpan layanan yang dipilih
  String? selectedService;

  @override
  Widget build(BuildContext context) {
    final services = [
      'Kiloan Express (5 Jam)',
      'Kiloan Super Reguler (1 Hari)',
      'Kiloan Reguler (3 Hari)',
      'Paket Promo Laundry (48 Jam)',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1B795E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Pilih Layanan Laundry',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Silahkan Pilih Layanan Laundry',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        service,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedService == service
                              ? Colors.green
                              : Colors.white.withOpacity(0.2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedService = service;
                          });
                        },
                        child: const Text('Pilih'),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: selectedService != null
                  ? () {
                Get.toNamed(
                  Routes.DETAIL_BERAT, // Sesuaikan dengan rute yang benar
                  arguments: {'selectedService': selectedService},
                );
              }
                  : null, // Tombol dinonaktifkan jika belum ada layanan yang dipilih
              child: const Text('Detail Berat'),
            ),
            const SizedBox(height: 8), // Spasi antara tombol
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: selectedService != null
                  ? () {
                Get.toNamed(
                  Routes.DETAIL_ITEM_SATUAN, // Sesuaikan dengan rute yang benar
                  arguments: {'selectedService': selectedService},
                );
              }
                  : null, // Tombol dinonaktifkan jika belum ada layanan yang dipilih
              child: const Text('Detail Satuan'),
            ),
            const SizedBox(height: 16), // Spasi antara tombol dan konfirmasi
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: selectedService != null
                  ? () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: Text(
                      'Apakah anda yakin memilih layanan "$selectedService"?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          // Tambahkan logika lain jika diperlukan
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  ),
                );
              }
                  : null, // Tombol dinonaktifkan jika belum ada layanan yang dipilih
              child: const Text('Konfirmasi Pilihan Layanan'),
            ),
          ],
        ),
      ),
    );
  }
}
