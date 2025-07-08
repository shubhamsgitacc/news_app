import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/theme/app_theme.dart';
import 'package:news_app/app/theme/theme_controller.dart';
import 'package:news_app/core/common_models/article_model.dart';
import 'package:news_app/core/text_styles/text_style.dart';
import 'package:news_app/core/utils/app_theme_util.dart';
import 'package:news_app/core/utils/size_utils.dart';

import '../routes/app_routes.dart';

SizedBox sizedBoxH(double val) => SizedBox(
      height: val.h,
    );
SizedBox sizedBoxW(double val) => SizedBox(
      width: val.h,
    );

Widget commonButtonCategory(
    {required bool isSelected,
    required Function() onTap,
    required String text}) {
  AppTheme theme = ThemeController().getAppTheme();
  return InkWell(
    splashColor: Colors.transparent,
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? theme.primaryColor() : theme.secondaryColor(),
      ),
      child: Text(
        text,
        style:
            font16Medium(textColor: isSelected ? Colors.white : Colors.black),
      ),
    ),
  );
}

customLog(String msg, {String? name}) {
  return log(msg, name: name ?? "log");
}

Widget commonLoading(bool isLoading) => Center(
      child: Visibility(visible: isLoading, child: CircularProgressIndicator()),
    );
GetSnackBar commonSnackBar({
  required String title,
  required String desc,
}) =>
    GetSnackBar(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      borderRadius: 15,
      backgroundColor: AppThemeUtil.appTheme.secondaryColor(),
      titleText: title.isNotEmpty
          ? Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppThemeUtil.appTheme.primaryColor()),
            )
          : null,
      messageText: desc.isNotEmpty
          ? Text(
              desc,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppThemeUtil.appTheme.primaryColor()),
            )
          : null,
      duration: const Duration(milliseconds: 800),
    );

Widget noDataFoundWidget({required bool visible}) => Visibility(
    visible: visible,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.article_rounded,
          size: 5.h,
          color: AppThemeUtil.primaryColor,
        ),
        sizedBoxH(1.3),
        Text(
          "Ooops",
          style: font20Medium(textColor: AppThemeUtil.primaryColor),
        ),
        sizedBoxH(.7),
        Text(
          "No article found",
          style: font18Medium(textColor: AppThemeUtil.primaryColor),
        ),
      ],
    ));

Gradient commonGradient() => LinearGradient(colors: <Color>[
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.black
    ], stops: <double>[
      0,
      0,
      0.4,
      1
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

pushToArticleScreen({required NewsArticleModel model}) {
  print('object');
  Get.toNamed(Routes.articleDetailsScreen, arguments: model);
}

Widget articleTile({
  required Function() fun,
  required NewsArticleModel model,
  required String time,
  required Color primaryColor,
}) =>
    InkWell(
      onTap: fun,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: Colors.grey,
                height: 20.w,
                width: 20.w,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: model.urlToImage ?? '',
                  errorWidget: (context, url, error) => Icon(
                    Icons.article,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            sizedBoxW(1.5),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.title ?? '',
                  style: font18Medium(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                sizedBoxH(.6),
                Text(
                  ' $time',
                  style: font16Medium(),
                ),
              ],
            ))
          ],
        ),
      ),
    );
