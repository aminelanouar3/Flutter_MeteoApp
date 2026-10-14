import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyDrawer extends StatelessWidget{
    MyDrawer({super.key});
    late SharedPreferences prefs;
    @override
    Widget build(BuildContext context){
        return Drawer(
            child: ListView(
                children:  [
                    const DrawerHeader(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.white,Colors.blueAccent]
                            )
                        ),
                        child: Center(
                            child:CircleAvatar(
                                backgroundImage: AssetImage('images/profile.jpg'),
                                radius: 60,
                            ),
                        )
                    ),
                    ListTile(
                        title: const Text('Accueil',style: TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.home, color: Colors.blue),
                        trailing:const Icon(Icons.arrow_right, color: Colors.blue),
                        onTap: () {
                            Navigator.of (context).pop();
                            Navigator.pushNamed(context,'/home');
                        },
                    ),
                    ListTile(
                        title: const Text('Météo',style: TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.sunny_snowing, color:Colors.blue),
                        trailing: const Icon(Icons.arrow_right,color: Colors.blue),
                        onTap: () {
                            Navigator.of (context).pop();
                            Navigator.pushNamed(context,'/meteo');
                        },
                    ),
                    ListTile(
                        title:const Text('Maps',style: TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.location_on,color: Colors.blue),
                        trailing: const Icon(Icons.arrow_right, color: Colors.blue),
                        onTap: () {
                            Navigator.of (context).pop();
                            Navigator.pushNamed(context,'/maps');
                        },
                    ),
                    ListTile(
                        title:const Text('Contacts',style: TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.phone,color:Colors.blue),
                        trailing: const Icon(Icons.arrow_right,color:Colors.blue),
                        onTap: () {
                            Navigator.of (context).pop();
                            Navigator.pushNamed(context,'/contacts');
                        },
                    ),
                    ListTile(
                        title:const Text('Messenger',style:TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.messenger_outline,color: Colors.blue),
                        trailing: const Icon(Icons.arrow_right,color: Colors.blue),
                        onTap: () {
                            Navigator.of (context).pop();
                            Navigator.pushNamed(context,'/messenger');
                        },
                    ),
                    ListTile(
                        title: const Text('ChatBot',style:TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.android,color: Colors.blue),
                        trailing: const Icon(Icons.arrow_right,color:Colors.blue),
                        onTap: () {
                            Navigator.of (context).pop();
                            Navigator.pushNamed(context,'/chatbot');
                        },
                    ),
                    ListTile(
                        title: const Text('paramètres',style:TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.settings,color: Colors.blue),
                        trailing: const Icon(Icons.arrow_right,color:Colors.blue),
                        onTap: () {
                            Navigator.of (context).pop();
                            Navigator.pushNamed(context,'/home');
                        },
                    ),
                    ListTile(
                        title: const Text('Déconnexion',style: TextStyle(fontSize: 22)),
                        leading: const Icon(Icons.logout,color: Colors.blue ),
                        trailing: const Icon(Icons.arrow_right,color: Colors.blue), 
                        onTap: () async {
                            prefs = await SharedPreferences.getInstance();
                            prefs.setBool("connect",false);
                            Navigator.pushNamedAndRemoveUntil(context,'/authentification',(route) => false);
                        },
                    ),
                ],  
            ),
        );
    }
}