import 'package:flutter/material.dart';
import 'package:gokhconnect/familles/home_page_famille.dart';
import 'package:gokhconnect/screens/home_page1.dart';
 // Ajoute ton fichier de page Localité ici
import 'package:gokhconnect/widgets/custom_scaffold1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CustomScaffold1(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(
            "GokhConnect",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          leading: TextButton(
            onPressed: () {
              // Logique de déconnexion
              Navigator.pop(context); // Retour à l'écran précédent
            },
            child: const Text(
              "LogOut",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          elevation: 0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ajouter les deux boutons avant le texte de bienvenue
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      // Navigation vers la page Localité
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage1()),
                      );
                    },
                    label: const Text(
                      'Le Senegal en Bref',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    icon: const Icon(Icons.graphic_eq_sharp),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.white70,
                    ),
                    onPressed: () {
                      // Navigation vers la page Famille
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePageFamille()),
                      );
                    },
                    label: const Text(
                      'Famille',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    icon: const Icon(Icons.family_restroom),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              // Texte de bienvenue
              const Text(
                'GOKHCONNECT',
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                'Connexion des Communautés',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Vous pouvez commencer à ajouter une famille en cliquant sur le bouton Famille',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.blue,
                ),
                onPressed:() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomePageFamille(),
                    ),
                  );
                },
                label: const Text(
                  'Ajout de famille',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
