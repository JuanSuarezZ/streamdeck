import 'dart:convert';
import 'dart:developer';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamdeck/core/routes.dart';
import 'package:streamdeck/pages/conection_page.dart';
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
        initialRoute: "",
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    conect();
  }

  @override
  dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.dispose();
  }

  bool i = false;
  late SSHClient client;
  final comands = {
    "volumeMute": "amixer -D pulse sset Master mute",
    "volumeUnMute": "amixer -D pulse sset Master unmute",
  };

  @override
  Widget build(BuildContext context) {
    return i == false
        ? Container()
        : Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.power_settings_new,
                        size: 50,
                      ),
                      onPressed: () async {
                        log("apagar");
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.volume_off,
                        size: 50,
                      ),
                      onPressed: () async {
                        final uptime =
                            await client.run(comands["volumeMute"].toString());
                        log(utf8.decode(uptime).toString());
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.volume_up,
                        size: 50,
                      ),
                      onPressed: () async {
                        final uptime = await client
                            .run(comands["volumeUnMute"].toString());
                        log(utf8.decode(uptime).toString());
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 12),
                      child: InkWell(
                        child: Image.network(
                          "https://www.muylinux.com/wp-content/uploads/2018/01/firefox58.jpg",
                          height: 50,
                        ),
                        onTap: () async {
                          final uptime =
                              await client.run('DISPLAY=:0 nohup firefox');
                          log(utf8.decode(uptime).toString());
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 12),
                      child: InkWell(
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png",
                          height: 50,
                        ),
                        onTap: () async {
                          final uptime =
                              await client.run('DISPLAY=:0 nohup code');
                          log(utf8.decode(uptime).toString());
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }

  conect() async {
    final client = SSHClient(
      await SSHSocket.connect('192.168.2.76', 22),
      username: 'juan',
      onPasswordRequest: () => '0007',
    );

    await client.run('export DISPLAY=:0');

    setState(
      () {
        i = true;
        this.client = client;
        log("conectado");
      },
    );
    //
  }
}
