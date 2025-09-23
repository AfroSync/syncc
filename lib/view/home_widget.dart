import 'package:afrosync/view/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/view/profile/profile_screen.dart';
import 'package:afrosync/view/catalog/catalog_screen.dart';
import 'package:afrosync/view/license/license_screen.dart';
import 'package:afrosync/view/widget/modern_navigation.dart';
import 'package:afrosync/core/routes.dart';

enum TabView {
  catalog(
    name: 'Catalog',

    icon: CupertinoIcons.music_albums,
    route: ModernRoutes.catalog,
  ),
  search(
    name: 'Finder',
    icon: CupertinoIcons.search_circle,
    route: ModernRoutes.search,
  ),
  license(
    name: 'License',
    icon: CupertinoIcons.doc_append,
    route: ModernRoutes.license,
  ),
  profile(
    name: 'Profile',
    icon: CupertinoIcons.person,
    route: ModernRoutes.profile,
  );

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
      case TabView.search:
        return const SearchScreen();
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
