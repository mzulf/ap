import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOrderSatuan extends StatelessWidget {
  const DetailOrderSatuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Contoh data item yang bisa didapat dari arguments atau state management
    final List<Map<String, dynamic>> items = [
      {'name': 'Jaket', 'price': 10000, 'qty': 1},
      {'name': 'Jas', 'price': 25000, 'qty': 1},
      {'name': 'Selimut', 'price': 15000, 'qty': 1},
    ];

    final total = items.fold<int>(
      0,
          (sum, item) => sum + (item['price'] as int) * (item['qty'] as int),
    );

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Budi - 21114567IF',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Text(
                  'Satuan - (3 Item - 72 Jam)',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Text(
                  'Cuci + Setrika',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Text(
                  'Selesai: Senin 25/02/2025',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'KONFIRMASI ORDER LAUNDRY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total Biaya Laundry',
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                      Text(
                        'Rp. ${total.toString()},-',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ...items.map((item) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Qty: ${item['qty']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        'Rp. ${item['price']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )).toList(),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'BATAL',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed('/payment', arguments: {
                      'total': total,
                      'items': items,
                    }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1a237e),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'BAYAR',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
