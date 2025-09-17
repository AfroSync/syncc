import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/view/favourite/favourite_screen.dart';
import 'package:syncc/view/profile/profile_screen.dart';
import 'package:syncc/view/catalog/catalog_screen.dart';
import 'package:syncc/view/license/license_screen.dart';
import 'package:syncc/view/widget/modern_navigation.dart';
import 'package:syncc/core/routes.dart';

import 'license/delete.dart';

enum TabView {
  catalog(
    name: 'Catalog',

    icon: CupertinoIcons.music_albums_fill,
    route: ModernRoutes.catalog,
  ),
  favourite(
    name: 'Favourite',
    icon: CupertinoIcons.heart_fill,
    route: ModernRoutes.catalog,
  ),
  license(
    name: 'License',
    icon: CupertinoIcons.doc_append,
    route: ModernRoutes.license,
  ),
  profile(name: 'Profile', icon: Icons.person, route: ModernRoutes.profile);

  const TabView({required this.name, required this.icon, required this.route});

  final String name;
  final IconData icon;
  final String route;

  Widget get screen {
    switch (this) {
      case TabView.profile:
        return const ProfileScreen();
      case TabView.catalog:
        return const CatalogScreen();
      case TabView.license:
        return const LicenseScreen();
      case TabView.favourite:
        return const FavouriteScreen();
    }
  }
}

class HomeWidget extends StatefulWidget {
  final TabView? defaultTab;

  const HomeWidget({super.key, this.defaultTab});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late TabView _currentTab;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.defaultTab ?? TabView.catalog;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(child: ModernNavigation(currentTab: _currentTab)),
    );
  }
}
