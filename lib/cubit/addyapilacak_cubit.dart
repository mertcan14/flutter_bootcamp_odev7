import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/repo/yapilacak_dao_repository.dart';

class AddyapilacakCubit extends Cubit<void>{
  AddyapilacakCubit():super(0);

  var yrepo = YapilacakDaoRepository();

  Future<void> yapilacakAdd(String yapilacak_is) async{
    await yrepo.addYapilacak(yapilacak_is);
  }
}