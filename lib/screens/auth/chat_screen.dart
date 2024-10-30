import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: const Color(0xFF1B795E),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Contoh jumlah pesan
              itemBuilder: (context, index) {
                // Menggunakan index genap untuk chat pengguna, dan ganjil untuk chat kurir
                bool isUserMessage = index % 2 == 0;

                return Align(
                  alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: isUserMessage ? 50 : 8,
                      right: isUserMessage ? 8 : 50,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUserMessage ? const Color(0xFF1B795E) : const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Pesan ${index + 1}',
                      style: TextStyle(
                        color: isUserMessage ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ketik pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Tangani aksi kirim
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
