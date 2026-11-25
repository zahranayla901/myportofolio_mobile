import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

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
  Color(0xFFC7DEF2),
  Color(0xFFCFD8F0),
  Color(0xFFDBD6EE),
  Color(0xFFF6F3FB),
  Color(0xFFE9D4EA),
  Color(0xFFF4D4E1),
  Color(0xFFF7C4CF),
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
        child: SingleChildScrollView(
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
              const Text(
                'Selamat datang di MyPortfolio Mobile!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Color(0xFF33415C),
                ),
              ),
              const SizedBox(height: 16.0),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(4),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((item) => ItemCard(item)).toList(),
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

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  Future<void> _onTap(BuildContext context) async {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('Kamu telah menekan tombol ${item.name}!')),
      );

    if (item.name == 'Load Project') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProjectListScreen()),
      );
    } else if (item.name == 'Add Project') {
      await _openGuarded(context, const ProjectFormPage());
    } else if (item.name == 'Add Experience') {
      await _openGuarded(context, const ExperienceFormPage());
    } else if (item.name == 'Logout') {
      await context.read<AuthState>().logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _onTap(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _openGuarded(BuildContext context, Widget page) async {
  // Simpan navigator sebelum await, lalu pakai untuk membuka halaman setelah login.
  final navigator = Navigator.of(context);
  final loggedIn = await ensureLoggedIn(context);
  if (!loggedIn) return;

  navigator.push(
    MaterialPageRoute(builder: (_) => page),
  );
}