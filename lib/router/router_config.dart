class ShopListRouteConfig {
  final int? id;
  final String? selectedItem;
  final String? selectedRoute;
  final bool show404;

  ShopListRouteConfig.list()
      : id = null,
        selectedItem = null,
        selectedRoute = null,
        show404 = false;

  ShopListRouteConfig.newRoute(this.selectedRoute)
      : id = null,
        selectedItem = null,
        show404 = false;

  ShopListRouteConfig.nestedItemRoute({
    required this.id,
    required this.selectedItem,
    required this.selectedRoute,
  }) : show404 = false;

  ShopListRouteConfig.details({
    required this.selectedItem,
    required this.id,
  })  : selectedRoute = null,
        show404 = false;

  ShopListRouteConfig.error()
      : id = null,
        selectedItem = null,
        selectedRoute = null,
        show404 = true;

  bool get isListPage => selectedRoute == null && selectedItem == null;

  bool get isDetailPage => selectedRoute == null && selectedItem != null;

  bool get isNewPage => selectedRoute != null && selectedItem == null;

  bool get isNestedPage => selectedRoute != null && selectedItem != null;
}
