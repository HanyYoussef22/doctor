import 'package:doc_app/core/routing/roters.dart';
import 'package:doc_app/feathures/onbording/ui/onboarder.dart';
import 'package:flutter/material.dart';

class AppRouter {
   Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboarderScreen(),
        );
    
    //  case Routers.homeScreen:
    //    return MaterialPageRoute(
    //      builder: (context) => const homeScreen(),
    //    );

    // Add more cases for other routes as needed
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('no route defiend for ${settings.name}'),
            ),
          )
        );
    }
  }
}