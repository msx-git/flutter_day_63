import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day_63/controller/card_controller.dart';
import 'package:get/get.dart';

final cardController = Get.find<CardController>();

class AddCardButton extends StatelessWidget {
  AddCardButton({super.key});

  final cardNumberController = TextEditingController();
  final cardHolderController = TextEditingController();
  final cardMonthController = TextEditingController();
  final cardYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Get.defaultDialog(
          title: 'Add card',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// CARD NUMBER INPUT
              TextField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(16)],
                decoration: InputDecoration(
                  labelText: 'Card number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// CARD HOLDER INPUT
              TextField(
                controller: cardHolderController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Holder name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// CARD EXPIRY MONTH INPUT
              TextField(
                controller: cardMonthController,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(2)],
                decoration: InputDecoration(
                  labelText: 'Expiry month',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// CARD EXPIRY YEAR INPUT
              TextField(
                controller: cardYearController,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(4)],
                decoration: InputDecoration(
                  labelText: 'Expiry year',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          textCancel: 'Cancel',
          textConfirm: 'Add',
          onConfirm: () {
            final random = Random().nextInt(200);
            cardController.addCard(
              cardNumber: int.parse(cardNumberController.text),
              cardHolderName: cardHolderController.text,
              expiryMonth: int.parse(cardMonthController.text),
              expiryYear: int.parse(cardYearController.text),
              color: Color.fromRGBO(random, random, random, 1).value,
            );
            Get.back();
          },
        );
      },
      label: const Text("Add card"),
    );
  }
}
