import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:surgabuku/app/data/constans/endpoint.dart';
import 'package:surgabuku/app/data/provider/api_provider.dart';
import 'package:surgabuku/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  
  //TODO: Implement RegisterController
  var isPasswordHidden= true.obs;
  var isPasswordConfirmHidden= true.obs;
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;

  postRegister() async {

    loading(true);
    

    try {

      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: {
              "firstname" : firstname.text.toString(),
              "lastname" : lastname.text.toString(),
              "username" : username.text.toString(),
              "password" : password.text.toString(),
              "email" : email.text.toString()
            });

        if (response.statusCode == 201) {
          Get.snackbar("Information", "Register Succes", backgroundColor: Colors.green);
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar("Sorry", "Register Gagal", backgroundColor: Colors.red);
        }
      }
      loading(false);

    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }

    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }


  
}
