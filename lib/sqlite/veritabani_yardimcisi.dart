import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

class VeriTabaniYardimcisi{
  static final String veritabaniAdi= "tododb.sqlite";

  static Future<Database> veriTabaniErisim() async{
    String veritabaniYolu= join(await getDatabasesPath(), veritabaniAdi);
    if(await databaseExists(veritabaniYolu)){
      print("Veri tabani zaten var kopyalama yapmaya gerek yok");
    }else{
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("veri tabanı kopyalandı");
    }
    return openDatabase(veritabaniYolu);
  }
}
