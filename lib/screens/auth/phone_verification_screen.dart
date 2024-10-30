import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  String selectedCountryCode = '+62';
  bool isLoading = false;
  bool isValid = false;

  // Tambahkan lebih banyak kode negara
  final List<Map<String, String>> countryCodes = [
    {'name': 'Indonesia', 'code': '+62', 'flag': '🇮🇩', 'pattern': r'^8[1-9][0-9]{7,10}$'},
    {'name': 'United States', 'code': '+1', 'flag': '🇺🇸', 'pattern': r'^[2-9][0-9]{9}$'},
    {'name': 'United Kingdom', 'code': '+44', 'flag': '🇬🇧', 'pattern': r'^7[0-9]{9}$'},
    {'name': 'Singapore', 'code': '+65', 'flag': '🇸🇬', 'pattern': r'^[689][0-9]{7}$'},
    {'name': 'Malaysia', 'code': '+60', 'flag': '🇲🇾', 'pattern': r'^1[0-9]{8}$'},
  ];

  String? _getPhonePattern() {
    final country = countryCodes.firstWhere(
          (c) => c['code'] == selectedCountryCode,
      orElse: () => countryCodes.first,
    );
    return country['pattern'];
  }

  void validatePhone(String value) {
    final pattern = _getPhonePattern();
    if (pattern != null) {
      setState(() {
        isValid = RegExp(pattern).hasMatch(value);
      });
    }
  }

  Future<void> sendOTP() async {
    if (!isValid) {
      Get.snackbar(
        'Error',
        'Please enter a valid phone number',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final phoneNumber = '$selectedCountryCode${phoneController.text}';
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Get.snackbar(
            'Success',
            'Phone number verified automatically',
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offAllNamed('/dashboard');
        },
        verificationFailed: (FirebaseAuthException e) {
          String errorMessage = 'Verification failed';
          if (e.code == 'invalid-phone-number') {
            errorMessage = 'Invalid phone number format';
          } else if (e.code == 'too-many-requests') {
            errorMessage = 'Too many attempts. Please try again later';
          }
          Get.snackbar(
            'Error',
            errorMessage,
            backgroundColor: Colors.red.withOpacity(0.8),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        codeSent: (String verId, int? resendToken) {
          Get.toNamed('/otp-verification', arguments: {
            'verificationId': verId,
            'phoneNumber': phoneNumber,
            'resendToken': resendToken,
          });
        },
        codeAutoRetrievalTimeout: (String verId) {
          // Handle timeout
        },
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send OTP: $e',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              print('Back button pressed'); // Debugging
              Get.back(); // Navigasi kembali ke halaman sebelumnya
              // Alternatif: Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please enter your mobile phone number',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedCountryCode,
                            icon: const Icon(Icons.arrow_drop_down),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            items: countryCodes.map((country) {
                              return DropdownMenuItem<String>(
                                value: country['code'],
                                child: Row(
                                  children: [
                                    Text(country['flag'] ?? ''),
                                    const SizedBox(width: 8),
                                    Text(
                                      country['code'] ?? '',
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountryCode = value ?? '+62';
                                validatePhone(phoneController.text);
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            border: InputBorder.none,
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: isValid
                                ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                                : null,
                          ),
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            validatePhone(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Format: ${selectedCountryCode == '+62' ? '81234567890' : 'Enter valid number'}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: isLoading || !isValid ? null : sendOTP,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                        : const Text(
                      'SEND OTP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
