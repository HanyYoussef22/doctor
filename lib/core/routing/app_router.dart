
import 'package:doc_app/core/di/dependancy_injection.dart';
import 'package:doc_app/core/routing/roters.dart';
import 'package:doc_app/feathures/home/ui/home.dart';
import 'package:doc_app/feathures/login/logic/cubit/login_cubit.dart';

import 'package:doc_app/feathures/login/ui/login.dart';
import 'package:doc_app/feathures/onbording/ui/onboarder.dart';
import 'package:doc_app/feathures/sign_up/ui/sinup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboarderScreen(),
        );

      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getit<LoginCubit>(),
            child: const LoginScreen(),
          )
        );
        case Routers.homeScreen:
        return MaterialPageRoute(builder: (_)=>const HomeScreen());
        case Routers.signupScreen:
        return MaterialPageRoute(builder: (_)=>const SinUpScreen());

      // Add more cases for other routes as needed
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('no route defiend for ${settings.name}'),
                  ),
                ));
    }
  }
}
