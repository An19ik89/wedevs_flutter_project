import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedevs_flutter_project/app/data/model/product_list_response.dart';
import 'package:wedevs_flutter_project/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:wedevs_flutter_project/app/utils/helper/curve_background.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';
import 'package:wedevs_flutter_project/app/utils/res/dimens.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (controller) => SafeArea(
              bottom: true,
              left: true,
              right: true,
              top: true,
              child: Scaffold(
                  backgroundColor: CustomColors.KAshBg1,
                  appBar: appBar(context),
                  body: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverList(
                          delegate: SliverChildListDelegate([
                        searchBox(context),
                      ])),
                      Obx(() {
                        List? v = controller.result;
                        return SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0,
                          ),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio: 0.65),
                            delegate: SliverChildListDelegate(
                                buildProductGridItem(v)),
                          ),
                        );
                      }),
                    ],
                  )),
            ));
  }

  List<Widget> buildProductGridItem(List productList) {
    List<Widget> listings = [];

    for (int index = 0; index < productList.length; index++) {
      listings.add(
        ProductGridItemWidgetBuy(
          product: productList[index],
          onClickProduct: (String productSlug, int id) async {},
        ),
      );
    }
    return listings;
  }

  searchBox(context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 70.0,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset(
                        'assets/icons/ic_filter.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Filter",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 17,
                          color: CustomColors.KGrey,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.bottomSheet(
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(() {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15.0,
                                ),
                                ListTile(
                                    title: Text(
                                  "Filter",
                                  softWrap: true,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 17,
                                      color: CustomColors.KDarkBlackColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700),
                                )),
                                ListTile(
                                  title: Text(
                                    "Newest",
                                    style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 15,
                                        color: CustomColors.KDarkBlackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  leading: Checkbox(
                                    value: controller.checkBoxValue[0],
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: const RoundedRectangleBorder(),
                                    side: const BorderSide(
                                        color: CustomColors.KPink,
                                        style: BorderStyle.solid,
                                        width: 2.0),
                                    activeColor: CustomColors.KPink,
                                    checkColor: Colors.white,
                                    onChanged: (value) =>
                                        controller.pressingCheckbox(0, value),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Oldest",
                                    style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 15,
                                        color: CustomColors.KDarkBlackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  leading: Checkbox(
                                    value: controller.checkBoxValue[1],
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: const RoundedRectangleBorder(),
                                    side: const BorderSide(
                                        color: CustomColors.KPink,
                                        style: BorderStyle.solid,
                                        width: 2.0),
                                    activeColor: CustomColors.KPink,
                                    checkColor: Colors.white,
                                    onChanged: (value) =>
                                        controller.pressingCheckbox(1, value),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Price low > high",
                                    style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 15,
                                        color: CustomColors.KDarkBlackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  leading: Checkbox(
                                    value: controller.checkBoxValue[2],
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: const RoundedRectangleBorder(),
                                    side: const BorderSide(
                                        color: CustomColors.KPink,
                                        style: BorderStyle.solid,
                                        width: 2.0),
                                    activeColor: CustomColors.KPink,
                                    checkColor: Colors.white,
                                    onChanged: (value) =>
                                        controller.pressingCheckbox(2, value),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Price high > low",
                                    style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 15,
                                        color: CustomColors.KDarkBlackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  leading: Checkbox(
                                    value: controller.checkBoxValue[3],
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: const RoundedRectangleBorder(),
                                    side: const BorderSide(
                                        color: CustomColors.KPink,
                                        style: BorderStyle.solid,
                                        width: 2.0),
                                    activeColor: CustomColors.KPink,
                                    checkColor: Colors.white,
                                    onChanged: (value) =>
                                        controller.pressingCheckbox(3, value),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Best Selling",
                                    style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 15,
                                        color: CustomColors.KDarkBlackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  leading: Checkbox(
                                    value: controller.checkBoxValue[4],
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: const RoundedRectangleBorder(),
                                    side: const BorderSide(
                                        color: CustomColors.KPink,
                                        style: BorderStyle.solid,
                                        width: 2.0),
                                    activeColor: CustomColors.KPink,
                                    checkColor: Colors.white,
                                    onChanged: (value) =>
                                        controller.pressingCheckbox(4, value),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        child: const Text("Cancel",
                                            style: TextStyle(
                                                color: CustomColors.KGrey,
                                                fontSize: Dimens.titleLarge,
                                                fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: CustomColors.KGreyLight,
                                            ),
                                            primary: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 20),
                                            textStyle: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400)),
                                        onPressed: () =>
                                            controller.clearFilter()),
                                    ElevatedButton(
                                        child: const Text("Apply",
                                            style: TextStyle(
                                                fontSize: Dimens.titleLarge,
                                                fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                            primary: CustomColors.KGreen,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 20),
                                            textStyle: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400)),
                                        onPressed: () =>
                                            controller.applyFilter()),
                                  ],
                                )
                              ],
                            );
                          })),
                      elevation: 20.0,
                      enableDrag: false,
                      isDismissible: true,
                      backgroundColor: Colors.white,
                    );
                  },
                ),
                Row(
                  children: [
                    Text(
                      "Sort by",
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 17,
                        color: CustomColors.KGrey,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    SvgPicture.asset(
                      'assets/icons/ic_down_arrow.svg',
                      width: 10,
                      height: 10,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    SvgPicture.asset(
                      'assets/icons/ic_menu.svg',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                )
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
        'Product List',
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
              color: CustomColors.KDarkBlue,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
        ),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 20.0),
          child: SvgPicture.asset(
            'assets/icons/ic_search.svg',
            width: 20,
            height: 20,
          ),
        ),
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: CustomColors.KAshBg1,
          statusBarIconBrightness: Brightness.dark),
    );
  }
}

class ProductGridItemWidgetBuy extends StatefulWidget {
  final ResponseData? product;
  final Function? onClickProduct;

  ProductGridItemWidgetBuy({
    this.product,
    this.onClickProduct,
  });

  @override
  _ProductGridItemWidgetBuyState createState() =>
      _ProductGridItemWidgetBuyState();
}

class _ProductGridItemWidgetBuyState extends State<ProductGridItemWidgetBuy> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //widget.onClickProduct!(widget.product.slug, widget.product.id);
      },
      child: CurveBackGround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0)),
              child: Hero(
                tag: 'tag${UniqueKey()}',
                child: CachedNetworkImage(
                  imageUrl: widget.product!.images![0].src ?? '',
                  height: 180,
                  width: double.infinity,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 35,
              child: Text(
                widget.product!.name.toString(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 15,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product!.price.toString(),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                      fontSize: 18,
                      color: CustomColors.KGreyMoreLight,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  widget.product!.regularPrice.toString(),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.roboto(
                      fontSize: 21,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        colors: Colors.white,
        radius: 8,
        shadow: true,
        margins: 5,
        paddings: 0,
      ),

      // child: Stack(
      //   fit: StackFit.expand,
      //   alignment: Alignment.topRight,
      //   children: <Widget>[
      //     Card(
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.all(
      //           Radius.circular(15),
      //         ),
      //       ),
      //       elevation: 2,
      //       child: SizedBox(
      //           height: 270,
      //           width: 145,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignmentaceAround,
      //             mainAxisSize: MainAxisSize.max,
      //             crossAxisAlignment: CrossAxisAlignment.stretch,
      //             children: <Widget>[
      //               Stack(
      //                 children: [
      //                   Positioned(
      //                       child: Align(
      //                     alignment: Alignment.topCenter,
      //                     child: SizedBox(
      //                         height: 90,
      //                         width: 200,
      //                         child: Stack(
      //                           children: <Widget>[
      //                             Hero(
      //                               tag: 'tag${UniqueKey()}',
      //                               child: CachedNetworkImage(
      //                                 imageUrl: widget.product!.images![0].src
      //                                     .toString(),
      //                                 height: 90,
      //                                 width: 200,
      //                                 fit: BoxFit.cover,
      //                               ),
      //                             ),
      //                           ],
      //                         )),
      //                   ))
      //                 ],
      //               ),
      //               Flexible(
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(5.0),
      //                   child: Text(
      //                     widget.product!.name.toString(),
      //                     textAlign: TextAlign.center,
      //                     maxLines: 4,
      //                     style: TextStyle(
      //                         fontSize: 13, fontWeight: FontWeight.w600),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 3,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 5.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   mainAxisSize: MainAxisSize.max,
      //                   children: <Widget>[
      //                     // widget.product.price > 0
      //                     //     ? SvgImageWidget(
      //                     //   imageAsset: 'assets/images/icon_taka.svg',
      //                     //   width: getMaxWidth(context)/12,
      //                     //   height: getMaxHeight(context)/12,
      //                     // )
      //                     //     : Container(
      //                     //   height: 0,
      //                     //   width: 0,
      //                     // ),
      //                     Row(
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 5.0),
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.start,
      //                             mainAxisSize: MainAxisSize.max,
      //                             children: <Widget>[
      //                               // SvgImageWidget(
      //                               //   imageAsset: 'assets/images/icon_taka.svg',
      //                               //   width: getMaxWidth(13, context),
      //                               //   height: getMaxHeight(13, context),
      //                               // ),
      //                               Text(
      //                                 widget.product!.price.toString(),
      //                                 style: const TextStyle(
      //                                     decoration:
      //                                         TextDecoration.lineThrough,
      //                                     fontSize: 11,
      //                                     color: Colors.black54),
      //                               ),
      //                               const SizedBox(
      //                                 width: 6,
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Text(
      //                           widget.product!.regularPrice.toString(),
      //                           textAlign: TextAlign.center,
      //                           softWrap: true,
      //                           overflow: TextOverflow.clip,
      //                           style: const TextStyle(
      //                               fontSize: 15,
      //                               fontWeight: FontWeight.w700,
      //                               color: Colors.orange),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 3,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Container(
      //                     height: 25,
      //                     child: MaterialButton(
      //                       elevation: 1.0,
      //                       color: Colors.white,
      //                       shape: StadiumBorder(
      //                           side: BorderSide(color: Colors.blue)),
      //                       child: Padding(
      //                         padding: EdgeInsets.all(1.1),
      //                         child: Center(
      //                           child: Text(
      //                             'Add To Cart',
      //                             style: TextStyle(
      //                                 color: Colors.blue, fontSize: 14),
      //                           ),
      //                         ),
      //                       ),
      //                       onPressed: () async {},
      //                     )),
      //               ),
      //               SizedBox(
      //                 height: 6,
      //               ),
      //             ],
      //           )),
      //     ),
      //   ],
      // ),
    );
  }
}
