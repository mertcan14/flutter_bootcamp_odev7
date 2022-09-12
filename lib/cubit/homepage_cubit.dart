import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/model/yapilacak.dart';
import 'package:todo_uygulamasi/repo/yapilacak_dao_repository.dart';
class HomepageCubit extends Cubit<List<Yapilacak>>{
  HomepageCubit():super(<Yapilacak>[]);

  var yrepo = YapilacakDaoRepository();

  Future<void> yapilacaklarYukle() async{
    var liste = await yrepo.getAllYapilacak();
    emit(liste);
  }

  Future<void> ara(String yapilacak_is) async{
    var liste = await yrepo.getAllYapilacakByYapilacakIs(yapilacak_is);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async{
    await yrepo.deleteYapilacak(yapilacak_id);
    await yapilacaklarYukle();
  }
}