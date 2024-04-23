import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surgabuku/app/components/splash_content.dart';
import 'package:surgabuku/app/routes/app_pages.dart';
import '../../../data/constans/constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    controller.currentPage.value = value;
                    print("Test");
                  },
                  itemCount: controller.splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    title: controller.splashData[index]['title'],
                    image: controller.splashData[index]["image"],
                    text: controller.splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            controller.splashData.length,
                            (index) => Obx(
                                  () => AnimatedContainer(
                                    duration: kAnimationDuration,
                                    margin: const EdgeInsets.only(right: 5),
                                    height: 6,
                                    width: controller.currentPage.value == index
                                        ? 20
                                        : 6,
                                    decoration: BoxDecoration(
                                      color:
                                          controller.currentPage.value == index
                                              ? kPrimaryColor
                                              : const Color(0xFFD8D8D8),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                )),
                      ),
                      const Spacer(flex: 3),
                      ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 90, vertical: 15),
                            child: Text(
                                    'Memulai',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w900).fontFamily),
                                  ),
                          ),
                          style:
                              ElevatedButton.styleFrom(shape: const StadiumBorder())),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
