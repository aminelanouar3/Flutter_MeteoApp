import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer.widget.dart';
import '../config/global.params.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("Page  Accueil"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Wrap(
          spacing: 16.0,
          runSpacing:16.0,
          children : [
            ...(Globalparams.acceuil as List).map((item) {
              return InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: item['image'],
                ),
                onTap: () {
                  Navigator.pushNamed(context,"${item['route']}");
                },
              );
            }).toList(),
          ],
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