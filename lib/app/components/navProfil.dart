import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class navProfil extends StatelessWidget {
  const navProfil(
      {super.key, required this.title, this.icon, this.subtitle = ""});
  final String title;
  final String subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        ClipOval(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: const Color(0xFFFF7878),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily:
                    GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Expanded(flex: 1, child: SizedBox()),
        Text(
          "halo, ${subtitle}",
          style: TextStyle(
            fontSize: 20,
            fontFamily:
                GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
            color: Colors.black,
          ),
        ),
        const Expanded(flex: 20, child: SizedBox())
      ],
    );
    // return ListTile(
    //   title: Text(
    //     title,
    //     style: TextStyle(
    //       fontSize: 14,
    //       fontFamily:
    //           GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
    //       color: Colors.black,
    //     ),
    //   ),
    //   subtitle: Text(
    //     subtitle,
    //     style: TextStyle(
    //       fontSize: 20,
    //       fontFamily:
    //           GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
    //       color: Colors.black,
    //     ),
    //   ),
    // );
  }
}
