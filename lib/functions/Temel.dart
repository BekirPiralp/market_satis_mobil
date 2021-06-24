import 'package:flutter/material.dart';



class Temel {
  // global değişkenler
  BuildContext context;
  List<Widget> Menu = [];

  //ne olur ne olmaz diye nesne oluşturmayı sağlama aldık
  /*Temel({BuildContext context}){
    this.context=context;
  }*/


  Widget sinirDuzenle(Widget govde){
    return SingleChildScrollView(
      child: govde,
    );
  }

  List<Widget>menuget(){
    return Menu;
  }

  Widget menu(BuildContext context){
     //MaterialPageRoute<void>(
     // builder:
        //(BuildContext context) {
        final tiles = Menu.map((Widget e) {
          return e;
        });

        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
          color: Colors.amber,
        ).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text("M E N Ü"),
            centerTitle: true,
          ),
          body: ListView(
            children: divided,
          ),
        );
     // },
    //);
  }


  void menuEkle({String baslik,var veri,BuildContext context, fonksiyon(context)}) {
    Menu.add(
      ListTile(
        title: Text(baslik),
        trailing: Icon(
          Icons.aspect_ratio,
          color: Colors.blueAccent,
        ),
        onTap: () {
          /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => fonksiyon(context),
            settings: RouteSettings(
              arguments: veri,
            ),
          ));*/



          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => fonksiyon(context),
                settings: RouteSettings(
                  arguments: veri,
                ),
              )
          );
        },

      ),
    );
  }

  void menuTemizle(){
    Menu.clear();
  }

  static void hata (String hata,BuildContext context){
    showDialog(context:context,builder: (context){
      return  AlertDialog(
        title: Text(hata),
        //content: CircularProgressIndicator(),
        content: Icon(Icons.warning_amber_outlined,size: 80,color: Colors.red,),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Tamam")),
        ],
      );
    });
  }

  static void yukleniyor (String mesaj,BuildContext context){
    showDialog(context:context,builder: (context){
      return  AlertDialog(
        title: Text(mesaj),
        content: CircularProgressIndicator(),
        //content: Icon(Icons.auto_fix_high,size: 40,color: Colors.blue,),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Tamam")),
        ],
      );
    });
  }
  static void yuklen (String mesaj,BuildContext context){
    showDialog(context:context,builder: (context){
      return  AlertDialog(
        title: Text(mesaj),
        content: CircularProgressIndicator(),
        //content: Icon(Icons.auto_fix_high,size: 40,color: Colors.blue,),
      );
    });
  }

  static void iyison (String bildir,BuildContext context){
    showDialog(context:context,builder: (context){
      /*yatay olarak haraket ettrip hareket bitince ilgili
      * dialog penceresi sonlanacak*/
      return  AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topRight: Radius.circular(80),bottomLeft: Radius.circular(80) )),
        title: Text(bildir),
        //content: CircularProgressIndicator(),
        content: Icon(Icons.auto_fix_high,size: 80,color: Colors.blue,),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Tamam")),
        ],
      );
    });
  }
}