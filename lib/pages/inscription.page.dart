import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatefulWidget {
    const InscriptionPage({super.key});
    @override
    State<InscriptionPage> createState() => _InscriptionPageState();
}
class _InscriptionPageState extends State<InscriptionPage>{
    TextEditingController txtLogin = TextEditingController();
    TextEditingController txtPassword = TextEditingController();
    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar:AppBar(
                title: const Text('Page Home (Accueil)'),
                backgroundColor : Colors.blue,
            ),
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextFormField(
                                controller: txtLogin,
                                decoration: const InputDecoration(labelText: 'Indentifiant'),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: txtPassword,
                                obscureText: true,
                                decoration: const InputDecoration(labelText: 'Mot de passe'),
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                                onPressed: onInscrire,
                                child: const Text('Inscription',
                                style: TextStyle(fontSize: 22)),
                            ),
                            TextButton(
                                onPressed: () {
                                    Navigator.pushNamed(context,'/authentification');
                                },
                                child: const Text("J'ai déja un compte",style: TextStyle(fontSize: 18)),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
    late SharedPreferences prefs;
    Future<void> onInscrire() async {
        prefs = await SharedPreferences.getInstance();
        prefs.setBool("connecte",true);
        if(txtLogin.text.isNotEmpty && txtPassword.text.isNotEmpty) {
            prefs.setString("login",txtLogin.text);
            prefs.setString("password",txtPassword.text);
            Navigator.pushReplacementNamed(context,'/home');
        }else{
        const snackBar = SnackBar(
            content: Text("Veuillez saisir l'identifiant et le mot de passe."),
            backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    }
}
