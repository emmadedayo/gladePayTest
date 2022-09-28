import 'package:flutter/material.dart';
import 'package:weather/core/constants/router_constant.dart';
import 'package:weather/presentation/screens/history/history_and_time_screen.dart';
import 'package:weather/presentation/screens/home/home_page_screen.dart';
import 'package:weather/presentation/screens/search/map_search.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {

    Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen()
        );
      case historyTime:
        return MaterialPageRoute(builder: (_) => HistoryTimeScreen(history: arguments!['history'],hours: arguments!['hours'],future: arguments!['future']));
      case locationSearch:
        return MaterialPageRoute(
            builder: (_) => const MapSearchScreen()
        );
      default:
        return null;
    }
  }
}