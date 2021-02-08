import 'package:flutter/material.dart';
import 'package:resturent_book/auth_pages/signup.dart';
import 'package:resturent_book/pages/book.dart';
import 'package:resturent_book/pages/dashboard.dart';

import 'auth_pages/login.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var signuparg=settings.arguments;


  switch (settings.name) {


    case 'signup':
      return MaterialPageRoute(builder: (context) => SignUp());

    case 'login':
      return MaterialPageRoute(builder: (context) => Login());

    case 'dashboard':
      return MaterialPageRoute(builder: (context) => Dashbaord());

    case 'booking':
      return MaterialPageRoute(builder: (context) => book(signuparg));

  }
}