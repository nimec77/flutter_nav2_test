import 'package:flutter/material.dart';

class CartBadgeWidget extends StatelessWidget {
  final int count;

  const CartBadgeWidget({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        shape: BoxShape.circle,
      ),
      child: Text('$count'),
    );
  }
}
