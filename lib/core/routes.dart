import 'package:flutter/material.dart';
import 'package:streamdeck/pages/home.dart';

Map<String, Widget Function(BuildContext)> getAplicationRoutes = {
  'home': (_) => const HomePage()
};
