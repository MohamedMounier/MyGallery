import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallrey/core/routes/app_routes_names.dart';
import 'package:my_gallrey/presentation/controller/login_bloc.dart';
import 'package:my_gallrey/presentation/screens/login_screen.dart';


import 'routes/app_router.dart';
import 'utils/services/service_locator.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>LoginBloc(sl(),sl(),sl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        onGenerateRoute: AppRouter.onGenerateRoutes,
        initialRoute: AppRoutesName.login,
      ),
    );
  }
}
