import 'package:flutter/material.dart';
import 'package:streamdeck/pages/home.dart';
import 'package:streamdeck/pages/conection_page.dart';

Map<String, Widget Function(BuildContext)> getAplicationRoutes = {
  'conecction': (_) => const ConectionPage(),
  'home': (_) => const HomePage(),
};
