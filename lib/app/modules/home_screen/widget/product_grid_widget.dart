import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedevs_flutter_project/app/data/model/product_list_response.dart';
import 'package:wedevs_flutter_project/app/utils/helper/curve_background.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';

class ProductGridItemWidget extends StatefulWidget {
  final ResponseData? product;
  final Function? onClickProduct;

  ProductGridItemWidget({
    this.product,
    this.onClickProduct,
  });

  @override
  _ProductGridItemWidgetState createState() =>
      _ProductGridItemWidgetState();
}

class _ProductGridItemWidgetState extends State<ProductGridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

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
            Container(
              height: 35,
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                widget.product!.name.toString(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
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
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.product!.price.toString(),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
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
                    textAlign: TextAlign.left,
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
            ),
            const SizedBox(height: 10.0,),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: RatingBar.builder(
                //initialRating: widget.product!.ratingCount!.toDouble(),
                initialRating: double.parse(widget.product!.averageRating.toString()),
                direction: Axis.horizontal,
                allowHalfRating: true,
                //itemCount: (double.parse(widget.product!.averageRating.toString())).toInt(),
                itemCount: widget.product!.ratingCount!.toInt(),
                ignoreGestures: true,
                itemSize: 15,
                unratedColor: CustomColors.KGreyAshes,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: CustomColors.KGoldy,
                ),
                onRatingUpdate: (rating) {
                  //print(rating);
                },
              ),
            ),

          ],
        ),
        colors: Colors.white,
        radius: 8,
        shadow: true,
        margins: 5,
        paddings: 0,
      ),
    );
  }
}