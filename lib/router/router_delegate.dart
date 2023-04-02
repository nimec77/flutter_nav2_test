import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nav2_test/presentation/pages.dart';
import 'package:flutter_nav2_test/route_names.dart';
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

      return ShopListRouteConfig.nestedItemRoute(
        id: itemId,
        selectedItem: _selectedItem,
        selectedRoute: _selectedRoute,
      );
    }

    if (_selectedItem != null) {
      final splitItem = _selectedItem!.split(' ');
      final itemId = int.parse(splitItem[1]);

      return ShopListRouteConfig.details(
        selectedItem: _selectedItem,
        id: itemId,
      );
    }

    return ShopListRouteConfig.list();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('ItemListPage'),
          child: ItemListPage(
            onItemTapped: _onItemTapped,
            onRouteTapped: _onRouteTapped,
          ),
        ),
        if (show404)
          const MaterialPage(
            key: ValueKey('ErrorPage'),
            child: Center(
              child: Text('404'),
            ),
          )
        else if (_selectedItem != null)
          MaterialPage(
            key: ValueKey(_selectedItem),
            child: ItemDetailsPage(
              itemString: _selectedItem!,
            ),
          )
        else if (_selectedRoute != null &&
            _selectedRoute == RouteNames.cartRoute)
          MaterialPage(
            key: ValueKey(_selectedRoute),
            child: CartPage(onItemTapped: _onItemTapped),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_selectedItem != null && _selectedRoute != null) {
          _selectedItem = null;
          notifyListeners();
          return true;
        }
        _selectedItem = null;
        _selectedRoute = null;
        notifyListeners();

        return true;
      }
    );
  }

  @override
  Future<void> setNewRoutePath(ShopListRouteConfig configuration) async {
    isInvalidCartItem(id) => id < 0 || id % 2 != 0 || id >= 10;

    if (configuration.show404) {
      show404 = true;
      _selectedItem = null;
      _selectedRoute = null;
      return;
    }

    if (configuration.isDetailPage) {
      if (configuration.id! >= 10) {
        show404 = true;
        return;
      }
      _selectedItem = configuration.selectedItem;
      return;
    } else if (configuration.isNewPage) {
      if (configuration.selectedRoute != RouteNames.cartRoute) {
        show404 = true;
        return;
      }
      _selectedRoute = configuration.selectedRoute;
    } else if (configuration.isNestedPage) {
      if (isInvalidCartItem(configuration.id!)) {
        show404 = true;
        return;
      }
      _selectedItem = configuration.selectedItem;
      _selectedRoute = configuration.selectedRoute;
    } else {
      _selectedItem = null;
      _selectedRoute = null;
    }

    show404 = false;
  }

  void _onItemTapped(String item) {
    _selectedItem = item;
    notifyListeners();
  }

  void _onRouteTapped(String route) {
    _selectedItem = null;
    _selectedRoute = route;
    notifyListeners();
  }
}
