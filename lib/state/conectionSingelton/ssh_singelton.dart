import 'package:dartssh2/dartssh2.dart';
import 'dart:developer' as dev;

import 'package:streamdeck/models/coneccion_model.dart';

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

  Future<void> initSSHClient(ConeccionModel c) async {
    try {
      final client = SSHClient(
        await SSHSocket.connect(c.ip, c.port),
        username: c.username,
        identities: SSHKeyPair.fromPem(file),
      );
      await client.run('export DISPLAY=:0');
      _singleton.client = client;
    } catch (e) {
      dev.log("error + $e");
      _singleton.client = client;
    }
  }
}

const file = '''''';
