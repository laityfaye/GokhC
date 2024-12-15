import 'package:flutter/material.dart';
import 'package:gokhconnect/widgets/custom_scaffold1.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // Initialisation de l'AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 10), // Durée du défilement
      vsync: this,
    )..repeat(reverse: false); // Répéter l'animation sans retour en arrière

    // Définition de l'animation de défilement horizontal
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Commence hors de l'écran à droite
      end: const Offset(-1.0, 0.0), // Va jusqu'à la gauche hors de l'écran
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold1(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('GOKHCONNECT',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: Colors.white, // Couleur du texte
        ),),
            // Texte défilant avant la première image
            SlideTransition(
              position: _offsetAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Une nouvelle vision du numerique',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Couleur du texte
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacement avant la première image
            // Première image avec bordure arrondie
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/image1.JPG', // Remplace avec le chemin de ton image
                width: 400, // Largeur de l'image
                height: 150, // Hauteur de l'image
                fit: BoxFit.cover, // Pour couvrir l'espace tout en conservant le ratio
              ),
            ),
            const SizedBox(height: 20), // Espacement entre les images
            // Deuxième image avec bordure arrondie
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/image2.JPG', // Remplace avec le chemin de ton image
                width: 400, // Largeur de l'image
                height: 150, // Hauteur de l'image
                fit: BoxFit.cover, // Pour couvrir l'espace tout en conservant le ratio
              ),
            ),
          ],
        ),
      ),
    );
  }
}
