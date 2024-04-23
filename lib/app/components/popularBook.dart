import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:surgabuku/app/data/models/response_book_popular.dart';
import 'package:surgabuku/app/routes/app_pages.dart';

class PopularBook extends StatelessWidget {
  const PopularBook({
    super.key,
    required this.dataBookPopular,
  });

  final List<DataBookPopular> dataBookPopular;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buku Terlaris",
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: GoogleFonts.poppins(
                        fontWeight: FontWeight.w900,
                      ).fontFamily,
                      fontSize: 16.0,
                      color: const Color(0xff09142E),
                    ),
                  ),
                  Text(
                    "Bacaan favorit banyak orang",
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ).fontFamily,
                      fontSize: 12.0,
                      color: const Color(0xff09142E),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () => null,
                  child: ClipOval(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.24,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: dataBookPopular
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.DETAILSBUKU, parameters: {"idbook" : e.bukuID.toString()}),
                              child: Container(
                                color: const Color(0xFFFFFFFF),
                                width: MediaQuery.of(context).size.width * 0.34,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 20,
                                      child: Image.network(
                                        e.coverBuku.toString(),
                                        fit: BoxFit.fill,
                                        width: MediaQuery.of(context).size.width *
                                            0.34,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        e.judul.toString(),
                                        style: TextStyle(
                                          height: 1.2,
                                          fontWeight: FontWeight.w900,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 14.0,
                                          color: const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
