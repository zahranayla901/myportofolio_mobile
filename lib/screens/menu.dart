import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}

const List<ItemHomepage> items = [
  ItemHomepage("Load Project", Icons.folder, Color(0xFFF7CAC9)),
  ItemHomepage("Add Project", Icons.add_circle, Color(0xFF9DC3E8)),
  ItemHomepage("Add Experience", Icons.work, Color(0xFFB5EAD7)),
  ItemHomepage("Logout", Icons.logout, Colors.red),
];

// Gradient lembut: warna dari palet dicampur dengan putih, dengan bagian tengah putih lavender.
const List<Color> backgroundGradient = [
  Color(0xFFC7DEF2), // biru lembut (dari 8FBEE6)
  Color(0xFFCFD8F0), // biru lavender (dari 9FB2E0)
  Color(0xFFDBD6EE), // lavender (dari B7AEDD)
  Color(0xFFF6F3FB), // putih lavender (tengah)
  Color(0xFFE9D4EA), // lavender muda (dari D2A8D6)
  Color(0xFFF4D4E1), // pink muda (dari EAA8C4)
  Color(0xFFF7C4CF), // pink lembut (dari F0899F)
];

const List<double> backgroundStops = [0.0, 0.167, 0.333, 0.5, 0.667, 0.833, 1.0];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF33415C),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: backgroundGradient,
            stops: backgroundStops,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: '2506534163'),
                  InfoCard(title: 'Name', content: 'Zahra Nayla Azfa'),
                  InfoCard(title: 'Class', content: 'PBP E'),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Selamat datang di MyPortfolio Mobile!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0xFF33415C),
                        ),
                      ),
                    ),
                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items
                        .map<Widget>((item) => ItemCard(item) as Widget)
                        .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF67738C),
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}