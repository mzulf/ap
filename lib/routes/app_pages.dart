import 'package:get/get.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/auth/signin_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/auth/phone_verification_screen.dart';
import '../screens/auth/otp_verification_screen.dart';
import '../screens/auth/reset_password_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/laundry/fragrance_selection_screen.dart';
import '../screens/laundry/service_order_screen.dart';
import '../screens/laundry/laundry_service_screen.dart';
import '../screens/auth/detail_item_satuan_screen.dart';
import '../screens/auth/detail_berat_screen.dart';
import '../screens/auth/detail_order_satuan.dart';
import '../screens/auth/detail_order_kg.dart';
import '../screens/auth/payment_screen.dart'; // Import Payment Screen
import '../screens/auth/riwayat_screen.dart';
import '../screens/auth/tagihan_screen.dart';
import '../screens/auth/notification_screen.dart'; // Import Notification Screen
import '../screens/auth/profile_screen.dart'; // Import Profile Screen
import '../screens/auth/ulasan_screen.dart'; // Import Ulasan Screen
import '../screens/auth/pengaturan_profil_screen.dart'; // Import Pengaturan Profil Screen
import '../screens/auth/set_location_screen.dart'; // Import Set Location Screen
import '../screens/auth/chat_screen.dart'; // Import Chat Screen

abstract class Routes {
  static const String WELCOME = '/welcome';
  static const String SIGNIN = '/signin';
  static const String SIGNUP = '/signup';
  static const String PHONE_VERIFICATION = '/phone-verification';
  static const String OTP_VERIFICATION = '/otp-verification';
  static const String RESET_PASSWORD = '/reset-password';
  static const String DASHBOARD = '/dashboard';
  static const String FRAGRANCE_SELECTION = '/fragrance-selection';
  static const String SERVICE_ORDER = '/service-order';
  static const String LAUNDRY_SERVICE = '/laundry-service';
  static const String DETAIL_ITEM_SATUAN = '/detail-item-satuan';
  static const String DETAIL_BERAT = '/detail-berat';
  static const String DETAIL_ORDER_SATUAN = '/detail-order-satuan';
  static const String DETAIL_ORDER_KG = '/detail-order-kg';
  static const String PAYMENT = '/payment'; // Rute untuk Payment Screen
  static const String RIWAYAT = '/riwayat';
  static const String TAGIHAN = '/tagihan';
  static const String NOTIFICATION = '/notification';
  static const String PROFILE = '/profile';
  static const String ULASAN = '/ulasan'; // Rute untuk halaman Ulasan
  static const String PENGATURAN_PROFIL = '/pengaturan-profil'; // Rute untuk Pengaturan Profil
  static const String SET_LOKASI = '/set-location'; // Rute untuk Set Lokasi
  static const String CHAT = '/chat'; // Rute untuk Chat
}

class AppPages {
  static const String INITIAL = Routes.WELCOME;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Routes.PHONE_VERIFICATION,
      page: () => const PhoneVerificationScreen(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION,
      page: () => const OTPVerificationScreen(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: Routes.FRAGRANCE_SELECTION,
      page: () => const FragranceSelectionScreen(),
    ),
    GetPage(
      name: Routes.SERVICE_ORDER,
      page: () => const ServiceOrderScreen(),
    ),
    GetPage(
      name: Routes.LAUNDRY_SERVICE,
      page: () => const LaundryServiceScreen(),
    ),
    GetPage(
      name: Routes.DETAIL_ITEM_SATUAN,
      page: () => const DetailItemSatuan(),
    ),
    GetPage(
      name: Routes.DETAIL_BERAT,
      page: () => const DetailBeratScreen(),
    ),
    GetPage(
      name: Routes.DETAIL_ORDER_SATUAN,
      page: () => const DetailOrderSatuan(),
    ),
    GetPage(
      name: Routes.DETAIL_ORDER_KG,
      page: () => const DetailOrderKg(),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => const PaymentScreen(), // Menambahkan rute untuk PaymentScreen
    ),
    GetPage(
      name: Routes.RIWAYAT,
      page: () => const RiwayatScreen(),
    ),
    GetPage(
      name: Routes.TAGIHAN,
      page: () => const TagihanScreen(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.ULASAN,
      page: () => const UlasanScreen(),
    ),
    GetPage(
      name: Routes.PENGATURAN_PROFIL,
      page: () => const PengaturanProfilScreen(),
    ),
    GetPage(
      name: Routes.SET_LOKASI,
      page: () => const SetLocationScreen(), // Menambahkan rute untuk SetLocationScreen
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatScreen(), // Menambahkan rute untuk ChatScreen
    ),
  ];
}
