import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streamdeck/widgets/pad_panel.dart';
import 'package:streamdeck/widgets/program_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //vars
  var buttons = [
    ProgramButton(
      icon: Icons.power_settings_new_rounded,
      function: () => {},
    ),
    ProgramButton(
      asset: "assets/vscode.png",
      function: () => {},
    ),
    ProgramButton(
      icon: Icons.abc,
      function: () => {},
    ),
    ProgramButton(
      icon: Icons.abc,
      function: () => {},
    ),
    ProgramButton(
      icon: Icons.abc,
      function: () => {},
    ),
    ProgramButton(
      icon: Icons.abc,
      function: () => {},
    ),
    ProgramButton(
      icon: Icons.abc,
      function: () => {},
    ),
    ProgramButton(
      icon: Icons.abc,
      function: () => {},
    ),
    ProgramButton(
      icon: Icons.abc,
      function: () => {},
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: buttons,
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
