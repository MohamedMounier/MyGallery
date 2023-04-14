import 'package:flutter/material.dart';
import 'package:my_gallrey/core/routes/app_routes_names.dart';
import 'package:my_gallrey/presentation/screens/gallery_screen.dart';
import 'package:my_gallrey/presentation/screens/login_screen.dart';

class AppRouter {
static Route<dynamic> onGenerateRoutes (RouteSettings settings){
  switch (settings.name){
    case AppRoutesName.login:
      return MaterialPageRoute(builder: (_)=>  LoginScreen());
    case AppRoutesName.gallery:
      return MaterialPageRoute(builder: (_)=>  GalleryScreen());
    default:
      return MaterialPageRoute(builder: (_)=>  Container());

  }
}
}