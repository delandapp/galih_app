import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surgabuku/app/components/bookmarks.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2)),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 20,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: FittedBox(child: Text("Bookmark", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily),))
                    ),
                    const Expanded(flex: 7, child: SizedBox())
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
                      child: MyBookmarks(
                        data: state!,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
 
  }
}
