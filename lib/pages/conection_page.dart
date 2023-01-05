import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamdeck/models/coneccion_model.dart';

import '../state/conectionbloc/conection_bloc.dart';

class ConectionPage extends StatefulWidget {
  const ConectionPage({super.key});

  @override
  State<ConectionPage> createState() => _ConectionPage();
}

class _ConectionPage extends State<ConectionPage> {
  @override
  Widget build(BuildContext context) {
    final conectionBloc = BlocProvider.of<ConectionBloc>(context);
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.abc),
          onPressed: () async {
            conectionBloc.add(
              InicialConection(
                coneccionModel: ConeccionModel(
                  username: "juan",
                  ip: '192.168.2.76',
                  port: 22,
                  password: 'xxxx',
                ),
              ),
            );
            Navigator.pushNamed(context, 'home');
          },
        ),
      ),
    );
  }
}
