import 'package:flutter/material.dart';
import 'package:surgabuku/app/data/constans/endpoint.dart';
import 'package:surgabuku/app/data/models/response_koleksi.dart';
import 'package:surgabuku/app/data/provider/api_provider.dart';
import 'package:surgabuku/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookmarkController extends GetxController with StateMixin<List<DataKoleksi>>{
  //TODO: Implement HomeController
  
  final RxString username = StorageProvider.read(StorageKey.username).obs;
  final RxInt currentPage = 0.obs;
  final TextEditingController search = TextEditingController();



  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> getData() async{
    change(null, status: RxStatus.loading());

    try {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        final idUser = StorageProvider.read(StorageKey.idUser);
        final response = await ApiProvider.instance().get("${Endpoint.koleksi}/${idUser}",options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        if (response.statusCode == 200) {
          final ResponseKoleksi responseKoleksi = ResponseKoleksi.fromJson(response.data);
          if(responseKoleksi.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(responseKoleksi.data, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error("Gagal mengambil data"));
        }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  String sapaanBerdasarkanWaktu() {
    var jam = DateTime.now().hour;
    if (jam >= 4 && jam < 10) {
      return 'Selamat Pagi';
    } else if (jam >= 10 && jam < 15) {
      return 'Selamat Siang';
    } else if (jam >= 15 && jam < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }
}
