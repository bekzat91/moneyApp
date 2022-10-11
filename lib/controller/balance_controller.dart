import 'package:get/get.dart';

import '../constants.dart';
import '../model/transaction_model.dart';

class BalanceController extends GetxController {
  var myBalance = (1200.00).obs;

  int currentId = 8;

  topUp(double add, String createdAt, String type, {String name = ''}) {
    String correctType = '';
    switch (type) {
      case typeTopUp:
        {
          correctType = "Top Up";
        }
        break;
      case typeLoan:
        {
          correctType = "Loan";
        }
        break;
      default:
        {
          correctType = name;
        }
        break;
    }
    listOfTransaction.add(TransactionModel(
        id: currentId,
        type: type,
        name: correctType,
        amount: add,
        createdAt: createdAt));
    currentId++;
    myBalance.value += add;
  }

  pay(
      {required double paymentAmount,
      required String name,
      required String type}) {
    listOfTransaction.add(TransactionModel(
        id: currentId,
        type: type,
        name: name,
        amount: paymentAmount,
        createdAt: DateTime.now().toString()));
    currentId++;
    myBalance.value -= paymentAmount;
  }

  var listOfTransaction = [
    TransactionModel(
      id: 1,
      name: 'Amazon',
      type: typePayment,
      amount: 25.66,
      createdAt: DateTime.now().toString(),
    ),
    TransactionModel(
      id: 2,
      name: 'Ebay',
      type: typePayment,
      amount: 45.27,
      createdAt: DateTime.now().toString(),
    ),
    TransactionModel(
      id: 3,
      name: 'Local shop',
      type: typePayment,
      amount: 150.99,
      createdAt: DateTime.now().toString(),
    ),
    TransactionModel(
      id: 4,
      name: 'Top Up',
      type: typeTopUp,
      amount: 220.99,
      createdAt: DateTime.now().toString(),
    ),
    TransactionModel(
        id: 5,
        name: 'Bekzat',
        type: typePayment,
        amount: 45.33,
        createdAt: DateTime.now().subtract(const Duration(days: 1)).toString()),
    TransactionModel(
      id: 6,
      name: 'Local shop #222',
      type: typePayment,
      amount: 150.99,
      createdAt: '2022-10-06 18:26:09.170323',
    ),
    TransactionModel(
      id: 7,
      name: 'Top Up',
      type: typeTopUp,
      amount: 1225.99,
      createdAt: '2022-10-06 18:26:09.170323',
    ),
  ].obs;

  splitThisBill(int id) {
    listOfTransaction.firstWhere((element) => element.id == id).amount /= 2;

    topUp(
        listOfTransaction.firstWhere((element) => element.id == id).amount,
        listOfTransaction.firstWhere((element) => element.id == id).createdAt,
        typeTopUp);
    listOfTransaction.refresh();
    //print(listOfTransaction.firstWhere((element) => element.id == id).amount);
  }

  toggleRepeatingPaymentOption(int id, bool? value) {
    listOfTransaction
        .firstWhere((element) => element.id == id)
        .isRepeatingPayment = value!;
    topUp(
        listOfTransaction.firstWhere((element) => element.id == id).amount,
        listOfTransaction.firstWhere((element) => element.id == id).createdAt,
        typePayment,
        name: listOfTransaction.firstWhere((element) => element.id == id).name);
    listOfTransaction.refresh();
  }
}
