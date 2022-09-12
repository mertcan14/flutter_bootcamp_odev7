import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_uygulamasi/cubit/homepage_cubit.dart';
import 'package:todo_uygulamasi/model/yapilacak.dart';
import 'package:todo_uygulamasi/my_color.dart';
import 'package:todo_uygulamasi/pages/add_yapilacak.dart';
import 'package:todo_uygulamasi/pages/detail_yapilacak.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomepageCubit>().yapilacaklarYukle();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title:aramaYapiliyorMu ?
        TextField(
          decoration: InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonuc){
            context.read<HomepageCubit>().ara(aramaSonuc);
          },
        ) :
        const Text("Yapılacaklar", style: TextStyle(fontFamily: "DynaPuff"),),
        actions: [
          aramaYapiliyorMu ?
          IconButton(
              onPressed: (){
                setState(() {
                  aramaYapiliyorMu = false;
                });
               context.read<HomepageCubit>().yapilacaklarYukle();
              },
              icon: const Icon(Icons.clear)
          ):
          IconButton(
              onPressed: (){
                setState(() {
                  aramaYapiliyorMu = true;
                });
              },
              icon: const Icon(Icons.search)
          ),
        ],
      ),
      body: BlocBuilder<HomepageCubit ,List<Yapilacak>>(
        builder: (context, yapilacakListesi){
          if(yapilacakListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yapilacakListesi.length,
              itemBuilder: (context, index){
                var yapilacak = yapilacakListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailYapilacak(yapilacak: yapilacak))).then((value){
                      context.read<HomepageCubit>().yapilacaklarYukle();
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*2/100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${yapilacak.yapilacak_id}  -  ${yapilacak.yapilacak_is}", style: TextStyle(fontSize: 18),),
                          IconButton(
                              onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${yapilacak.yapilacak_is} kişisi silinsin mi?"),
                                      action: SnackBarAction(
                                        onPressed: (){
                                          context.read<HomepageCubit>().sil(yapilacak.yapilacak_id);
                                        },
                                        label: "Evet",
                                      ),
                                    )
                                );
                              },
                              icon: const Icon(Icons.delete, color: Colors.deepOrange,)
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mainColor,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddYapilacak())).then((value){
            context.read<HomepageCubit>().yapilacaklarYukle();
          });
        },
        icon: Icon(Icons.add),
        label:const Text("Kayit"),
      ),
    );
  }
}
