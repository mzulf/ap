import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B795E),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text('Pemberitahuan', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Ubah menjadi center
          children: [
            const Text(
              'Notifikasi',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Menambahkan center alignment
            ),
            const SizedBox(height: 20),
            Expanded( // Gunakan Expanded agar daftar notifikasi bisa mengisi ruang yang tersisa
              child: ListView(
                children: [
                  _buildNotificationItem(
                    icon: Icons.local_laundry_service,
                    text: 'Laundry Anda Sedang Dalam Proses',
                    time: '14.20',
                  ),
                  _buildNotificationItem(
                    icon: Icons.local_shipping,
                    text: 'Laundry Anda Sedang Dalam Perjalanan',
                    time: '10.30',
                  ),
                  _buildNotificationItem(
                    icon: Icons.check_circle,
                    text: 'Laundry Anda Sudah Diterima',
                    time: '12.00',
                  ),
                  _buildNotificationItem(
                    icon: Icons.inventory,
                    text: 'Laundry Anda Sedang Dipacking',
                    time: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({required IconData icon, required String text, required String time}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          if (time.isNotEmpty)
            Text(
              time,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
        ],
      ),
    );
  }
}
