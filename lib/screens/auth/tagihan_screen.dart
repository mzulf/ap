import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagihanScreen extends StatelessWidget {
  const TagihanScreen({Key? key}) : super(key: key);

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
        title: const Text('Tagihan', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildBillItem(
              'Kiloan Super Regular',
              '3,0Kg (Rp.35.000)',
              'Budi (IF2111062021)',
              'Sabtu 11/02/2022',
              'Minggu 12/02/2022',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillItem(String title, String weight, String customer, String startDate, String endDate) {
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
                Text(startDate, style: const TextStyle(color: Colors.white, fontSize: 14)),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                Text(endDate, style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Text(
              'Menunggu Pembayaran',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}