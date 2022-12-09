import 'package:dartssh2/dartssh2.dart';
import 'dart:developer' as dev;

class SSHSingleton {
  //save the private constructor
  static final SSHSingleton _singleton =
      SSHSingleton._internal(port: "init", null);

  final String port;
  SSHClient? client;

  //constructor by default
  factory SSHSingleton() {
    return _singleton;
  }

  //private constructor
  SSHSingleton._internal(this.client, {required this.port});

  Future<void> initSSHClient() async {
    final client = SSHClient(
      await SSHSocket.connect('192.168.2.76', 22),
      username: 'juan',
      onPasswordRequest: () => '0007',
    );

    await client.run('export DISPLAY=:0');

    _singleton.client = client;
  }

  //
  Future<void> reconect() async {
    final client = SSHClient(
      await SSHSocket.connect('192.168.2.76', 22),
      username: 'juan',
      onPasswordRequest: () => '0007',
    );
    _singleton.client = client;
    dev.log("SockeT");
  }
}
