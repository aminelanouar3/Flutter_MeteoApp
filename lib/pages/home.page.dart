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
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              _deconnexion(context);
            },
            child: const Text(
              'Déconnexion',
              style: TextStyle(fontSize: 22),
            ),
          ),
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