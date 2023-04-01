import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final int itemCount;
  final ValueChanged<String> onItemTapped;

  const ItemListWidget({
    Key? key,
    required this.itemCount,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (_, index) {
        final itemString = 'Item ${index + 1} ';
        return ListTile(
          title: Text(itemString),
          onTap: () => onItemTapped(itemString),
        );
      },
    );
  }
}
