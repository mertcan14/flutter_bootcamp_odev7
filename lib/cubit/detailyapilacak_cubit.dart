import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/model/yapilacak.dart';
import 'package:todo_uygulamasi/repo/yapilacak_dao_repository.dart';

class DetailyapilacakCubit extends Cubit<void>{
  DetailyapilacakCubit():super(0);

  var yrepo = YapilacakDaoRepository();

  Future<void> updateYapilacak(Yapilacak yapilacak) async{
    await yrepo.updateYapilacak(yapilacak);
  }
}