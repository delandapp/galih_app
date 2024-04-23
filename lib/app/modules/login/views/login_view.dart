import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';

import 'package:get/get.dart';
import 'package:surgabuku/app/data/constans/validation.dart';
import 'package:surgabuku/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
}

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      color: Color(0xFFF2F2F2),
      padding: EdgeInsets.all(50),
      alignment: Alignment.center,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.blue.shade400),
            ),
            SizedBox(height: 40),
            Text(
              'Silahkan Masuk ke akun anda dan nikmati petualangan literatur tanpa batas!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                    TextFormField(
                        validator: validator,
                        controller: controller.email,
                        autocorrect: false,
                        autofocus: true,
                        enableInteractiveSelection: false,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "galih@smk.belajar.id",
                          filled: true,
                          label: Text("Email"),
                          // border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 255, 17, 0))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 255, 17, 0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue.shade400)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ))
                  ]),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                    Obx(() => TextFormField(
                        validator: validatorPassword,
                        controller: controller.password,
                        obscureText: controller.isPasswordConfirmHidden.value,
                        obscuringCharacter: '*',
                        autocorrect: false,
                        autofocus: true,
                        enableInteractiveSelection: false,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordConfirmHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                              color: Colors.black,
                            ),
                            onTap: () {
                              controller.isPasswordConfirmHidden.value =
                                  !controller.isPasswordConfirmHidden.value;
                            },
                          ),
                          hintText: "Password",
                          label: Text("Password"),
                          filled: true,
                          // border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 255, 17, 0))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 255, 17, 0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue.shade400)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        )))
                  ]),
            ),
            SizedBox(height: 70),
            Obx(
              () => ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    child: controller.loading.value
                        ? CircularProgressIndicator()
                        : Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                  ),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder())),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum memiliki akun?',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                    child: Text('daftar disini',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade300)),
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(0, 0)),
                        padding: MaterialStatePropertyAll(EdgeInsets.all(2)))),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
