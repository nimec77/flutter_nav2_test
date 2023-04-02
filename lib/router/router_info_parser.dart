import 'package:flutter/widgets.dart';
import 'package:flutter_nav2_test/route_names.dart';
import 'package:flutter_nav2_test/router/router.dart';

class ShopListRouterInformationParser
    extends RouteInformationParser<ShopListRouteConfig> {
  @override
  Future<ShopListRouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return ShopListRouteConfig.list();
    }

    if (uri.pathSegments.length == 2) {
      var secondSegment = uri.pathSegments[1];
      var id = int.tryParse(secondSegment);

      if (id == null) {
        return ShopListRouteConfig.error();
      }
      if (uri.pathSegments[0] == 'items') {
        return ShopListRouteConfig.nestedItemRoute(
          id: id,
          selectedItem: 'item $id',
          selectedRoute: uri.pathSegments[0],
        );
      }
    }
    if (uri.pathSegments.length == 1) {
      if (!RouteNames.routes.contains(uri.pathSegments[0])) {
        return ShopListRouteConfig.error();
      }
      return ShopListRouteConfig.newRoute(uri.pathSegments[0]);
    }

    return ShopListRouteConfig.error();
  }

  @override
  RouteInformation? restoreRouteInformation(ShopListRouteConfig configuration) {
    if (configuration.show404) {
      return const RouteInformation(location: '/404');
    }
    if (configuration.isListPage) {
      return const RouteInformation(location: '/');
    }
    if (configuration.isNewPage) {
      return RouteInformation(location: '/${configuration.selectedRoute}');
    }
    if (configuration.isNestedPage) {
      return RouteInformation(
          location: '/${configuration.selectedRoute}/${configuration.id}');
    }
    if (configuration.isDetailPage) {
      return RouteInformation(location: '/items/${configuration.id}');
    }

    return null;
  }
}
