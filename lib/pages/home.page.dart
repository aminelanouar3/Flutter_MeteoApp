import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer.widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Page Home (Accueil)'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Wrap(
          spacing: 16.0,
          runSpacing:16.0,
          children : [
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/meteo.png',),
              ),
              onTap: () {
                Navigator.pushNamed(context,'/meteo');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/maps.png',),
              ),
              onTap: () {
                Navigator.pushNamed(context,'/maps');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/contacts.png',),
              ),
              onTap: () {
                Navigator.pushNamed(context,'/contacts');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/messenger.png',),
              ),
              onTap: () {
                Navigator.pushNamed(context,'/messenger');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/chatbot.png',),
              ),
              onTap: () {
                Navigator.pushNamed(context,'/chatbot');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/parametres.png',),
              ),
              onTap: () {
                Navigator.pushNamed(context,'/parametres');
              },
            ),
          ]
        ),
      ),
    );
  }
}

Future<void> _deconnexion(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool('connecte', false);

  if (!context.mounted) return;

  Navigator.pushNamedAndRemoveUntil(
    context,
    '/authentification',
    (route) => false,
  );
}