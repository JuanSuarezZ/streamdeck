import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamdeck/core/routes.dart';
import 'package:streamdeck/state/conectionbloc/conection_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConectionBloc>(create: (_) => ConectionBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        routes: getAplicationRoutes,
        initialRoute: "conecction",
        // home: Scaffold(body: MainPage()),
      ),
    );
  }
}
