import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: const Color(0xFF1B795E),
      ),
      body: Container(
        color: Colors.teal[50], // Warna latar belakang senada
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Budi - 21114567IF',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Ukuran font lebih kecil
            ),
            const SizedBox(height: 8),
            const Text(
              'Satuan - (3 Item - 72 Jam)',
              style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
            ),
            const SizedBox(height: 8),
            const Text(
              'Cuci + Setrika (Cherry Blossom)',
              style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
            ),
            const SizedBox(height: 8),
            const Text(
              'Selesai: Jumat 12/02/2022',
              style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF1B795E), // Warna latar belakang senada
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'KONFIRMASI ORDER LAUNDRY',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total Biaya Laundry',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Rp. 50.000,-',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PaymentOption(
              icon: Icons.account_balance_wallet,
              title: 'Gopay',
              subtitle: 'Pembayaran Menggunakan Uang Elektronik',
              color: Colors.blue,
            ),
            PaymentOption(
              icon: Icons.account_balance_wallet,
              title: 'Link Aja',
              subtitle: 'Pembayaran Menggunakan Uang Elektronik',
              color: Colors.red,
            ),
            PaymentOption(
              icon: Icons.account_balance_wallet,
              title: 'Dana',
              subtitle: 'Pembayaran Menggunakan Uang Elektronik',
              color: Colors.blueAccent,
            ),
            PaymentOption(
              icon: Icons.credit_card,
              title: 'Debit Payment',
              subtitle: 'Pembayaran Melalui Rekening Bank',
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle payment action
                Get.snackbar('Pembayaran Dikirim', 'Terima kasih telah melakukan pembayaran!',
                    backgroundColor: Colors.green,
                    colorText: Colors.white);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B795E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Kirim Pembayaran', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const PaymentOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle payment option selection
        Get.snackbar('Metode Pembayaran Dipilih', title);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
