import 'package:flutter/material.dart';
import 'package:market_satis/services/sifre_api.dart';
import 'package:market_satis/views/temelWidget.dart';
import 'package:market_satis/widgets/EvirTextFPassword.dart';
import 'package:market_satis/widgets/RowEvir2Button.dart';

class sifreDegistir extends StatefulWidget {
  @override
  _sifreDegistirState createState() => _sifreDegistirState();
}

class _sifreDegistirState extends temelWidget {

  String mevcutSifre="",almevcutSifre="",alyeniSifre="",alyeniSifre2="";

  //Tanımlar
  @override
  Widget build(BuildContext context) {
    this.veriSet(context);
    this.tc = veri.Tc;
    this.mevcutSifre = veri.Sifre;
    this.set(baslik:"Şifre Değiştir" ,govde: Column(
      children: [
        //Eski
        EvirTextFPassword(labelText: "Mevcut şifre:",onChanged: (a)=>mevcutal(a)),

        //yeni
        EvirTextFPassword(labelText: "Yeni şifre:",onChanged: (a)=>yenial(a)),

        //tekrar
        EvirTextFPassword(labelText: "Yeni şifre Tekrar:",onChanged: (a)=>yenial2(a)),

        //Butonlar
        RowEvir2Button(onPressed1: onPressed1,onPressed2: onPressed2,),

      ],
    ));

    return super.build(context);
  }

  void onPressed1() {
    if(mevcutSifre!=""&&almevcutSifre!=""&&alyeniSifre!=""&&alyeniSifre2!=""){
      if(mevcutSifre.compareTo(almevcutSifre.trim())==0){
        if(alyeniSifre.trim().compareTo(alyeniSifre2.trim())==0){
          sifreApi.patchsifre(veri.id, alyeniSifre.trim()).then((sonuc){
            if(sonuc.statusCode==200&&sonuc.body[0]!=null){
              setState(() {
                veri.Sifre=alyeniSifre2.trim();
              });

              bildir("İşlem başarıyla tamalandı");
            }
            else{
              yukle("Yükleniyor");
            }
          });
        }else{
         cati("Yeni şifreleriniz birbirleriyle eşleşmiyor.");
        }
      }
      else{
        cati("Lütfen eski sifrenizi doğru gidiğinizden emin olunuz.");
      }
    }
  }

  void cati (String a){
    showDialog(context:context,builder: (context){
      return  AlertDialog(
        title: Text(a),
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

  void bildir (String a){
    showDialog(context:context,builder: (context){
      return  AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topRight: Radius.circular(80),bottomLeft: Radius.circular(80) )),
        title: Text(a),
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

  void yukle (String a){
    showDialog(context:context,builder: (context){
      return  AlertDialog(
        title: Text(a),
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

  yenial(String a) {
    setState(() {
      alyeniSifre=a;
    });
  }

  mevcutal(String a) {
    setState(() {
      almevcutSifre=a;
    });
  }

  yenial2(String a) {
    setState(() {
      alyeniSifre2=a;
    });
  }

  void onPressed2() {
    Navigator.pop(context,true);
  }
}
