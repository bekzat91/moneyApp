import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money_app/utils.dart';

import '../../constants.dart';
import 'controller/loan_controller.dart';

class Loan extends StatelessWidget {
  final loanController = Get.find<LoanController>();

  final TextEditingController monthlySalaryController = TextEditingController();
  final TextEditingController monthlyExpensesController =
      TextEditingController();
  final TextEditingController loanAmountController = TextEditingController();
  final TextEditingController termController = TextEditingController();

  Loan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Obx(
      () => ModalProgressHUD(
        inAsyncCall: loanController.isDataLoading.value,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: colorMain,
            title: const Text(
              kLoanTitle,
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
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () => closeKeyBoard(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 17, right: 27, top: 7, bottom: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Terms and Conditions',
                            style: textStyleTransactionName,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(kLoanText),
                        ],
                      ),
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
                                'Accept Terms & Conditions',
                                style: textStyleTransactionFieldText,
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: CupertinoSwitch(
                                      value: loanController
                                          .termsAndConditions.value,
                                      onChanged: (bool? value) {
                                        loanController
                                            .toggleAcceptTermsAndConditions(
                                                value!);
                                      }),
                                ),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 17),
                      child: Text(
                        'ABOUT YOU',
                        style: textStyle4,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    TextInput(
                      header: 'Monthly Salary',
                      myController: monthlySalaryController,
                    ),
                    TextInput(
                      header: 'Monthly Expenses',
                      myController: monthlyExpensesController,
                    ),

                    const SizedBox(
                      height: 32,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 17),
                      child: Text(
                        'Loan',
                        style: textStyle4,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextInput(
                      header: 'Amount',
                      myController: loanAmountController,
                    ),
                    TextInput(
                      header: 'Term',
                      myController: termController,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 34),
                        child: InkWell(
                          child: Container(
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: colorMain,
                            ),
                            child: const Center(
                              child: Text(
                                'Apply for loan',
                                style: textStyleButton,
                              ),
                            ),
                          ),
                          onTap: () async {
                            if (!loanController.termsAndConditions.value) {
                              Get.dialog(const AlertDialog(
                                  title: Text(
                                      'You must accept the terms before applying for a loan')));
                            } else if (loanController.numberOfAttempts.value ==
                                1) {
                              Get.dialog(const AlertDialog(
                                  title: Text(
                                      'Ooopsss, you applied before. Wait for notification from us')));
                            } else if (loanController.isForeverDeclined.value) {
                              Get.dialog(const AlertDialog(
                                  title: Text('Forever declined')));
                            } else if (!hasEmptyFields()) {
                              await loanController.applyForLoan(
                                  monthlySalary: int.tryParse(
                                      monthlySalaryController.text)!,
                                  monthlyExpenses: int.tryParse(
                                      monthlyExpensesController.text)!,
                                  loanAmount:
                                      int.tryParse(loanAmountController.text)!,
                                  loanTerm: int.tryParse(termController.text)!);
                              if (loanController.loanDecision.value) {
                                Get.dialog(const AlertDialog(
                                    title: Text(
                                        'Yeeeyyy !! Congrats. Your application has been approved. Don’t tell your friends you have money!')));
                              } else {
                                Get.dialog(const AlertDialog(
                                  title: Text(
                                      'Ooopsss. Your application has been declined. It’s not your fault, it’s a financial crisis. '),
                                ));
                              }
                            } else {
                              Get.dialog(const AlertDialog(
                                  title: Text(
                                      'Pls fill in all required fields!')));
                            }
                          },
                        ),
                      ),
                    ),
                    // Obx(() => Padding(
                    //       padding: const EdgeInsets.only(right: 14),
                    //       child: CupertinoSwitch(
                    //           value: false, onChanged: (bool? value) {}),
                    //     ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  bool hasEmptyFields() {
    if (monthlySalaryController.text.isNotEmpty &&
        monthlyExpensesController.text.isNotEmpty &&
        loanAmountController.text.isNotEmpty &&
        termController.text.isNotEmpty) {
      return false;
    }
    return true;
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.header,
    required this.myController,
  }) : super(key: key);

  final String header;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //margin: EdgeInsets.only(left: 25),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: textStyleLoanTextfieldHeader,
            ),
            TextField(
              controller: myController,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 8, top: 2),
                isDense: true,
                border: InputBorder.none,
                prefix: header == 'Term'
                    ? null
                    : const Text(
                        '£',
                        style: textStyleLoanTextfieldValue,
                        // textAlign: TextAlign.end,
                      ),
              ),
              style: textStyleLoanTextfieldValue,
            ),
          ],
        ),
      ),
    );
  }
}
