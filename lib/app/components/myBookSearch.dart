import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surgabuku/app/components/bookSearchSection.dart';
import 'package:surgabuku/app/data/models/response_buku.dart';
import '../components/slider.dart';
import 'package:surgabuku/app/modules/book/controllers/book_controller.dart';

class MyBookSearch extends StatelessWidget {
  const MyBookSearch(
      {super.key, required this.controller, required this.state});
  final BookController controller;
  final List<DataBuku> state;

  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20,left: widthFullBody * 0.05,bottom: 10),
          child: Text(
            "Dipilih Untukmu",
            style: TextStyle(
              height: 1.2,
              fontFamily: GoogleFonts.poppins(
                fontWeight: FontWeight.w900,
              ).fontFamily,
              fontSize: 16.0,
              color: const Color(0xff09142E),
            ),
          ),
        ),
        MySlider(),
        SizedBox(height: heightFullBody * 0.01,),
        Column(
          children: state.map((data) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.03),
              child: SizedBox(
                width: widthFullBody,
                height: heightFullBody * 0.29,
                child: BuildSearchSection(data: data),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
