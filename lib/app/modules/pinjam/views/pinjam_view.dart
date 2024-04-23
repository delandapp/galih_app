import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:surgabuku/app/components/laporan.dart';
import 'package:surgabuku/app/routes/app_pages.dart';

import '../controllers/pinjam_controller.dart';

class PinjamView extends GetView<PinjamController> {
  const PinjamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => Get.offAllNamed(Routes.DASHBOARD),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40),),padding: const EdgeInsets.all(2),child: const Icon(Icons.arrow_back,color: Colors.black,),),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: MyLaporan(data: state!.state1!,),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

}
