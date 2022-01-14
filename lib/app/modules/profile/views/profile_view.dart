import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedevs_flutter_project/app/modules/profile/controllers/profile_screen_controllers.dart';
import 'package:wedevs_flutter_project/app/utils/helper/build_circle.dart';
import 'package:wedevs_flutter_project/app/utils/helper/fade_animation.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
        builder: (profileScreenController) => SafeArea(
              top: true,
              bottom: true,
              left: true,
              right: true,
              child: Scaffold(
                backgroundColor: CustomColors.KAshBg1,
                appBar: appBar(context),
                body: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate([
                      const SizedBox(
                        height: 30.0,
                      ),
                      FadeAnimation(
                        2,
                        Center(
                          child: DottedBorder(
                            borderType: BorderType.Oval,
                            color: CustomColors.KRedOrange,
                            dashPattern: [3, 4],
                            strokeWidth: 1.0,
                            strokeCap: StrokeCap.butt,
                            radius: Radius.circular(90),
                            padding: EdgeInsets.all(6),
                            child: Card(
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      FadeAnimation(
                        2,
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'John Smith',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: CustomColors.KDarkBlackColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'info@johnsmith.com',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: CustomColors.KDarkGreyBlackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      FadeAnimation(
                          2,
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Obx((){
                                return ListView(
                                  shrinkWrap: true,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Account",
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            color: CustomColors.KDarkBlackColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_name.svg',
                                          width: 20.0,
                                          height: 20.0,
                                        ),
                                      ),
                                      minLeadingWidth: 15.0,
                                      trailing: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          child: profileScreenController.expandingListValue[0] == false ? SvgPicture.asset(
                                            'assets/icons/ic_arrow_right.svg',
                                            width: 15.0,
                                            height: 15.0,
                                          ) : SvgPicture.asset(
                                            'assets/icons/ic_arrow_down.svg',
                                            width: 10.0,
                                            height: 10.0,
                                          ),
                                          onTap: () => profileScreenController.expandedBox(profileScreenController.expandingListValue[0],0),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      color: CustomColors.KDarkGreyColor,
                                      thickness: 0.5,
                                      endIndent: 25.0,
                                      indent: 25.0,
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Passwords",
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            color: CustomColors.KDarkBlackColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_password.svg',
                                          width: 20.0,
                                          height: 20.0,
                                        ),
                                      ),
                                      minLeadingWidth: 15.0,
                                      trailing: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          child: profileScreenController.expandingListValue[1] == false ? SvgPicture.asset(
                                            'assets/icons/ic_arrow_right.svg',
                                            width: 15.0,
                                            height: 15.0,
                                          ) : SvgPicture.asset(
                                            'assets/icons/ic_arrow_down.svg',
                                            width: 10.0,
                                            height: 10.0,
                                          ),
                                          onTap: () => profileScreenController.expandedBox(profileScreenController.expandingListValue[1],1),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      color: CustomColors.KDarkGreyColor,
                                      thickness: 0.5,
                                      endIndent: 25.0,
                                      indent: 25.0,
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Notification",
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            color: CustomColors.KDarkBlackColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_notification.svg',
                                          width: 20.0,
                                          height: 20.0,
                                        ),
                                      ),
                                      minLeadingWidth: 15.0,
                                      trailing: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          child: profileScreenController.expandingListValue[2] == false ? SvgPicture.asset(
                                            'assets/icons/ic_arrow_right.svg',
                                            width: 15.0,
                                            height: 15.0,
                                          ) : SvgPicture.asset(
                                            'assets/icons/ic_arrow_down.svg',
                                            width: 10.0,
                                            height: 10.0,
                                          ),
                                          onTap: () => profileScreenController.expandedBox(profileScreenController.expandingListValue[2],2),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      color: CustomColors.KDarkGreyColor,
                                      thickness: 0.5,
                                      endIndent: 25.0,
                                      indent: 25.0,
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Wishlist",
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            color: CustomColors.KDarkBlackColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_wishlist.svg',
                                          width: 20.0,
                                          height: 20.0,
                                        ),
                                      ),
                                      minLeadingWidth: 15.0,
                                      trailing: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          child: profileScreenController.expandingListValue[3] == false ? SvgPicture.asset(
                                            'assets/icons/ic_arrow_right.svg',
                                            width: 15.0,
                                            height: 15.0,
                                          ) : SvgPicture.asset(
                                            'assets/icons/ic_arrow_down.svg',
                                            width: 10.0,
                                            height: 10.0,
                                          ),
                                          onTap: () => profileScreenController.expandedBox(profileScreenController.expandingListValue[3],3),
                                        ),
                                      ),
                                    ),
                                    profileScreenController.expandingListValue[3]== true ? SizedBox(
                                          height: 200,
                                          child: new Text("Anik",style: TextStyle(color: Colors.blue),),
                                        ) : SizedBox.shrink()
                                  ],
                                );
                              })
                            ),
                          ))
                    ]))
                  ],
                ),
              ),
            ));
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColors.KAshBg1,
      centerTitle: true,
      title: Text(
        'My Account',
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
              color: CustomColors.KDarkBlue,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: CustomColors.KAshBg1,
          statusBarIconBrightness: Brightness.dark),
    );
  }
}
