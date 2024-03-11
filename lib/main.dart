import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/cars_providers.dart';
import 'package:flutter_dashboard/Provider/employees_provider.dart';
import 'package:flutter_dashboard/Provider/inventory_provider.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/login_screen.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart'; // Import Provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child) => MultiProvider(
        providers: [
          ChangeNotifierProvider<TokenModel>(
            create: (context) => TokenModel(),
          ),
          ChangeNotifierProvider<CarsProvider>(
            create: (context) => CarsProvider(),
          ),
          ChangeNotifierProvider<Idmodel>(create: (_) => Idmodel()),
          ChangeNotifierProvider(create: (context) =>Employeeprovider()),
          ChangeNotifierProvider(create: (context) =>InventoryProvider()),
        ], 
        child: MaterialApp(
          title: 'Flutter Responsive Dashboard',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            primaryColor: MaterialColor(
              primaryColorCode,
              <int, Color>{
                50: const Color(primaryColorCode).withOpacity(0.1),
                100: const Color(primaryColorCode).withOpacity(0.2),
                200: const Color(primaryColorCode).withOpacity(0.3),
                300: const Color(primaryColorCode).withOpacity(0.4),
                400: const Color(primaryColorCode).withOpacity(0.5),
                500: const Color(primaryColorCode).withOpacity(0.6),
                600: const Color(primaryColorCode).withOpacity(0.7),
                700: const Color(primaryColorCode).withOpacity(0.8),
                800: const Color(primaryColorCode).withOpacity(0.9),
                900: const Color(primaryColorCode).withOpacity(1.0),
              },
            ),
            scaffoldBackgroundColor: const Color(0xFF171821),
            fontFamily: 'IBMPlexSans',
            brightness: Brightness.dark,
          ),
          home: const LoginScreen(),
        ),
      )

    );
  }
}
