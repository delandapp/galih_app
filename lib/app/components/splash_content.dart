import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/constans/constants.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
    this.title,
  }) : super(key: key);
  final String? text, image, title;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Spacer(),
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: 32,
              color: kPrimaryColor,
              fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w900).fontFamily,
            ),
          ),
          const Spacer(),
          Text(
            widget.text!,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          const Spacer(flex: 2),
          Image.asset(
            widget.image!,
            height: 265,
            width: MediaQuery.of(context).size.width * 1,
          ),
        ],
      ),
    );
  }
}
