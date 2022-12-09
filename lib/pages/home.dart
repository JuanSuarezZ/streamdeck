import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamdeck/state/conectionSingelton/ssh_singelton.dart';

import '../state/conectionbloc/conection_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final conectionBloc = BlocProvider.of<ConectionBloc>(context);
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.abc),
          onPressed: () {
            conectionBloc.add(
              const InicialConection(
                ip: '192.168.2.76',
                port: 22,
                password: '0007',
                username: "juan",
              ),
            );
          },
        ),
      ),
    );
  }
}
