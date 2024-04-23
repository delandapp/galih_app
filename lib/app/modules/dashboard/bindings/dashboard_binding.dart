import 'package:surgabuku/app/modules/book/controllers/book_controller.dart';
import 'package:surgabuku/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:surgabuku/app/modules/home/controllers/home_controller.dart';
import 'package:surgabuku/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BookController>(
      () => BookController(),
    );
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
