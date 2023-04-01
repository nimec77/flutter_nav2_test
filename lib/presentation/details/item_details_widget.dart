import 'package:flutter/material.dart';

class ItemDetailsWidget extends StatelessWidget {
  final String itemString;

  const ItemDetailsWidget({Key? key, required this.itemString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(itemString, style: Theme.of(context).textTheme.headline2),
        Text('$itemString Details'),
      ],
    );
  }
}
