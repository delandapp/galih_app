import 'package:get/get.dart';
import 'package:surgabuku/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surgabuku/app/routes/app_pages.dart';

class BuildSearchSection extends StatelessWidget {
  const BuildSearchSection({
    super.key,
    required this.data,
  });

  final DataBuku data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.27,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data.buku! 
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(right: 10),
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
        )
      ],
    );
  }
}
