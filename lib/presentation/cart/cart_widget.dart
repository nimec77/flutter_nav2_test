import 'package:flutter/material.dart';
import 'package:flutter_nav2_test/domain/cart/entities/product.dart';
import 'package:flutter_nav2_test/presentation/cart/cart_badge_widget.dart';

class CartWidget extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<String> onItemTapped;

  const CartWidget({
    Key? key,
    required this.products,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(products[index].id),
        trailing: CartBadgeWidget(
          count: products[index].quantity,
        ),
        onTap: () => onItemTapped(products[index].id),
      ),
      separatorBuilder: (_, index) => const Divider(),
    );
  }
}
