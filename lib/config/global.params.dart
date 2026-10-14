import 'package:flutter/material.dart';

class Globalparams{
    static List<Map<String,dynamic>> menus = [
        {"title":"Acceuil","icon":Icon(Icons.home,color: Colors.blue),"route":"/home"},
        {"title":"Météo","icon":Icon(Icons.sunny_snowing,color: Colors.blue),"route":"/meteo"},
        {"title":"Maps","icon":Icon(Icons.location_on,color: Colors.blue),"route":"/maps"},
        {"title":"Contacts","icon":Icon(Icons.phone,color: Colors.blue),"route":"/contacts"},
        {"title":"Messenger","icon":Icon(Icons.messenger,color: Colors.blue),"route":"/messenger"},
        {"title":"ChatBot","icon":Icon(Icons.android,color: Colors.blue),"route":"/chatbot"},
        {"title":"Paramètres","icon":Icon(Icons.settings,color: Colors.blue),"route":"/parametres"},
        {"title":"Déconnexion","icon":Icon(Icons.logout,color: Colors.blue),"route":"/Authentification"},
    ];
}