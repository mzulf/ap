import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B795E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B795E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text('Riwayat', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHistoryItem('Kiloan Express', '5,5Kg', 'Budi (IF2111062021)', '14:00', '18:00'),
          const SizedBox(height: 16),
          _buildHistoryItem('Kiloan Regular', '2,5Kg', 'Budi (IF2111062022)', 'Selesai : Senin 05/02/2022'),
          const SizedBox(height: 16),
          _buildHistoryItem('Satuan Laundry', '10 Pcs', 'Budi (IF2111062022)', 'Selesai : Kamis 07/02/2022'),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String title, String weight, String customer, String startTime, [String? endTime]) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text(weight, style: const TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(customer, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(startTime, style: const TextStyle(color: Colors.white, fontSize: 14)),
                if (endTime != null) Text(endTime, style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Text(
              'Selesai',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}