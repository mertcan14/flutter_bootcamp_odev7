import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_uygulamasi/components/appbar_detail.dart';
import 'package:todo_uygulamasi/cubit/detailyapilacak_cubit.dart';
import 'package:todo_uygulamasi/model/yapilacak.dart';
import 'package:todo_uygulamasi/my_color.dart';

class DetailYapilacak extends StatefulWidget {
  Yapilacak yapilacak;

  DetailYapilacak({required this.yapilacak});

  @override
  _DetailYapilacakState createState() => _DetailYapilacakState();
}

class _DetailYapilacakState extends State<DetailYapilacak> {
  var istf = TextEditingController();

  @override
  void initState() {
    super.initState();
    istf.text = widget.yapilacak.yapilacak_is;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
        backgroundColor: backColor,
        appBar: AppbarDetail(title: "Yapilacak Detay",),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*2/100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: istf,
                decoration: InputDecoration(
                    hintText: "Yapilacak İş",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: mainColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: buttonColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: Icon(Icons.work)
                ),
              ),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:buttonColor,
                  ),
                  onPressed: () async{
                    widget.yapilacak.yapilacak_is = await istf.text;
                    context.read<DetailyapilacakCubit>().updateYapilacak(widget.yapilacak);
                  },
                  child: const Text("Güncelle", style: TextStyle(fontSize: 18),),
                ),
              ),
            ],
          ),
        )
    );
  }
}
