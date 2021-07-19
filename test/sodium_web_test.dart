
@TestOn('browser')

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:sodium_web/sodium_web.dart';

void main() {
     test('pwhash', () {
      final outlen = 16;
      final passwd = utf8.encoder.convert('hello world');
      var s='10000111110110111111001110101010010100010001111011110011101010110101010101100101100110000111110000001000011110010001111011111';
      Uint8List salt=new Uint8List(s.length);
      for(int i=0;i<s.length;i++){
        salt[i]=(int.parse(s[i]));
      }
      print(salt);
      final opslimit = 1;
      final memlimit = 8192;
      final alg = 2;

      final hash =
          SodiumWeb.instance.cryptoPwhash(outlen, passwd, salt, opslimit, memlimit, alg);
      s='1011010110000110111101010101001001000110011101100111011110110100000011001110111110001001001011011001110111010100100101111000000';
      Uint8List res=new Uint8List(s.length);
            for(int i=0;i<s.length;i++){
        res[i]=(int.parse(s[i]));
      }
      expect(hash, res);
    });
}
