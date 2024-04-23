import 'package:get/get.dart';

class SplashController extends GetxController {
  final RxInt currentPage = 0.obs;
  RxList<Map<String, String>>  splashData = [
    {
      "text": "Nikmati kemudahan menjelajahi dunia literatur dengan perlindungan yang aman",
      "image": "assets/images/splash-1.png",
      "title": "Mudah dan Aman"
    },
    {
      "text":
          "kami di sini untuk Anda dan tim 24/7 kami siap membantu Anda",
      "image": "assets/images/splash-2.png",
      "title" : "Dukungan Penuh"
    },
  ].obs;
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
