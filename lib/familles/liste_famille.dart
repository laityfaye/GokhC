import 'package:flutter/material.dart';
import 'family_details_page.dart';

class ListeFamille extends StatefulWidget {
  final List<Map<String, dynamic>> families;

  const ListeFamille({super.key, required this.families});

  @override
  State<ListeFamille> createState() => _ListeFamilleState();
}

class _ListeFamilleState extends State<ListeFamille> {
  List<Map<String, dynamic>> searchResults = [];
  TextEditingController searchController = TextEditingController();

  void searchFamily() {
    setState(() {
      searchResults = widget.families.where((event) {
        return event['id_famille'].toString() == searchController.text;
      }).toList();
    });
  }

  void _addPersonne(Map<String, dynamic> personne) {
    // Ajoutez la logique pour ajouter la personne à la famille ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Liste des Familles'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Rechercher par ID de Famille',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: searchFamily,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                  child: const Text(
                    'Rechercher',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.isNotEmpty ? searchResults.length : widget.families.length,
                itemBuilder: (context, index) {
                  final event = searchResults.isNotEmpty ? searchResults[index] : widget.families[index];
                  final nomlocalite = event['id_Localite'];
                  final chefFamille = event['id_chef_famille'];
                  final statutEconomique = event['Statut_economique'];
                  final membresFamille = event['id_personne'];
                  final logo = event['logo'];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/$logo.png'),
                      ),
                      title: Text('$chefFamille'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Localité: $nomlocalite'),
                          Text('Statut Économique: $statutEconomique'),
                          Text('Membres de la famille: $membresFamille'),
                        ],
                      ),
                      trailing: const Icon(Icons.more_vert),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FamilyDetailsPage(family: event, onAddPersonne: _addPersonne),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
