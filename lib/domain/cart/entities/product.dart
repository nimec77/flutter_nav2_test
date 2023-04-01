import 'dart:math' as math;

class Product {
  final String id;
  final int quantity;

  const Product({required this.id, required this.quantity});

  Product.fromIndex(int index)
      : this(
          id: 'Item ${index + 1}',
          quantity: math.Random().nextInt(10) + 1,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          quantity == other.quantity;

  @override
  int get hashCode => Object.hash(id, quantity);
}
