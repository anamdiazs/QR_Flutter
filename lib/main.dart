import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/home_page.dart';
import 'package:qr_app/pages/map_page.dart';
import 'package:qr_app/provider/gestor_provider.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create:(BuildContext context) => GestorProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context ) => HomePage(),
          'maps': (BuildContext context ) => Maps()
        },
        theme: ThemeData(
          primaryColor: Colors.purple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation:0 , backgroundColor: Colors.lightBlue )
        ),
      ),
    );
  }
}