import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:money_app/constants.dart';
import 'package:money_app/controller/balance_controller.dart';

class LoanController extends GetxController {
  final balanceController = Get.find<BalanceController>();

  var termsAndConditions = false.obs;

  var loanDecision = false.obs;

  var isForeverDeclined = false.obs;

  var isDataLoading = false.obs;

  var numberOfAttempts = 0.obs;

  toggleAcceptTermsAndConditions(bool? value) {
    termsAndConditions.value = value!;
  }

  applyForLoan(
      {required int monthlySalary,
      required int monthlyExpenses,
      required int loanAmount,
      required int loanTerm}) async {
    //Rule #1 - rndm > 50
    int myRandomNumber = await getRandomNumber();
    bool isRule1Satisfied = myRandomNumber > 50;

    //Rule #2 Money in acc > 1000
    bool isRule2Satisfied = balanceController.myBalance > 1000;

    //Rule #3 monthly salary > 1000
    bool isRule3Satisfied = monthlySalary > 1000;

    //Rule $4 monthly expenses < 1/3 of monthly salary
    bool isRule4Satisfied = monthlyExpenses < monthlySalary / 3;

    //Rule #5 Loan cost (loan amount/loan term) < 1/3 of monthly salary
    bool isRule5Satisfied = (loanAmount / loanTerm) < monthlySalary / 3;

    if (isForeverDeclined.value) {
      loanDecision.value = false;
    } else if (!isRule3Satisfied && !isRule5Satisfied) {
      isForeverDeclined.value = true;
      loanDecision.value = false;
    } else if (isRule1Satisfied &&
        isRule2Satisfied &&
        isRule3Satisfied &&
        isRule4Satisfied &&
        isRule5Satisfied) {
      loanDecision.value = true;
      numberOfAttempts++;
      balanceController.topUp(
          loanAmount.toDouble(), DateTime.now().toString(), typeLoan);
    }
  }

  Future<int> getRandomNumber() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100')!);
      if (response.statusCode == 200) {
        ///data successfully

        var result = jsonDecode(response.body);
        //print(result[0]);
        return result[0];
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
    return -1;
  }
}
