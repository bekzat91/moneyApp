import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_app/controller/balance_controller.dart';
import 'package:money_app/features/transaction_details/transaction_details.dart';
import 'constants.dart';
import 'features/loan/controller/loan_controller.dart';
import 'features/loan/loan.dart';
import 'features/top_up/top_up.dart';

void main() {
  runApp(const GetMaterialApp(initialRoute: '/', home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final homeStateController = Get.put(BalanceController());
  final loanController = Get.put(LoanController());

  Set groupSet = {};

  // List<TransactionModel> listOfTransaction = [
  //   TransactionModel(
  //     id: 1,
  //     name: 'Amazon',
  //     type: typePayment,
  //     amount: 25.66,
  //     createdAt: DateTime.now().toString(),
  //   ),
  //   TransactionModel(
  //     id: 2,
  //     name: 'Ebay',
  //     type: typePayment,
  //     amount: 45.27,
  //     createdAt: DateTime.now().toString(),
  //   ),
  //   TransactionModel(
  //     id: 3,
  //     name: 'Local shop',
  //     type: typePayment,
  //     amount: 150.99,
  //     createdAt: DateTime.now().toString(),
  //   ),
  //   TransactionModel(
  //     id: 4,
  //     name: 'Top Up',
  //     type: typeTopUp,
  //     amount: 220.99,
  //     createdAt: DateTime.now().toString(),
  //   ),
  //   TransactionModel(
  //     id: 5,
  //     name: 'Bekzat',
  //     type: typePayment,
  //     amount: 45.33,
  //     createdAt: '2022-10-07 18:26:09.170323',
  //   ),
  //   TransactionModel(
  //     id: 6,
  //     name: 'Local shop #222',
  //     type: typePayment,
  //     amount: 150.99,
  //     createdAt: '2022-10-06 18:26:09.170323',
  //   ),
  //   TransactionModel(
  //     id: 7,
  //     name: 'Top Up',
  //     type: typeTopUp,
  //     amount: 1225.99,
  //     createdAt: '2022-10-06 18:26:09.170323',
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    for (var item in homeStateController.listOfTransaction) {
      groupSet.add(item.createdAt.substring(0, 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorMain,
          title: const Text(
            kTitle,
            style: textStyle1,
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: colorMain,
                        ),
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Obx(() => RichText(
                                    text: TextSpan(children: [
                                  const TextSpan(
                                      text: '£',
                                      style: textStyleBalanceDecimal),
                                  TextSpan(
                                      text: (homeStateController.myBalance
                                              .floor())
                                          .toString(),
                                      style: textStyleBalance),
                                  TextSpan(
                                      text:
                                          '.${(homeStateController.myBalance.toStringAsFixed(2).split('.').last.substring(0, 2).toString())}',
                                      style: textStyleBalanceDecimal),
                                ]))),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: kBackgroundColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 65,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Recent Activity',
                                  style: textStyle4,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              children: [
                                ...List.generate(
                                    groupSet.length,
                                    (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                properNameDay(groupSet
                                                    .elementAt(index)
                                                    .toString()),
                                                style: textStyle3,
                                              ),
                                            ),
                                            for (var item in homeStateController
                                                .listOfTransaction)
                                              if (item.createdAt
                                                      .substring(0, 10) ==
                                                  groupSet.elementAt(index))
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                        const TransActionDetails(),
                                                        arguments: item);
                                                  },
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 29,
                                                              right: 20,
                                                              top: 14,
                                                              bottom: 14),
                                                      child: Row(
                                                        children: [
                                                          //logo + name
                                                          Expanded(
                                                              child: Row(
                                                            children: [
                                                              getProperLogo(
                                                                  item.type),
                                                              // item.type ==
                                                              //         'payment'
                                                              //     ? SvgPicture
                                                              //         .asset(
                                                              //             'assets/icons/payment_icon.svg')
                                                              //     : SvgPicture
                                                              //         .asset(
                                                              //             'assets/icons/topup_icon.svg'),
                                                              const SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text(
                                                                item.name,
                                                                style:
                                                                    textStyle2,
                                                              ),
                                                            ],
                                                          )),
                                                          // amount
                                                          RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                item.type ==
                                                                        'payment'
                                                                    ? const TextSpan()
                                                                    : const TextSpan(
                                                                        text:
                                                                            '+',
                                                                        style:
                                                                            textStyleTopUpAmount,
                                                                      ),
                                                                TextSpan(
                                                                  text: (item
                                                                          .amount
                                                                          .floor())
                                                                      .toString(),
                                                                  style: item.type ==
                                                                          'payment'
                                                                      ? textStyleTransactionAmount
                                                                      : textStyleTopUpAmount,
                                                                ),
                                                                TextSpan(
                                                                    text:
                                                                        '.${(item.amount.toStringAsFixed(2).split('.').last.substring(0, 2).toString())}',
                                                                    style: item.type ==
                                                                            'payment'
                                                                        ? textStyleTransactionAmountDecimal
                                                                        : textStyleTopUpAmountDecimal),
                                                              ]))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                          ],
                                        )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: 150,
                    //top: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 5,
                              blurStyle: BlurStyle.normal,
                              offset: const Offset(0, 5))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 12, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => const TopUp(),
                                    arguments: [typePayment]);
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/phone_icon.svg'),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    'Pay',
                                    style: textStyleActionDescription,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const TopUp(),
                                    arguments: [typeTopUp]);
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/wallet_icon.svg'),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    'Top up',
                                    style: textStyleActionDescription,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => Loan());
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/loan_icon.svg'),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    'Loan',
                                    style: textStyleActionDescription,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget getProperLogo(String paymentType) {
    switch (paymentType) {
      case typePayment:
        {
          return SvgPicture.asset('assets/icons/payment_icon.svg');
        }
      case typeTopUp:
        {
          return SvgPicture.asset('assets/icons/topup_icon.svg');
        }
      default:
        {
          return SvgPicture.asset(
            'assets/icons/loan_icon.svg',
            height: 30,
            width: 30,
          );
        }
    }
  }

  String properNameDay(String createdAt) {
    if (createdAt == DateTime.now().toString().substring(0, 10)) {
      return 'TODAY';
    } else if (createdAt ==
        ((DateTime.now().subtract(const Duration(days: 1))).toString())
            .substring(0, 10)) {
      return 'YESTERDAY';
    }
    return createdAt;
  }
}
