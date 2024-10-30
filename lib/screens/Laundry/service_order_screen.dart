import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class ServiceOrderScreen extends StatefulWidget {
  const ServiceOrderScreen({Key? key}) : super(key: key);

  @override
  _ServiceOrderScreenState createState() => _ServiceOrderScreenState();
}

class _ServiceOrderScreenState extends State<ServiceOrderScreen> {
  // Variabel untuk menyimpan layanan yang dipilih
  String? selectedService;

  @override
  Widget build(BuildContext context) {
    final services = [
      'Cuci',
      'Cuci Kering',
      'Cuci Lipat',
      'Setrika',
      'Cuci + Setrika'
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
          'Pilih Layanan Order Laundry',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Silahkan Pilih Layanan Order Laundry',
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
            // Tombol Konfirmasi yang aktif hanya jika ada layanan yang dipilih
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
                  Routes.LAUNDRY_SERVICE, // Sesuaikan dengan rute yang benar
                  arguments: {'selectedService': selectedService},
                );
              }
                  : null, // Tombol dinonaktifkan jika belum ada layanan yang dipilih
              child: const Text('Konfirmasi'),
            ),
          ],
        ),
      ),
    );
  }
}
