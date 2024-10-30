// File: test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sijemur/main.dart'; // Pastikan mengimpor dari sijemur

void main() {
  testWidgets('Initial route should be Welcome Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the initial route displays the Welcome Screen
    expect(find.text('Welcome'), findsOneWidget); // Sesuaikan dengan judul yang ada di WelcomeScreen
  });

  // Contoh pengujian untuk counter jika Anda memilikinya
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Pastikan ada elemen yang sesuai
    expect(find.text('0'), findsOneWidget); // Pastikan ada tampilan yang menunjukkan '0'

    // Simulasikan ketukan pada ikon tambah
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifikasi nilai counter setelah ditambah
    expect(find.text('1'), findsOneWidget);
  });
}
