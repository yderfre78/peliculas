import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: []);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailsScreen()},
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
        color: Colors.red[900],
      )),
    );
  }
}
