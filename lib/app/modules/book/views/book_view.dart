import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:surgabuku/app/components/bookSearch.dart';
import 'package:surgabuku/app/components/myBookSearch.dart';
import 'package:surgabuku/app/components/searchInput.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_back),
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                        flex: 16,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyInputSearch(
                            prefixIcon: Icons.search,
                            controller: controller,
                            controllerField: controller.search,
                            height: 10,
                            width: 10,
                            hintText: "Search Book",
                            autoFocus: false,
                          ),
                        ))
                  ],
                ),
              ),
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.84,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Obx(
          () => controller.searchLenght.value == 1
              ? controller.loading.value == false
                  ? controller.listDataBuku.isEmpty
                      ? const Center(child: Text("Tidak Ada Buku"))
                      : BookSearch(data: controller.listDataBuku)
                  : const Center(child: CircularProgressIndicator())
              : MyBookSearch(controller: controller, state: state!)
        ),),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
