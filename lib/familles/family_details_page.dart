import 'package:flutter/material.dart';
import 'add_personne_page.dart';

class FamilyDetailsPage extends StatefulWidget {
  final Map<String, dynamic> family;
  final Function(Map<String, dynamic>) onAddPersonne;

  const FamilyDetailsPage({Key? key, required this.family, required this.onAddPersonne}) : super(key: key);

  @override
  _FamilyDetailsPageState createState() => _FamilyDetailsPageState();
}

class _FamilyDetailsPageState extends State<FamilyDetailsPage> {
  late List<Map<String, dynamic>> membresFamille;

  @override
  void initState() {
    super.initState();
    // Vérifiez si la clé 'membres' existe dans la famille et si oui, initialisez membresFamille, sinon initialisez avec une liste vide
    if (widget.family.containsKey('membres')) {
      membresFamille = List<Map<String, dynamic>>.from(widget.family['membres']);
    } else {
      membresFamille = [];
    }
  }

  void _addPersonne(Map<String, dynamic> personne) {
    setState(() {
      membresFamille.add(personne);
    });
  }

  void _removePersonne(int index) {
    setState(() {
      membresFamille.removeAt(index);
    });
  }

  void _showMembresList() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Liste des Membres'),
          content: SingleChildScrollView(
            child: ListBody(
              children: membresFamille.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> membre = entry.value;
                return ListTile(
                  title: Text('${membre['Nom']} ${membre['Prénom']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _confirmRemovePersonne(index),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  void _confirmRemovePersonne(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmer la suppression'),
          content: const Text('Voulez-vous vraiment supprimer ce membre ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _removePersonne(index);
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Ferme le dialogue des membres
                // Rafraîchir l'état pour refléter les changements
                setState(() {});
              },
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Famille ${widget.family['id_famille']}'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/${widget.family['logo']}.png'),
                        radius: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Chef de Famille: ${widget.family['id_chef_famille']}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Localité: ${widget.family['id_Localite']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Statut Économique: ${widget.family['Statut_economique']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Membres de la Famille:',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ...membresFamille.map((personne) {
                      return ListTile(
                        title: Text('${personne['Nom']} ${personne['Prénom']}'),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _showMembresList,
                  icon: const Icon(Icons.remove_circle),
                  label: const Text('Ajouter Décès'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPersonnePage(onAddPersonne: _addPersonne),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_circle),
                  label: const Text('Ajouter Naissance'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
