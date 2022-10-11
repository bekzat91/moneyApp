import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../controller/balance_controller.dart';

class TransActionDetails extends StatefulWidget {
  const TransActionDetails({Key? key}) : super(key: key);

  @override
  State<TransActionDetails> createState() => _TransActionDetailsState();
}

class _TransActionDetailsState extends State<TransActionDetails> {
  bool isRepeatingPayment = false;

  final homeStateController = Get.find<BalanceController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorMain,
          title: const Text(
            kTitle,
            style: textStyle1,
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              //color: Colors.green,
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(left: 4),
              padding: paddingO1,
              child: SvgPicture.asset(
                'assets/icons/chevron_left.svg',
                alignment: Alignment.centerLeft,
                height: 60,
                width: 60,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 20, top: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/payment_icon.svg',
                          height: 64,
                          width: 64,
                        ),
                        Obx(
                          () => RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: (homeStateController.listOfTransaction
                                    .firstWhere((element) =>
                                        element.id == Get.arguments.id)
                                    .amount
                                    .floor()
                                    .toString()),
                                //Get.arguments.amount.floor()).toString(),
                                style: textStyleTransactionAmountBlack),
                            TextSpan(
                                text:
                                    '.${(homeStateController.listOfTransaction.firstWhere((element) => element.id == Get.arguments.id).amount.toStringAsFixed(2).split('.').last.substring(0, 2).toString())}',
                                style: textStyleTransactionAmountDecimalBlack),
                          ])),
                        ),
                        // Text(Get.arguments.amount.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      Get.arguments.name,
                      style: textStyleTransactionName,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('dd MMMM yyyy hh:mm a')
                          .format(DateTime.parse(Get.arguments.createdAt)),
                      //Get.arguments.createdAt,
                      style: textStyleTransactionTime,
                    ),
                  ],
                )),
            const SizedBox(
              height: 47,
            ),
            Container(
              //width: double.infinity,
              height: 50,
              color: Colors.white,
              //margin: EdgeInsets.only(left: 25),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/receipt_icon.svg'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Add receipt',
                      style: textStyleTransactionFieldText,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 57,
            ),
            if (Get.arguments.type == typePayment) ...[
              const Padding(
                padding: EdgeInsets.only(left: 17),
                child: Text(
                  'SHARE THE COST',
                  style: textStyle4,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  homeStateController.splitThisBill(Get.arguments.id);
                },
                child: Container(
                  //width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  //margin: EdgeInsets.only(left: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/split_bill_icon.svg'),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Split this bill',
                          style: textStyleTransactionFieldText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
            if (Get.arguments.type == typePayment) ...[
              const Padding(
                padding: EdgeInsets.only(left: 17),
                child: Text(
                  'SUBSCRIPTION',
                  style: textStyle4,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                //width: double.infinity,
                height: 50,
                color: Colors.white,
                //margin: EdgeInsets.only(left: 25),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Repeating payment',
                        style: textStyleTransactionFieldText,
                      ),
                      Obx(() => Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: CupertinoSwitch(
                                value: homeStateController.listOfTransaction
                                    .firstWhere((element) =>
                                        element.id == Get.arguments.id)
                                    .isRepeatingPayment,
                                onChanged: (bool? value) {
                                  homeStateController
                                      .toggleRepeatingPaymentOption(
                                          Get.arguments.id, value!);
                                  // setState(() {
                                  //   isRepeatingPayment = value!;
                                  // });
                                }),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 57,
              ),
            ],
            InkWell(
              onTap: () {
                Get.dialog(const AlertDialog(
                    title: Text('Help is on the way, stay put!')));
              },
              child: Container(
                //width: double.infinity,
                height: 50,
                color: Colors.white,
                //margin: EdgeInsets.only(left: 25),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Something wrong? Get help',
                        style: textStyleTransactionGetHelp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Center(
                child: Text(
              'Transaction ID #${Get.arguments.id}',
              style: textStyleTransactionTransactionIDs,
            )),
            Center(
                child: Text(
              '${Get.arguments.name} - Merchant ID #1245',
              style: textStyleTransactionTransactionIDs,
            )),
          ],
        ),
      ),
    );
  }
}
