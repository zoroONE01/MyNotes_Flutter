import 'package:flutter/material.dart';
import 'package:my_notes/constants/app_colors.dart';

class AppTextStyles {
  static const h1 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 32.81,
      fontWeight: FontWeight.w700,
      color: AppColors.colorTextPrimary);
  static const h2 = TextStyle(
      fontFamily: 'NunitoSans',
      letterSpacing: 0.39,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColors.colorTextPrimary);
  static const h2Hint = TextStyle(
      fontFamily: 'NunitoSans',
      letterSpacing: 0.39,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColors.colorTextPrimaryHint);
  static const h3 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const h4 = TextStyle(
      fontFamily: 'NunitoSans',
      letterSpacing: 0.17,
      fontSize: 15.62,
      fontWeight: FontWeight.w700,
      //bold
      color: AppColors.colorTextPrimary);
  static const h5 = TextStyle(
      fontFamily: 'NunitoSans',
      letterSpacing: 0.22,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      //semibold
      color: AppColors.colorTextPrimary);
  static const h5White = TextStyle(
      fontFamily: 'NunitoSans',
      letterSpacing: 0.22,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      //semibold
      color: Colors.white);
  static const body1 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 14.96,
      fontWeight: FontWeight.w400, //regular
      color: AppColors.colorTextPrimary);
  static const body0= TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 16,
      fontWeight: FontWeight.w400, //regular
      color: AppColors.colorTextPrimary);
  static const bodySave = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 14.96,
      fontWeight: FontWeight.w400, //regular
      color: Colors.white);
  static const body2 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 13,
      fontWeight: FontWeight.w300, //light
      color: AppColors.colorTextSecondary);
  static const body3 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 12,
      fontWeight: FontWeight.w300, //light
      color: AppColors.colorTextPrimary);
  static const body4 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 17.68,
      letterSpacing: -0.42,
      fontWeight: FontWeight.w300,
      //regular
      color: AppColors.colorText3rd);
  static const buttonIntro = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const topButton = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 14.58,
      fontWeight: FontWeight.w600,
      color: AppColors.colorBluePrimary);

  static const labelBotNav = TextStyle(
      fontFamily: 'NunitoSans',
      letterSpacing: -0.39,
      fontSize: 9,
      fontWeight: FontWeight.w600,
      color: AppColors.colorTextPrimary);
  static const labelBotNavSelected = TextStyle(
      fontFamily: 'NunitoSans',
      letterSpacing: -0.39,
      fontSize: 9,
      fontWeight: FontWeight.w600,
      color: AppColors.colorBluePrimary);
}
