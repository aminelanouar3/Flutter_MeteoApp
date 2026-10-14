import 'package:flutter/material.dart';
import 'drawer.widget.dart';

class Meteo extends StatelessWidget{
    const Meteo({super.key});
    @override
    Widget build(BuildContext context){
        return Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
                title: const Text('Météo'),
            ),
            body: const Center(
                child: Text(
                    'Page Meteo',style: TextStyle(fontSize: 22),
                ),
            ),
        );
    }
}