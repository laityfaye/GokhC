import 'package:flutter/material.dart';
import 'package:gokhconnect/familles/add_famille_page.dart';
import 'package:gokhconnect/familles/liste_famille.dart';

class HomePageFamille extends StatefulWidget {
  const HomePageFamille({super.key});

  @override
  State<HomePageFamille> createState() => _HomePageFamilleState();
}

class _HomePageFamilleState extends State<HomePageFamille> {
  int _currentPage = 0;
  List<Map<String, dynamic>> families = [
    {
      "id_famille": 1,
      "id_chef_famille": "Laity Faye",
      "id_personne": "Modou Faye, Amy Faye, Selbe Senghor",
      "id_Localite": "Djilor",
      "Statut_economique": "Moyen",
      "logo": "f"
    },
    {
      "id_famille": 2,
      "id_chef_famille": "Mamadou Cissokho",
      "id_personne": "Fama Cissokho , Yoro Cissokho, Dieynaba Cissokho",
      "id_Localite": "Liperté",
      "Statut_economique": "Moyen",
      "logo": "f"
    },
    {
      "id_famille": 3,
      "id_chef_famille": "Sophie Fall",
      "id_personne": "Assane Cisse Diallo, Amy Diallo",
      "id_Localite": "Djilor",
      "Statut_economique": "Moyen",
      "logo": "F"
    }
  ];

  void setCurrentPage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void addFamily(Map<String, dynamic> newFamily) {
    setState(() {
      families.add(newFamily);
      _currentPage = 0;  // Redirige vers la page 'ListeFamille'
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Définit le thème principal en bleu clair
        scaffoldBackgroundColor: Colors.white, // Couleur de fond par défaut
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: [
          ListeFamille(families: families),
          AddFamilyPage(onAddFamily: addFamily),
        ][_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (index) => setCurrentPage(index),
          backgroundColor: const Color.fromARGB(255, 222, 224, 224),
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Liste',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ajout',
            ),
          ],
        ),
      ),
    );
  }
}
