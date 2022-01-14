import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedevs_flutter_project/app/modules/sign_up/controllers/signup_controller.dart';
import 'package:wedevs_flutter_project/app/routes/app_pages.dart';
import 'package:wedevs_flutter_project/app/utils/helper/build_circle.dart';
import 'package:wedevs_flutter_project/app/utils/helper/fade_animation.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';


class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpScreenController>(
        builder: (signUpController) => Scaffold(
            backgroundColor: CustomColors.KAshBg1,
            body: SingleChildScrollView(
              child: Obx(() {
                if (signUpController.signUpProcess.value) {
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
                        height: 30.0,
                      ),
                      FadeAnimation(
                        2,
                        Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(90),
                            ),
                          ),
                          color: Colors.white,
                          child: SizedBox(
                            height: 122,
                            width: 122,
                            child: Stack(
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: SvgPicture.asset(
                                      'assets/icons/ic_name.svg',
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 4,
                                  child: buildCircle(
                                    color: CustomColors.KReddishColor,
                                    all: 3,
                                    child: buildCircle(
                                      color: CustomColors.KReddishColor,
                                      all: 8,
                                      child: SvgPicture.asset(
                                        'assets/icons/ic_camera.svg',
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: signUpController.formKey.value,
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
                                      keyboardType: TextInputType.text,
                                      controller:
                                          signUpController.nameTextController,
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
                                            'assets/icons/ic_name.svg',
                                            width: 10,
                                            height: 10,
                                          ),
                                        ),
                                        hintText: 'Name',
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
                                              ? "Name is required"
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
                                      keyboardType: TextInputType.emailAddress,
                                      controller:
                                          signUpController.emailTextController,
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
                                      controller: signUpController
                                          .passwordTextController,
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
                                        controller: signUpController
                                            .confirmPasswordTextController,
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
                                          enabledBorder:
                                              const OutlineInputBorder(
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
                                          hintText: 'Confirm Password',
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
                                        validator: (String? value) {
                                          if (value!.trim().isEmpty) {
                                            return "Confirm Password is required";
                                          }
                                          if (value !=
                                              signUpController
                                                  .passwordTextController
                                                  .value
                                                  .text) {
                                            return "Password not match";
                                          }
                                          return null;
                                        }
                                        //value!.trim().isEmpty ? "Confirm Password is required" : value != signUpController.confirmPasswordTextController.text ? "Password not match" : null,
                                        ),
                                  )),
                              const SizedBox(
                                height: 50,
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
                                          "Sign Up",
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
                                  if (signUpController
                                      .formKey.value.currentState!
                                      .validate()) {
                                    signUpController.signUp();
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
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          fontSize: 17,
                                          color: CustomColors.KDarkish,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Already have an account?',
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: 17,
                                              color: CustomColors.KDarkish,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          TextSpan(
                                              text: ' Login',
                                              style: GoogleFonts.roboto(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                                fontSize: 17,
                                                color: CustomColors.KDarkishBlue,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                              ),
                                          )
                                        ],
                                      ),
                                    )
                                    ),
                                onTap: () {
                                  Get.back();
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



