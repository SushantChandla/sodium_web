import 'dart:typed_data';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'interop/sodium_interop.dart' as interop;


class SodiumWeb {
  SodiumWeb._();
  static late  SodiumWeb instance;
  static void registerWith(Registrar registrar) {
    SodiumWeb.instance =SodiumWeb._();
  }

  init() async{
   await Future.delayed(Duration(seconds: 1));
  }
  
  num get cryptoPwhashSaltbytes=>interop.crypto_pwhash_SALTBYTES;
  num get cryptoBoxSeedbytes=>interop.crypto_box_SEEDBYTES;
  num get cryptoPwhashAlgArgon2i13=>interop.crypto_pwhash_ALG_ARGON2I13;
  num get cryptoBoxNoncebytes=>interop.crypto_box_NONCEBYTES;
  num get cryptoSecretboxNoncebytes=>interop.crypto_secretbox_NONCEBYTES;

  
  Uint8List cryptoPwhash(num outlen,Uint8List passwd,Uint8List salt,num opslimit,num memlimit,int alg){
    return interop.crypto_pwhash(outlen, passwd, salt, opslimit, memlimit, alg);
  }

  Uint8List cryptoSecretboxEasy(Uint8List m, Uint8List n, Uint8List k){
    return interop.crypto_secretbox_easy(m, n, k);
  }

  Uint8List cryptoSecretboxOpenEasy(Uint8List c, Uint8List n, Uint8List k){
    return interop.crypto_secretbox_open_easy(c, n, k);
  }


  Uint8List cryptoSignDetached(Uint8List m, Uint8List sk){
    return interop.crypto_sign_detached(m, sk);
  }
  Uint8List cryptoSignEd25519SkToSeed(Uint8List sk){
    return interop.crypto_sign_ed25519_sk_to_seed(sk);
  }
   Uint8List randombytesBuf(int length){
    return interop.randombytes_buf(length);
  }

  dynamic cryptoSignSeedKeypair(Uint8List seed){
    return interop.crypto_sign_seed_keypair(seed);
  }
 }

