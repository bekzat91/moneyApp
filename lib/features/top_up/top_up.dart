import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_app/controller/balance_controller.dart';
import 'package:money_app/features/pay/payment.dart';

import '../../constants.dart';
import '../../num_pad.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  final TextEditingController _myController = NewTextEditingController();
  final homeStateController = Get.find<BalanceController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorMain,
          title: const Text(
            kTitle,
            style: textStyle1,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: SvgPicture.asset(
                  'assets/icons/close_icon.svg',
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ],
        ),
        body: Material(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: colorMain,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 93,
                    ),
                    const Text(
                      'How much?',
                      style: textStyleQuestion,
                    ),
                    const SizedBox(
                      height: 86,
                    ),
                    TextField(
                      //maxLength: 3,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                      //maxLines: null,
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: _myController,
                      readOnly: true,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 75, top: 45),
                          child: Text('£',
                              style: textStyleBalanceDecimal,
                              textAlign: TextAlign.end),
                        ),
                      ),
                    ),
                  ],
                )),
                // Expanded(
                //     flex: 1,
                //     child: Column(
                //       children: [
                //         Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               Text(
                //                 '1',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               Text(
                //                 '2',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               Text(
                //                 '3',
                //                 style: textStyleKeyboardButtons,
                //               )
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: const [
                //               Text(
                //                 '4',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               Text(
                //                 '5',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               Text(
                //                 '6',
                //                 style: textStyleKeyboardButtons,
                //               )
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: const [
                //               Text(
                //                 '7',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               Text(
                //                 '8',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               Text(
                //                 '9',
                //                 style: textStyleKeyboardButtons,
                //               )
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               Text(
                //                 '.',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               Text(
                //                 '0',
                //                 style: textStyleKeyboardButtons,
                //               ),
                //               SvgPicture.asset('assets/icons/backspace.svg')
                //             ],
                //           ),
                //         ),
                //       ],
                //     )),
                Expanded(
                  flex: 1,
                  child: NumPad(
                      buttonSize: 35,
                      buttonColor: colorMain,
                      iconColor: Colors.deepOrange,
                      controller: _myController,
                      delete: () {
                        _myController.text = _myController.text
                            .substring(0, _myController.text.length - 1);
                      },
                      onSubmit: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 34),
                  child: InkWell(
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kDemoLight.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: textStyleButton,
                        ),
                      ),
                    ),
                    onTap: () {
                      if (Get.arguments[0] == typeTopUp) {
                        Get.back();
                        homeStateController.topUp(
                            double.parse(_myController.text),
                            DateTime.now().toString(),
                            typeTopUp);
                      } else if (Get.arguments[0] == typePayment) {
                        Get.to(() => Payment(),
                            arguments: [double.parse(_myController.text)]);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Have to override the textEditing controller
class NewTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    return TextSpan(
      children: [
        text.contains('.')
            ? TextSpan(
                text: text.split('.').first,
                style: textStyleBigNumber,
              )
            : TextSpan(text: text, style: textStyleBigNumber),
        text.contains('.')
            ? TextSpan(
                text: '.${text.split('.').last}',
                style: textStyleKeyboardButtons)
            : const TextSpan(),
        // TextSpan(
        //   text: text.split('.').last,
        //   style: TextStyle(fontWeight: FontWeight.w700),
        // )
      ],
      // style: style,
    );
  }
}
