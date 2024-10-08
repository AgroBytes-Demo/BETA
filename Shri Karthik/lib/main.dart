import 'package:bloc/bloc.dart' show Bloc;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'src/modules/home/views/home_screen.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'simple_bloc_observer.dart';
import 'firebase_myoptions.dart';

void main() async {
  setPathUrlStrategy();
	GoRouter.optionURLReflectsImperativeAPIs = true;
	WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Bloc.observer = SimpleBlocObserver();
  
  runApp(const MyApp());
}