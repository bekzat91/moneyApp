import 'package:flutter/material.dart';

const kTitle = 'MoneyApp';

const kLoanTitle = "Loan Application";

const kLoanText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum enim non neque luctus, nec blandit ipsum sagittis. Sed fringilla blandit nibh, sit amet suscipit massa sollicitudin lacinia. Donec cursus, odio sit amet tincidunt sodales, odio nisl hendrerit sem, tempor tincidunt ligula nisl nec ante. Nulla aliquet aliquam justo, ac bibendum orci rhoncus non. Nullam quis ex elementum, pharetra ligula eleifend, convallis nulla. Nulla sit amet nisi viverra, semper nunc eu, posuere dui. Donec at metus ut eros rhoncus vestibulum vitae at lacus. Etiam imperdiet, nulla ac condimentum aliquam, enim lacus fringilla leo, vel hendrerit mi ipsum et ante. Vivamus finibus mauris eget diam sodales, eget efficitur orci laoreet. Sed feugiat odio quis mattis tristique. Mauris sit amet sem mauris.";

const String typePayment = 'payment';

const String typeTopUp = 'top_up';

const String typeLoan = 'loan';

const Color colorMain = Color(0xFFC0028B);

const Color kBackgroundColor = Color(0xFFF7F7F7);

const Color kGreyTextColor = Color(0xFFB0B3B8);

const Color kBlackHeader = Color(0xFF3A3B3C);

const Color kDemoLight = Color(0xFFF9E6F3);

const Color kDemoDark = Color(0xFFB0B3B8);

const Color kGreyish = Color(0xFFE5E5E5);

const Color kRed = Color(0xFFFF0000);

const Color kDartBlack = Color(0xFF3E3D3D);

const EdgeInsetsGeometry paddingO1 =
    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15);

const TextStyle textStyle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "Montserrat",
    fontStyle: FontStyle.normal);

const TextStyle textStyle2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyle3 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: kGreyTextColor);

const TextStyle textStyle4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: kBlackHeader);

const TextStyle textStyleBalance = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.white);

const TextStyle textStyleBalanceDecimal = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.white);

const TextStyle textStyleTransactionAmount = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w300,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyleTransactionAmountDecimal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyleTopUpAmount = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w300,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: colorMain);

const TextStyle textStyleTopUpAmountDecimal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: colorMain);

const TextStyle textStyleActionDescription = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyleTopUp = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w300,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: colorMain);

const TextStyle textStyleQuestion = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.white);

const TextStyle textStyleKeyboardButtons = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.white);

const TextStyle textStyleButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.white);

const TextStyle textStyleBigNumber = TextStyle(
  fontSize: 70,
  fontWeight: FontWeight.w600,
  //fontFamily: "Montserrat",
  fontStyle: FontStyle.normal,
  color: Colors.white,
);

const TextStyle textStyleTransactionAmountBlack = TextStyle(
    fontSize: 37,
    fontWeight: FontWeight.w300,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyleTransactionAmountDecimalBlack = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w300,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyleTransactionName = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyleTransactionTime = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: kDemoDark);

const TextStyle textStyleTransactionFieldText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.black);

const TextStyle textStyleTransactionGetHelp = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: kRed);

const TextStyle textStyleTransactionTransactionIDs = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: kDemoDark);

const TextStyle textStyleLoanTextfieldHeader = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: Colors.grey);

const TextStyle textStyleLoanTextfieldValue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    //fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    color: kDartBlack);
