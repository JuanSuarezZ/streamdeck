import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamdeck/state/conectionbloc/conection_bloc.dart';
import 'package:streamdeck/widgets/pad_panel.dart';
import 'package:streamdeck/widgets/program_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //vars

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    crossAxisCount: 3,
                    children: getButtons(context),
                  ),
                ),
              ),
              const Flexible(
                flex: 2,
                child: PadPanel(),
              )
            ],
          ),
        ),
      ),
    );
  }

  getButtons(BuildContext c) {
    final conectionBloc = BlocProvider.of<ConectionBloc>(context);

    return [
      ProgramButton(
        icon: Icons.power_settings_new_rounded,
        function: () => {},
      ),
      ProgramButton(
        asset: "assets/vscode.png",
        function: () => {},
      ),
      ProgramButton(
        asset: "assets/android_studio.png",
        function: () => {},
      ),
      ProgramButton(
        asset: "assets/google_chrome.png",
        function: () => {},
      ),
      ProgramButton(
        asset: "assets/folder.png",
        function: () => {},
      ),
      ProgramButton(
        asset: "assets/terminal.png",
        function: () => {},
      ),
      ProgramButton(
        icon: Icons.volume_off,
        icon2: Icons.volume_up,
        function: () => conectionBloc.add(const SoundON()),
        function2: () => conectionBloc.add(const SoundOff()),
      ),
      ProgramButton(
        icon: Icons.mic_off,
        icon2: Icons.mic,
        function: () => {},
      ),
      ProgramButton(
        icon: Icons.star,
        function: () => {},
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
