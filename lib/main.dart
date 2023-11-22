import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc_observer.dart';

import 'package:news/news%20cubit/newscubit_cubit.dart';
import 'package:news/services/get_news_service.dart';
import 'package:news/views/news_view.dart';
import 'package:news/views/webview.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(
        GetnewsService(),
      ),
      child: MaterialApp(
        routes: {
          HomeView.id: (context) => const HomeView(),
          ArticlesView.id: (context) => const ArticlesView()
        },
        initialRoute: HomeView.id,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
