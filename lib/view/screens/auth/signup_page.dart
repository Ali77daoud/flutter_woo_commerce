import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/auth_controller.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/strings.dart';
import 'package:flutter_woocommerce/view/widget/button_widget.dart';
import 'package:flutter_woocommerce/view/widget/circle_indicator_widget.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNamekey = TextEditingController();
  final TextEditingController lastNamekey = TextEditingController();
  final TextEditingController emailkey = TextEditingController();
  final TextEditingController userNamekey = TextEditingController();
  final TextEditingController passkey = TextEditingController();

  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: GetBuilder<AuthController>(builder: (_) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 40.0,
                            child:
                                Image.asset('assets/images/tsaooq-logo.png')),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        margin: const EdgeInsets.symmetric(
                            vertical: 85, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 10),
                                blurRadius: 20)
                          ],
                        ),
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                TextWidget(
                                    text: "إنشاء حساب",
                                    color: blackColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    maxline: 1),
                                const SizedBox(height: 20),
                                ///////////////// first name
                                TextFormField(
                                  controller: firstNamekey,
                                  keyboardType: TextInputType.name,

                                  ///
                                  // onSaved: (input) => _username = input,
                                  //
                                  validator: (input) => input!.isEmpty
                                      ? "أدخل الاسم الأول من فضلك"
                                      : null,
                                  decoration: const InputDecoration(
                                    labelText: 'الاسم الأول',
                                    prefixIcon: Icon(
                                      Icons.co_present_rounded,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ///////////// last name
                                TextFormField(
                                  controller: lastNamekey,
                                  keyboardType: TextInputType.name,

                                  ///
                                  // onSaved: (input) => _username = input,
                                  //
                                  validator: (input) => input!.isEmpty
                                      ? "أدخل الاسم الأخير من فضلك"
                                      : null,
                                  decoration: const InputDecoration(
                                    labelText: 'الاسم الأخير',
                                    prefixIcon: Icon(
                                      Icons.co_present_rounded,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                /////////////// email textform
                                TextFormField(
                                  controller: emailkey,
                                  keyboardType: TextInputType.emailAddress,

                                  ///
                                  // onSaved: (input) => _username = input,
                                  //
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'أدخل البريد الإلكتروني من فضلك';
                                    } else if (!RegExp(validationEmail)
                                        .hasMatch(value)) {
                                      return 'أدخل بريد صحيح من فضلك';
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'الإيميل',
                                    prefixIcon: Icon(
                                      Icons.email,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                //////////// username textform
                                TextFormField(
                                  controller: userNamekey,
                                  keyboardType: TextInputType.name,

                                  ///
                                  // onSaved: (input) => _username = input,
                                  //
                                  validator: (input) => input!.isEmpty
                                      ? "أدخل اسم المستخدم من فضلك"
                                      : null,
                                  decoration: const InputDecoration(
                                    labelText: 'إسم المستخدم',
                                    prefixIcon: Icon(
                                      Icons.person,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                //////////// password textform
                                TextFormField(
                                  controller: passkey,
                                  keyboardType: TextInputType.text,
                                  obscureText: authController.hidePassword,
                                  // onSaved: (input) => _password = input,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'أدخل كلمة المرور من فضلك';
                                    } else if (value.length < 8) {
                                      return 'أدخل كلمة مرور من ثمانية حرف ';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "كلمة السر",
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        authController.changeHidePassword();
                                      },
                                      color: Colors.green.withOpacity(0.6),
                                      icon: Icon(authController.hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                //////////////////////////////////////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: TextWidget(
                                            text: "لدي حساب بالفعل",
                                            color: greyColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                            textDecoration:
                                                TextDecoration.underline,
                                            maxline: 1),
                                        onTap: () async {
                                          Get.offNamed(Routes.loginScreen);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                ButtonWidget(
                                    onTap: () async {
                                      if (formKey.currentState!.validate()) {
                                        authController.showCircleIndicator();
                                        await authController.registerApi(
                                            email: emailkey.text,
                                            password: passkey.text,
                                            firstName: firstNamekey.text,
                                            lastName: lastNamekey.text,
                                            userName: userNamekey.text);
                                      }
                                    },
                                    text: TextWidget(
                                        text: "إنشاء حساب",
                                        color: whiteColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.center,
                                        maxline: 1),
                                    color: primaryColor,
                                    radius: 10,
                                    width: double.infinity,
                                    height: 50),
                                authController.isCircleShown
                                    ? const CircleIndicatorWidget()
                                    : Container(),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })),
        ),
      ),
    );
  }
}
