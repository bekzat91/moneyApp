import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controller/balance_controller.dart';
import '../../utils.dart';

class Payment extends StatelessWidget {
  Payment({Key? key}) : super(key: key);

  final TextEditingController toWhomController = TextEditingController();

  final homeStateController = Get.find<BalanceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: GestureDetector(
          onTap: () => closeKeyBoard(context),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: colorMain,
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 93,
                        ),
                        const Text(
                          'To whom?',
                          style: textStyleQuestion,
                        ),
                        const SizedBox(
                          height: 86,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 44),
                          child: TextField(
                            style: textStyleKeyboardButtons,
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: toWhomController,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
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
                                  'Pay',
                                  style: textStyleButton,
                                ),
                              ),
                            ),
                            onTap: () {
                              homeStateController.pay(
                                  paymentAmount: Get.arguments[0],
                                  name: toWhomController.text,
                                  type: typePayment);
                              Get.toNamed('/');
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
