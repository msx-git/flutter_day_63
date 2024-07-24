import 'package:flutter/material.dart';
import 'package:flutter_day_63/model/karta.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  RxList<Karta> cards = [
    Karta(
      id: UniqueKey().toString(),
      cardNumber: 9860190101194990,
      cardHolderName: "Musoxon Pazliddinov",
      expiryMonth: 1,
      expiryYear: 2030,
      color: Colors.teal.value,
    ),
  ].obs;

  void addCard({
    required int cardNumber,
    required String cardHolderName,
    required int expiryMonth,
    required int expiryYear,
    required int color,
  }) {
    cards.add(
      Karta(
        id: UniqueKey().toString(),
        cardNumber: cardNumber,
        cardHolderName: cardHolderName,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        color: color,
      ),
    );
  }
}
