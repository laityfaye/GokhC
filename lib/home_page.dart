import 'package:flutter/material.dart';
import 'package:gokhconnect/familles/home_page_famille.dart';

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
      home: Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(
            "GokhConnect",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ANSD.png'),
              const Text(
                'Bienvenue sur GokhConnect',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                'Connexion des Communautés',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const Text(
                'Vous pouvez commencer a ajouter une famille en cliquant sur le bouton Famille',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              //bouton Famille
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.blue,
                ),
                onPressed:() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomePageFamille()
                    ),
                  );
                }, 
                label:const Text(
                  'Ajout de famille',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
                icon: const Icon(Icons.add),
              )
              // Liste Boutons
              // Builder(
              //   builder: (BuildContext context) {
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         ElevatedButton.icon(
              //           style: ElevatedButton.styleFrom(
              //             padding: const EdgeInsets.all(15),
              //             backgroundColor: Colors.blue,
              //           ),
              //           onPressed: () {
              //             print("Bouton Localité cliqué");
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(builder: (context) => const HomePageLocalite()),
              //             );
              //           },
              //           label: const Text(
              //             'Localité',
              //             style: TextStyle(fontSize: 16, color: Colors.white),
              //           ),
              //           icon: const Icon(Icons.add),
              //         ),
              //         const SizedBox(width: 10),
              //         ElevatedButton.icon(
              //           style: ElevatedButton.styleFrom( 
              //             padding: const EdgeInsets.all(15), 
              //             backgroundColor: Colors.orange, ),
              //           onPressed: () {
              //             // Action pour le deuxième bouton
              //           },
              //           label: const Text(
              //             'Famille',
              //             style: TextStyle(fontSize: 16, color: Colors.white),
              //           ),
              //           // icon: const Icon(Icons.edit),
              //           icon: const Icon(Icons.add),
              //         ),
              //         const SizedBox(width: 10),
              //         ElevatedButton.icon(
              //           style: ElevatedButton.styleFrom( 
              //             padding: const EdgeInsets.all(15), 
              //             backgroundColor: Colors.green, 
              //           ),
              //           onPressed: () {
              //             // Action pour le troisième bouton
              //           },
              //           label: const Text(
              //             'Personne',
              //             style: TextStyle(fontSize: 16, color: Colors.white),
              //           ),
              //           // icon: const Icon(Icons.check),
              //           icon: const Icon(Icons.add),
              //         ),

              //         const SizedBox(width: 10),
              //         ElevatedButton.icon(
              //           style: ElevatedButton.styleFrom( 
              //             padding: const EdgeInsets.all(15), 
              //             backgroundColor: Colors.green, 
              //           ),
              //           onPressed: () {
              //             // Action pour le troisième bouton
              //           },
              //           label: const Text(
              //             'Evenement',
              //             style: TextStyle(fontSize: 16, color: Colors.white),
              //           ),
              //           // icon: const Icon(Icons.check),
              //           icon: const Icon(Icons.add),
              //         ),
              //       ],
              //     );
              //   },
              // ),
            
            ],
          ),
        ),
      ),
    );
  }
}