import 'package:flutter/material.dart';

void main() => runApp(const AgencementApp());

const charcoal = Color(0xFF20252B);
const orange = Color(0xFFF28C28);
const canvas = Color(0xFFF4F5F7);

class AgencementApp extends StatelessWidget {
  const AgencementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Agencement',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        colorScheme: ColorScheme.fromSeed(seedColor: orange, primary: charcoal),
        appBarTheme: const AppBarTheme(
          backgroundColor: charcoal,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class DemoProject {
  final String name;
  final String client;
  final int done;
  final int total;
  final String due;
  const DemoProject(this.name, this.client, this.done, this.total, this.due);
  double get progress => total == 0 ? 0 : done / total;
}

const demoProjects = [
  DemoProject('Aménagement showroom', 'Client Démo A', 18, 30, '15/11/2026'),
  DemoProject('Mobilier accueil', 'Client Démo B', 8, 20, '22/11/2026'),
  DemoProject('Rangement bureaux', 'Client Démo C', 42, 50, '28/11/2026'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;
  final List<int> produced = [18, 8, 42];

  @override
  Widget build(BuildContext context) {
    final pages = [
      dashboard(),
      projectsPage(),
      productionPage(),
      const SimplePage(title: 'Messages', icon: Icons.chat_bubble_outline,
          subtitle: 'Les conversations internes seront disponibles dans la prochaine version.'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('GESTION AGENCEMENT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1)),
          Text('Version de démonstration', style: TextStyle(fontSize: 11, color: Colors.white70)),
        ]),
        actions: [IconButton(onPressed: () => showAboutDialog(context: context, applicationName: 'Gestion Agencement', applicationVersion: '0.1.0 - Démo'), icon: const Icon(Icons.info_outline))],
      ),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.folder_outlined), selectedIcon: Icon(Icons.folder), label: 'Projets'),
          NavigationDestination(icon: Icon(Icons.precision_manufacturing_outlined), selectedIcon: Icon(Icons.precision_manufacturing), label: 'Production'),
          NavigationDestination(icon: Icon(Icons.chat_outlined), selectedIcon: Icon(Icons.chat), label: 'Messages'),
        ],
      ),
    );
  }

  Widget dashboard() {
    final total = produced.fold<int>(0, (a, b) => a + b);
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: charcoal, borderRadius: BorderRadius.circular(18)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('BONJOUR 👋', style: TextStyle(color: orange, fontWeight: FontWeight.bold, letterSpacing: 1)),
          SizedBox(height: 8),
          Text('Suivez vos projets\nd’agencement.', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Une vue simple de l’activité de production.', style: TextStyle(color: Colors.white70)),
        ]),
      ),
      const SizedBox(height: 16),
      Row(children: [
        Expanded(child: metric('Projets actifs', '3', Icons.work_outline)),
        const SizedBox(width: 10),
        Expanded(child: metric('Unités produites', '$total', Icons.factory_outlined)),
      ]),
      const SizedBox(height: 20),
      sectionTitle('Projets à suivre', 'Voir tout', () => setState(() => tab = 1)),
      ...List.generate(demoProjects.length, (i) => projectCard(i)),
      const SizedBox(height: 12),
      const Text('Données fictives — démonstration uniquement', style: TextStyle(color: Colors.black54, fontSize: 11), textAlign: TextAlign.center),
    ]);
  }

  Widget projectsPage() => ListView(padding: const EdgeInsets.all(16), children: [
    const Text('Tous les projets', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    const SizedBox(height: 4),
    const Text('Exemples fictifs pour la présentation'),
    const SizedBox(height: 12),
    ...List.generate(demoProjects.length, (i) => projectCard(i)),
  ]);

  Widget productionPage() => ListView(padding: const EdgeInsets.all(16), children: [
    const Text('Suivi de production', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    const Text('Enregistrez une quantité de démonstration.'),
    const SizedBox(height: 16),
    ...List.generate(demoProjects.length, (i) => Card(child: ListTile(
      leading: const CircleAvatar(backgroundColor: Color(0xFFFFE8D0), child: Icon(Icons.precision_manufacturing, color: charcoal)),
      title: Text(demoProjects[i].name),
      subtitle: Text('${produced[i]} / ${demoProjects[i].total} unités'),
      trailing: IconButton(icon: const Icon(Icons.add_circle, color: orange, size: 30), onPressed: () => addProduction(i)),
    ))),
    const SizedBox(height: 12),
    const Text('Les quantités sont enregistrées uniquement dans cette démonstration locale.', style: TextStyle(color: Colors.black54, fontSize: 12)),
  ]);

  Widget projectCard(int i) {
    final p = demoProjects[i];
    final value = produced[i] / p.total;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFFFE8D0), borderRadius: BorderRadius.circular(20)), child: const Text('En cours', style: TextStyle(fontSize: 11, color: charcoal))),
        ]),
        const SizedBox(height: 5),
        Text('Client : ${p.client}', style: const TextStyle(color: Colors.black54, fontSize: 12)),
        const SizedBox(height: 12),
        LinearProgressIndicator(value: value.clamp(0, 1).toDouble(), minHeight: 7, borderRadius: BorderRadius.circular(8), color: orange, backgroundColor: const Color(0xFFE7E9EC)),
        const SizedBox(height: 7),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('${(value * 100).round()} % réalisé', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
          Text('Livraison : ${p.due}', style: const TextStyle(color: Colors.black54, fontSize: 11)),
        ]),
      ])),
    );
  }

  Widget metric(String label, String value, IconData icon) => Card(child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(icon, color: orange), const SizedBox(height: 10),
    Text(value, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: charcoal)),
    Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12)),
  ])));

  Widget sectionTitle(String title, String action, VoidCallback onTap) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    TextButton(onPressed: onTap, child: Text(action)),
  ]);

  Future<void> addProduction(int index) async {
    final controller = TextEditingController(text: '1');
    final amount = await showDialog<int>(context: context, builder: (context) => AlertDialog(
      title: const Text('Ajouter une production'),
      content: TextField(controller: controller, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Quantité produite', suffixText: 'unités')),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
        FilledButton(onPressed: () => Navigator.pop(context, int.tryParse(controller.text)), child: const Text('Enregistrer')),
      ],
    ));
    if (amount != null && amount > 0) setState(() => produced[index] += amount);
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;
  const SimplePage({super.key, required this.title, required this.icon, required this.subtitle});
  @override
  Widget build(BuildContext context) => Center(child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisSize: MainAxisSize.min, children: [
    Icon(icon, size: 56, color: orange), const SizedBox(height: 16),
    Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    const SizedBox(height: 8), Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
  ])));
}
