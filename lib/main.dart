import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallrey/core/app.dart';
import 'package:my_gallrey/core/shared/bloc_observer.dart';
import 'package:my_gallrey/core/utils/services/service_locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   ServiceLocator().init();
   Bloc.observer =MyBlocObserver();
  runApp(
    MyApp()
  );
}


