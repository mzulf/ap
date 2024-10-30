import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailItemSatuan extends StatefulWidget {
  const DetailItemSatuan({Key? key}) : super(key: key);

  @override
  _DetailItemSatuanState createState() => _DetailItemSatuanState();
}

class _DetailItemSatuanState extends State<DetailItemSatuan> {
  // List untuk menyimpan status pemilihan item
  final List<bool> _selectedItems = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF26AB7E), // Warna hijau seperti di design
      appBar: AppBar(
        backgroundColor: const Color(0xFF26AB7E),
        elevation: 0,
        title: const Text(
          'Detail Item Satuan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.white),
              Text(
                'Kembali',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          onPressed: () => Get.back(),
        ),
        leadingWidth: 100,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan Nama Item',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildItemCard('Kemeja', 'Rp.500,-', 0),
                _buildItemCard('Celana Bahan', 'Rp.1000,-', 1),
                _buildItemCard('Jaket', 'Rp.1000,-', 2, isDark: true),
                _buildItemCard('Kaos', 'Rp.500,-', 3),
                _buildItemCard('CD / BRA', 'Rp.300,-', 4),
                _buildItemCard('Jas', 'Rp.25000,-', 5, isDark: true),
                _buildItemCard('Selimut', 'Rp.15000,-', 6, isDark: true),
                const SizedBox(height: 16), // Memberikan jarak di bawah item list
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Budi Doremi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('Layanan Satuan'),
                    Text('3 Item Satuan'),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Logika untuk hapus item (jika ada)
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.black54,
                    ),
                  ),
                ),
                // Tombol Konfirmasi di dalam kolom Budi Doremi
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman Detail Order Satuan
                    Get.toNamed('/detail-order-satuan', arguments: {
                      'selectedItems': _selectedItems.where((selected) => selected).toList(),
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1a237e), // Warna tombol
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  ),
                  child: const Text(
                    'Konfirmasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(String itemName, String price, int index, {bool isDark = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Mengubah status pemilihan item dan memperbarui tampilan
                setState(() {
                  _selectedItems[index] = !_selectedItems[index];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedItems[index]
                    ? (isDark ? const Color(0xFF1F2937) : const Color(0xFF60A5FA))
                    : (isDark ? const Color(0xFF4B5563) : const Color(0xFF60A5FA)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text(
                'Tambahkan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
