import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_uygulamasi/components/appbar_detail.dart';
import 'package:todo_uygulamasi/cubit/addyapilacak_cubit.dart';
import 'package:todo_uygulamasi/my_color.dart';

class AddYapilacak extends StatefulWidget {
  const AddYapilacak({Key? key}) : super(key: key);

  @override
  _AddYapilacakState createState() => _AddYapilacakState();
}

class _AddYapilacakState extends State<AddYapilacak> {
  var istf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppbarDetail(title: "Yapılacak Ekle"),
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
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: Icon(Icons.work)
              ),
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: (){
                  context.read<AddyapilacakCubit>().yapilacakAdd(istf.text);
                },
                style: ElevatedButton.styleFrom(
                  primary:buttonColor,
                ),
                child: const Text("Ekle", style: TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      )
    );
  }
}
