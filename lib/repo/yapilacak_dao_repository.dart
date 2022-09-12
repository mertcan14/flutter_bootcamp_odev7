import 'package:todo_uygulamasi/model/yapilacak.dart';
import 'package:todo_uygulamasi/sqlite/veritabani_yardimcisi.dart';

class YapilacakDaoRepository{

  Future<List<Yapilacak>> getAllYapilacak() async{
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps =await db.rawQuery("SELECT * FROM yapilacaklar");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacak(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<List<Yapilacak>> getAllYapilacakByYapilacakIs(String yapilacak_is) async{
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps =await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$yapilacak_is%'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacak(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<void> addYapilacak(String yapilacak_is) async{
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.insert("yapilacaklar", bilgiler);
  }

  Future<void> updateYapilacak(Yapilacak yapilacak) async{
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["yapilacak_is"] = yapilacak.yapilacak_is;
    bilgiler["yapilacak_id"] = yapilacak.yapilacak_id;
    await db.update("yapilacaklar", bilgiler, where: "yapilacak_id = ?", whereArgs: [yapilacak.yapilacak_id]);
  }

  Future<void> deleteYapilacak(int yapilacak_id) async{
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    await db.delete("yapilacaklar", where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }
}