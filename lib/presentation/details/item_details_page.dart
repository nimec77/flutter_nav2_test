import 'package:flutter/material.dart';
import 'package:flutter_nav2_test/presentation/details/item_details_widget.dart';

class ItemDetailsPage extends StatelessWidget {
  final String itemString;

  const ItemDetailsPage({Key? key, required this.itemString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Item Details'),
        ),
        body: Center(child: ItemDetailsWidget(itemString: itemString)),
      ),
    );
  }
}
