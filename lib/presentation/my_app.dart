import 'package:flutter/material.dart';
import 'package:flutter_nav2_test/presentation/cart/cart_page.dart';
import 'package:flutter_nav2_test/presentation/details/item_details_page.dart';
import 'package:flutter_nav2_test/presentation/list/item_list_page.dart';
import 'package:flutter_nav2_test/route_names.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _selectedItem;
  String? _selectedRoute;
  var show404 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('ItemListPage'),
            child: ItemListPage(
              onItemTapped: _onItemTapped,
              onRouteTapped: _onRouteTapped,
            ),
          ),
          if (show404)
            MaterialPage(
              key: const ValueKey('UnknownPage'),
              child: Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text('404'),
                ),
              ),
            )
          else if (_selectedItem != null)
            MaterialPage(
                key: ValueKey(_selectedItem),
                child: ItemDetailsPage(
                  itemString: _selectedItem!,
                ))
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
            setState(() {
              _selectedItem = null;
            });
            return true;
          }

          setState(() {
            _selectedRoute = null;
            _selectedItem = null;
          });

          return true;
        },
      ),
    );
  }

  void _onItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  void _onRouteTapped(String route) {
    setState(() {
      _selectedItem = null;
      _selectedRoute = route;
    });
  }
}
