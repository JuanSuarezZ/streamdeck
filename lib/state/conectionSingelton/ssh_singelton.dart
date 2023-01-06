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

const file = '''-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----''';
