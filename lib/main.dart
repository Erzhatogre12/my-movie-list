import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_movie_list/Movies/pages/movie_page.dart';
import 'package:my_movie_list/Movies/provider/movie_get_now_playing_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_get_popular_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_get_top_rated_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_get_upcoming_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_search_provider.dart';
import 'package:my_movie_list/injector.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(const App());
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetUpcomingProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetPopularProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetTopRatedProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetNowPlayingProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieSearchProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'My Movie List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MoviePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
