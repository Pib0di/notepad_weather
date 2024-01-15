import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad_weather/features/authentication/authentication.dart';
import 'package:notepad_weather/features/home_page/bloc/home_page_bloc.dart';
import 'package:notepad_weather/features/home_page/home_page.dart';
import 'package:notepad_weather/firebase_options.dart';
import 'package:notepad_weather/theme/theme.dart';

part 'router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        // home: HomePage(),
        debugShowCheckedModeBanner: false,
        title: 'Weather Diary',
        theme: themeData,
      ),
    );
  }
}
