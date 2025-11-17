
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Main/index.dart' show MainPage;
import 'package:hm_shop/pages/Login/index.dart' show LoginPage;


Widget getRootWidget(){
  return MaterialApp(
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}


Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(),
    "/login": (context) => LoginPage(),
  };
}