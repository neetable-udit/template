import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getCircularCachedImage({
  required String? imageUrl,
  required double radius,
  String? text,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl ?? '',
    imageBuilder: (context, imageProvider) => Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
      child: Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
    ),
    errorWidget: (context, url, error) => SizedBox(
      width: radius,
      height: radius,
      child: CircleAvatar(
        backgroundColor: Theme.of(Get.context!).primaryColor,
        child: (text == null || text.isEmpty)
            ? const Icon(CupertinoIcons.person_fill)
            : Text(text[0]),
      ),
    ),
    fit: BoxFit.fill,
  );
}
