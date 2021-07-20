import 'dart:typed_data';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'interop/sodium_interop.dart' as interop;

class Sodium {
  Sodium._();
  static late Sodium instance;
  static void registerWith(Registrar registrar) {
    Sodium.instance = Sodium._();
  }

  static init() async {
    await Future.delayed(Duration(seconds: 1));
  }

  static num get cryptoPwhashSaltbytes => interop.crypto_pwhash_SALTBYTES;
  static num get cryptoBoxSeedbytes => interop.crypto_box_SEEDBYTES;
  static num get cryptoPwhashAlgArgon2i13 =>
      interop.crypto_pwhash_ALG_ARGON2I13;
  static num get cryptoBoxNoncebytes => interop.crypto_box_NONCEBYTES;
  static num get cryptoSecretboxNoncebytes =>
      interop.crypto_secretbox_NONCEBYTES;

  static Uint8List cryptoPwhash(num outlen, Uint8List passwd, Uint8List salt,
      num opslimit, num memlimit, int alg) {
    return interop.crypto_pwhash(outlen, passwd, salt, opslimit, memlimit, alg);
  }

  static Uint8List cryptoSecretboxEasy(Uint8List m, Uint8List n, Uint8List k) {
    return interop.crypto_secretbox_easy(m, n, k);
  }

  static Uint8List cryptoSecretboxOpenEasy(
      Uint8List c, Uint8List n, Uint8List k) {
    return interop.crypto_secretbox_open_easy(c, n, k);
  }

  static Uint8List cryptoSignDetached(Uint8List m, Uint8List sk) {
    return interop.crypto_sign_detached(m, sk);
  }

  static Uint8List cryptoSignEd25519SkToSeed(Uint8List sk) {
    return interop.crypto_sign_ed25519_sk_to_seed(sk);
  }

  static Uint8List randombytesBuf(int length) {
    return interop.randombytes_buf(length);
  }

  static KeyPair cryptoSignSeedKeypair(Uint8List seed) {
    final o = interop.crypto_sign_seed_keypair(seed);
    return KeyPair(pk:o.publicKey , sk:o.privateKey );
  }
}

class KeyPair {
  Uint8List sk, pk;
  KeyPair({required this.pk, required this.sk});
}
