import 'package:apis/cubit/my_cubit.dart';
import 'package:apis/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter APIs',
      home: BlocProvider(
        create: (context) => getIt<MyCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}
