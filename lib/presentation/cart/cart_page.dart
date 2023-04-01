import 'package:flutter/material.dart';
import 'package:flutter_nav2_test/domain/cart/entities/product.dart';
import 'dart:math' as math;

import 'package:flutter_nav2_test/presentation/cart/cart_widget.dart';

class CartPage extends StatefulWidget {
  final int productCount;
  final ValueChanged<String> onItemTapped;

  const CartPage({
    Key? key,
    this.productCount = 5,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final List<Product> _products;

  @override
  void initState() {
    _products = List.generate(
      widget.productCount,
      (_) => Product.fromIndex(math.Random().nextInt(42)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: CartWidget(
          products: _products,
          onItemTapped: widget.onItemTapped,
        ),
      ),
    );
  }
}
