import 'package:flutter/widgets.dart';
import 'package:flutter_nav2_test/router/router.dart';

class ShopListRouterDelegate extends RouterDelegate<ShopListRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ShopListRouteConfig> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  String? _selectedItem;
  String? _selectedRoute;
  bool show404 = false;

  ShopListRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  ShopListRouteConfig get currentConfiguration {
    if (show404) {
      return ShopListRouteConfig.error();
    }

    if (_selectedRoute != null && _selectedItem == null) {
      return ShopListRouteConfig.newRoute(_selectedRoute);
    }

    if (_selectedRoute != null && _selectedItem != null) {
      final splitItem = _selectedItem!.split(' ');
      final itemId = int.parse(splitItem[1]);

      return ShopListRouteConfig.details(_selectedItem, itemId);
    }

    return ShopListRouteConfig.list();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(ShopListRouteConfig configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
