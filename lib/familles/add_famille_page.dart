import 'package:flutter/material.dart';
import 'add_personne_page.dart';

class AddFamilyPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddFamily;

  const AddFamilyPage({super.key, required this.onAddFamily});

  @override
  _AddFamilyPageState createState() => _AddFamilyPageState();
}

class _AddFamilyPageState extends State<AddFamilyPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idFamilleController = TextEditingController();
  final TextEditingController _localiteController = TextEditingController();
  final TextEditingController _statutEconomiqueController = TextEditingController();
  final TextEditingController _logoController = TextEditingController();

  List<Map<String, dynamic>> membresFamille = [];
  String chefFamille = '';

  void _addPersonne(Map<String, dynamic> personne) {
    setState(() {
      membresFamille.add(personne);
      if (personne['Statut'] == 'chef de famille') {
        chefFamille = personne['Nom'] + ' ' + personne['Prénom'];
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final newFamily = {
        "id_famille": int.parse(_idFamilleController.text),
        "id_chef_famille": chefFamille,
        "id_personne": membresFamille.map((p) => p['Nom'] + ' ' + p['Prénom']).join(', '),
        "id_Localite": _localiteController.text,
        "Statut_economique": _statutEconomiqueController.text,
        "logo": _logoController.text,
      };
      widget.onAddFamily(newFamily);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une Famille'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ANSD.png'), // Ajoutez votre image de fond ici
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/F.png'), // Image par défaut
                      radius: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _idFamilleController,
                    decoration: const InputDecoration(
                      labelText: 'ID Famille',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un ID de famille';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Membres de la Famille',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          readOnly: true,
                          controller: TextEditingController(text: membresFamille.map((p) => p['Nom'] + ' ' + p['Prénom']).join(', ')),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue, // Couleur de fond bleu
                          borderRadius: BorderRadius.circular(10), // Bordure arrondie
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white), // Icône de couleur blanche
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddPersonnePage(onAddPersonne: _addPersonne),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _localiteController,
                    decoration: const InputDecoration(
                      labelText: 'Localité',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer la localité';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _statutEconomiqueController,
                    decoration: const InputDecoration(
                      labelText: 'Statut Économique',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le statut économique';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _logoController,
                    decoration: const InputDecoration(
                      labelText: 'Logo',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le logo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Ajouter Famille'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
