import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'package:get/get.dart';
import 'package:surgabuku/app/data/constans/validation.dart';

import '../controllers/register_controller.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
    if(!PasswordValidator.isValidPasswordUpper(password: value)){
      return 'Password must contain at least 1 uppercase letter';
    }
    if(!PasswordValidator.isValidPasswordSymbol(password: value)){
      return 'Password must contain at least 1 Sysmbol';
    }
    return null;
  });
   ValidationBuilder confirmPassword(TextEditingController controller) {
    return this..add((value) {
      if (value != controller.text.toString()) {
        return 'Passwords do not match';
      }
      return null;
    });
  }
}

final validatorPassword = ValidationBuilder().minLength(8, 'Password must be at least 8 characters').password().build();
final validator = ValidationBuilder().email().custom().build();

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Form(
      key: controller.formKey,
      child: Container(
        color: Color(0xFFF2F2F2),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.blue.shade400),
            ),
            Expanded(child: SizedBox()),
            Text(
              'Silahkan Buat akun Anda dan nikmati petualangan literatur tanpa batas!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Expanded(child: SizedBox()),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          validator: ValidationBuilder().minLength(6).build(),
                          controller: controller.firstname,
                          autocorrect: false,
                          autofocus: true,
                          enableInteractiveSelection: false,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: "galih",
                            filled: true,
                            label: Text("First Name"),
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
                          ))),
                  SizedBox(width: 20),
                  Expanded(
                      child: TextFormField(
                          validator: ValidationBuilder().minLength(6).build(),
                          controller: controller.lastname,
                          autocorrect: false,
                          autofocus: false,
                          enableInteractiveSelection: false,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: "putra",
                            filled: true,
                            label: Text("Last Name"),
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
                ],
              ),
            ),
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
                        validator: ValidationBuilder().minLength(5).build(),
                        controller: controller.username,
                        autocorrect: false,
                        autofocus: false,
                        enableInteractiveSelection: false,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "@yoghairgikurniawan",
                          filled: true,
                          label: Text("Username"),
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
                        autofocus: false,
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
                        obscureText: controller.isPasswordHidden.value,
                        obscuringCharacter: '*',
                        autocorrect: false,
                        autofocus: false,
                        enableInteractiveSelection: false,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                              color: Colors.black,
                            ),
                            onTap: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
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
                      validator: ValidationBuilder().confirmPassword(controller.password).build(),
                        obscureText: controller.isPasswordConfirmHidden.value,
                        obscuringCharacter: '*',
                        autocorrect: false,
                        autofocus: false,
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
                          hintText: "Confirm Password",
                          label: Text("Confirm Password"),
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
            Expanded(child: SizedBox()),
            Obx(() => ElevatedButton(
                onPressed: () {
                  controller.postRegister();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: controller.loading.value
                      ? CircularProgressIndicator()
                      : Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                ),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()))),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah memiliki akun?',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                GestureDetector(
                    child: Text('masuk',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade300)),
                    onTap: () => Get.back(),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
