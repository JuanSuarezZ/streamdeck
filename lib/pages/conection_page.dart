import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamdeck/models/coneccion_model.dart';
import 'package:streamdeck/state/conectionSingelton/ssh_singelton.dart';

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
                  password: '0007',
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
