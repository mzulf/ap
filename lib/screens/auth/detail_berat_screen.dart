import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailBeratScreen extends StatefulWidget {
  const DetailBeratScreen({Key? key}) : super(key: key);  // Tambahkan const constructor

  @override
  State<DetailBeratScreen> createState() => _DetailBeratScreenState();
}

class _DetailBeratScreenState extends State<DetailBeratScreen> {
  double weight = 0.0;

  void _onKeyPressed(String value) {
    setState(() {
      if (value == '↲') {
        weight = 0.0; // Reset weight on Enter key
      } else if (value == '.') {
        // Handle decimal point input
        if (!weight.toString().contains('.')) {
          weight = double.parse(weight.toString() + value);
        }
      } else {
        // Append new digit to the weight
        weight = double.parse(weight.toString() + value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Budi - 21114567IF',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'KG\'an - Kiloan Regular (3 Hari)',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Text(
                  'Cuci + Setrika',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Text(
                  'Selesai: Jumat 12/02/2025',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Total Biaya Laundry',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        'Rp. ${(weight * 7000).toStringAsFixed(0)},-',
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Masukkan Jumlah KG',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        '${weight.toStringAsFixed(1)} Kg',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Pastikan Jumlah Berat Laundry Sudah Benar',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...List.generate(9, (index) {
                      return _buildKey((index + 1).toString());
                    }),
                    _buildKey('0'),
                    _buildKey('.'),
                    _buildKey('↲'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        'Batal Order',
                        Colors.red,
                            () => Get.back(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildActionButton(
                        'Lanjut Pembayaran',
                        Colors.blue,
                            () {
                          if (weight > 0) {
                            // Tambahkan navigasi ke halaman pembayaran
                            Get.toNamed('/payment', arguments: {
                              'weight': weight,
                              'total': weight * 7000
                            });
                          } else {
                            Get.snackbar(
                              'Error',
                              'Berat harus lebih dari 0 kg',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () => _onKeyPressed(value),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,  // Ganti primary dengan backgroundColor
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }
}