import 'package:flutter/material.dart';
import '../constants/edit_mode.dart';
import '../constants/route_names.dart';
import '../ui/pages/app_drawer/app_drawer.dart';
import '../ui/pages/edit_page/edit_page.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/reorder_page/reorder_page.dart';
import '../ui/pages/settings_page/settings_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name == null) throw 'Route Name is null!';

  switch (settings.name) {
    case homePageRoute:
      return _getPageRoute(settings.name!, const HomePage());
    case appDrawerRoute:
      return _getPageRoute(settings.name!, const AppDrawerScreen());
    case editPageRoute:
      var editMode = settings.arguments as EditMode;
      return _getPageRoute(settings.name!, EditPage(editMode));
    case reorderPageRoute:
      var editMode = settings.arguments as EditMode;
      return _getPageRoute(settings.name!, ReorderPage(editMode));
    case settingsPageRoute:
      return _getPageRoute(settings.name!, const SettingsPage());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Undefined Route'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute(String routeName, Widget viewToShow) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName), builder: (_) => viewToShow);
}
