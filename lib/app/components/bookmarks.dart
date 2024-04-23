import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surgabuku/app/data/models/response_koleksi.dart';
import 'package:surgabuku/app/routes/app_pages.dart';

class MyBookmarks extends StatelessWidget {
  const MyBookmarks({super.key,required this.data});
  final List<DataKoleksi> data;

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.51, mainAxisSpacing: 5, crossAxisSpacing: 1),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILSBUKU, parameters: {"idbook" : data[index].bukuID.toString()}),
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: SizedBox(
                      height: 165,
                      width: double.infinity,
                      child: Image.network(data[index].coverBuku.toString(),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text(data[index].judul.toString(),style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily),overflow: TextOverflow.ellipsis,maxLines: 1,),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}