import 'package:flutter/material.dart';
import 'package:flutter_day_63/utils/extensions.dart';
import 'package:get/get.dart';

import '../../controller/card_controller.dart';
import '../widgets/add_card_button.dart';

final cardController = Get.put(CardController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = cardController.cards;
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final card = cards[index];
            return Container(
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(card.color).withOpacity(0.3),
                border: Border.all(color: Color(card.color), width: 3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    card.cardHolderName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "${card.cardNumber}".formatCardNumber(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${card.expiryMonth} / ${card.expiryYear}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: AddCardButton(),
    );
  }
}
