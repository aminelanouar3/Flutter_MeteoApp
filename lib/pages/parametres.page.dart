import 'package:flutter/material.dart';
import 'drawer.widget.dart';

class Parametres extends StatelessWidget{
    const Parametres({super.key});
    @override
    Widget build(BuildContext context){
        return Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
                title: const Text('Parametres'),
            ),
            body: const Center(
                child:Text('Page Meteo',style:TextStyle(fontSize: 22)),
            ),
        );
    }
}