import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedevs_flutter_project/app/modules/login/controllers/login_screen_controller.dart';
import 'package:wedevs_flutter_project/app/routes/app_pages.dart';
import 'package:wedevs_flutter_project/app/utils/helper/fade_animation.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';
import 'package:wedevs_flutter_project/app/utils/res/dimens.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        builder: (loginController) => Scaffold(
            backgroundColor: CustomColors.KAshBg1,
            body: SingleChildScrollView(
              child: Obx(() {
                if (loginController.loginProcess.value) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: SpinKitPulse(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 150.0,
                      ),
                      FadeAnimation(
                          1,
                          Container(
                            width: 165,
                            height: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/dokan_logo_color.png'))),
                          )),
                      FadeAnimation(
                          1.6,
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Center(
                                child: Text(
                              "Sign In",
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 25,
                                color: CustomColors.KDarkBlackColor,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            )),
                          )),
                      Form(
                        key: loginController.formKey.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
                              FadeAnimation(
                                  2,
                                  Material(
                                    elevation: 2,
                                    shadowColor: Colors.blue.shade100,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller:
                                          loginController.emailTextController,
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),

                                        //fillColor: Colors.white,
                                        //filled: true,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                          15.0,
                                          15.0,
                                          0.0,
                                          5.0,
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_email.svg',
                                            width: 10,
                                            height: 10,
                                          ),
                                        ),
                                        hintText: 'Email',
                                        hintStyle: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          fontSize: 17,
                                          color: CustomColors.KBlackGrey,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),

                                        errorStyle: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      validator: (String? value) =>
                                          value!.trim().isEmpty
                                              ? "Email is required"
                                              : null,
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                  2,
                                  Material(
                                    elevation: 2,
                                    shadowColor: Colors.blue.shade100,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: loginController
                                          .passwordTextController,
                                      obscureText:
                                          loginController.obscureText.value,
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),

                                        //fillColor: Colors.white,
                                        //filled: true,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                          15.0,
                                          15.0,
                                          0.0,
                                          5.0,
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_password.svg',
                                            width: 10,
                                            height: 10,
                                          ),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => loginController
                                              .passWordVisibility(),
                                          child: Icon(
                                              loginController.obscureText.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                        ),

                                        hintText: 'Password',
                                        hintStyle: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          fontSize: 17,
                                          color: CustomColors.KBlackGrey,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),

                                        errorStyle: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      validator: (String? value) =>
                                          value!.trim().isEmpty
                                              ? "Password is required"
                                              : null,
                                    ),
                                  )
                                  // Container(
                                  //   height: 60,
                                  //   alignment: Alignment.centerLeft,
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(10),
                                  //       boxShadow: const [
                                  //         BoxShadow(
                                  //           color: Colors.black12,
                                  //           offset: Offset(1, 2),
                                  //         )
                                  //       ]),
                                  //   child: TextFormField(
                                  //     keyboardType: TextInputType.text,
                                  //     obscureText:
                                  //         loginController.obscureText.value,
                                  //     controller: loginController
                                  //         .passwordTextController,
                                  //     style: GoogleFonts.roboto(
                                  //       textStyle: Theme.of(context)
                                  //           .textTheme
                                  //           .headline4,
                                  //       fontSize: 17,
                                  //       color: Colors.black,
                                  //       fontStyle: FontStyle.normal,
                                  //     ),
                                  //     decoration: InputDecoration(
                                  //       border: InputBorder.none,
                                  //       contentPadding:
                                  //           const EdgeInsets.only(top: 14),
                                  //       prefixIcon: Padding(
                                  //         padding: const EdgeInsets.all(13.0),
                                  //         child: SvgPicture.asset(
                                  //           'assets/icons/ic_password.svg',
                                  //           width: 10,
                                  //           height: 10,
                                  //         ),
                                  //       ),
                                  //       hintText: 'Password',
                                  //       hintStyle: GoogleFonts.roboto(
                                  //         textStyle: Theme.of(context)
                                  //             .textTheme
                                  //             .headline4,
                                  //         fontSize: 17,
                                  //         color: CustomColors.KBlackGrey,
                                  //         fontWeight: FontWeight.w400,
                                  //         fontStyle: FontStyle.normal,
                                  //       ),
                                  //       errorStyle: GoogleFonts.roboto(
                                  //         textStyle: Theme.of(context).textTheme.headline4,
                                  //         fontSize: 14,
                                  //         color: Colors.red,
                                  //         fontStyle: FontStyle.normal,
                                  //       ),
                                  //       suffixIcon: InkWell(
                                  //         onTap: () => loginController
                                  //             .passWordVisibility(),
                                  //         child: Icon(
                                  //             loginController.obscureText.value
                                  //                 ? Icons.visibility_off
                                  //                 : Icons.visibility),
                                  //       ),
                                  //     ),
                                  //     validator: (String? value) =>
                                  //         value!.trim().isEmpty
                                  //             ? "Password is require"
                                  //             : null,
                                  //   ),
                                  // )
                                  ),
                              FadeAnimation(
                                2,
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    child: Text(
                                      "Forget Password ?",
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 13,
                                        color: CustomColors.KBlackGrey,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                child: FadeAnimation(
                                    2,
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: CustomColors.KRedOrange),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    )),
                                onTap: () async {
                                  if (loginController
                                      .formKey.value.currentState!
                                      .validate()) {
                                    loginController.login();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              FadeAnimation(
                                  2,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Image.asset(
                                              "assets/images/facebook_logo.png"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Image.asset(
                                              "assets/images/google_logo.png"),
                                        ),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                child: FadeAnimation(
                                    1.5,
                                    Text(
                                      "Create New Account",
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 17,
                                        color: CustomColors.KDarkish,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    )),
                                onTap: () {
                                  Get.toNamed(Routes.SIGNUP);
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
              }),
            )));
  }
}
