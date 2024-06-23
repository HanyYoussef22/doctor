import 'package:doc_app/core/routing/app_router.dart';
import 'package:doc_app/core/routing/roters.dart';
import 'package:doc_app/core/theming/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Doctor',
        theme: ThemeData(
          primaryColor: ColorsManger.primaryColor,
          scaffoldBackgroundColor: ColorsManger.mainBackgroundColor
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routers.onBordingScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
