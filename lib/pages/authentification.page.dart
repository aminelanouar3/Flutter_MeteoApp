import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthentificationPage extends StatefulWidget {
    const AuthentificationPage({super.key});
    @override
    State<AuthentificationPage>createState() => _AuthentificationPageState();
}
class _AuthentificationPageState extends State<AuthentificationPage> {
    TextEditingController txtLogin = TextEditingController();
    TextEditingController txtPassword= TextEditingController();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                  title: const Text('Page Authentification'),
                  backgroundColor: Colors.orange,
                ),
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextFormField(
                                controller:txtLogin,
                                decoration: const InputDecoration(labelText: 'Identifiant'),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: txtPassword,
                                obscureText: true,
                                decoration: const InputDecoration(labelText:'Mot de passe'),
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                                onPressed:onAuthentifier,
                                child: const Text('Connexion',
                                style: TextStyle(fontSize:22)),
                            ),
                            TextButton(
                                onPressed: (){
                                    Navigator.pushNamed(context,'/inscription');
                                },
                                child: const Text("Nouvel Utilisateur", style: TextStyle(fontSize:18)),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
    late SharedPreferences prefs;
    Future<void> onAuthentifier() async {
        prefs = await SharedPreferences.getInstance();
        if(txtLogin.text.isNotEmpty && txtPassword.text.isNotEmpty){
            String? savedLogin = prefs.getString("login");
            String? savedPassword = prefs.getString("password");
            if(savedLogin != null &&
                savedPassword != null &&
                txtLogin.text == savedLogin &&
                txtPassword.text == savedPassword){
                    prefs.setBool("connecte",true);
                    Navigator.pushReplacementNamed(context,'/home');
            }
            else{
                const snackBar = SnackBar(
                    content: Text("aucun utilisateur existe avec cette identifiant et mot de passe"),
                    backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
        }else{
            const snackBar = SnackBar(
                content: Text("Veuillez saisir l'identifiant et le mot de passe."),
                backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
    }
}