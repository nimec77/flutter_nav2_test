import 'package:flutter/material.dart';
import 'package:flutter_nav2_test/presentation/list/item_list_widget.dart';
import 'package:flutter_nav2_test/route_names.dart';

class ItemListPage extends StatelessWidget {
  final int itemCount;
  final ValueChanged<String> onItemTapped;
  final ValueChanged<String> onRouteTapped;

  const ItemListPage({
    Key? key,
    this.itemCount = 42,
    required this.onItemTapped,
    required this.onRouteTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Item List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () => onRouteTapped(RouteNames.cartRoute),
            ),
          ],
        ),
        body: ItemListWidget(itemCount: itemCount, onItemTapped: onItemTapped),
      ),
    );
  }
}
