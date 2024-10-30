import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pngtree-blue-washing-machine-for-laundry-logo-png-image_8517358.png',
      height: 300, // Ukuran gambar logo
    );
  }
}
