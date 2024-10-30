import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class FragranceSelectionScreen extends StatefulWidget {
  const FragranceSelectionScreen({Key? key}) : super(key: key);

  @override
  _FragranceSelectionScreenState createState() => _FragranceSelectionScreenState();
}

class _FragranceSelectionScreenState extends State<FragranceSelectionScreen> {
  // Menyimpan pewangi yang dipilih
  String? selectedFragrance;

  @override
  Widget build(BuildContext context) {
    final fragrances = [
      'Aroma Lily',
      'Cherry Blossom',
      'Ocean Fresh',
      'Red Downy',
      'Lavender'
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
          'Pilih Pewangi Laundry',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Silahkan Pilih Pewangi Laundry\nYang Anda Sukai',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // List dari pewangi dengan tombol pilih di sebelah kanan
            Expanded(
              child: ListView.builder(
                itemCount: fragrances.length,
                itemBuilder: (context, index) {
                  final fragrance = fragrances[index];
                  return Card(
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        fragrance,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedFragrance == fragrance
                              ? Colors.green
                              : Colors.white.withOpacity(0.2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            // Simpan pewangi yang dipilih
                            selectedFragrance = fragrance;
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
            // Tombol konfirmasi
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: selectedFragrance != null
                  ? () {
                // Arahkan ke halaman Service Order dan kirim pewangi yang dipilih
                Get.toNamed(
                  Routes.SERVICE_ORDER,
                  arguments: {'selectedFragrance': selectedFragrance},
                );
              }
                  : null, // Disable tombol jika belum memilih pewangi
              child: const Text('Konfirmasi'),
            ),
          ],
        ),
      ),
    );
  }
}
