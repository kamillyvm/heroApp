import 'package:flutter/material.dart';

import 'agents_page.dart';
import 'daily_contract_page.dart';
import 'squad_page.dart';
import 'mission_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color background = Color(0xFF080808);
  static const Color surface = Color(0xFF151515);
  static const Color pink = Color(0xFFFF0054);
  static const Color lime = Color(0xFFC8FF00);
  static const Color lilac = Color(0xFFC45CFF);
  static const Color secondaryText = Color(0xFF9E9E9E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                SizedBox(height: 24),
                _HeroHeader(),
                SizedBox(height: 32),
                _SectionLabel(label: 'CENTRAL DE OPERAÇÕES'),
                SizedBox(height: 16),
                _NavigationGrid(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: background,
      elevation: 0,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(
          color: Color(0xFF262626),
          width: 1,
        ),
      ),
      title: const Text(
        'COMANDO',
        style: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w800,
          letterSpacing: 3,
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 22,
      ),
      decoration: BoxDecoration(
        color: HomePage.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF292929),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 5,
            decoration: BoxDecoration(
              color: HomePage.pink,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'CENTRAL DE HERÓIS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
              height: 1,
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(
                Icons.bolt_rounded,
                color: HomePage.lime,
                size: 19,
              ),
              SizedBox(width: 7),
              Text(
                'Recrutamento e Combate',
                style: TextStyle(
                  color: HomePage.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.7,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 3,
          decoration: BoxDecoration(
            color: HomePage.lilac,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 9),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Divider(
            color: Color(0xFF292929),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class _NavigationGrid extends StatelessWidget {
  const _NavigationGrid();

  static const List<_MenuItemData> _items = [
    _MenuItemData(
      icon: Icons.group_rounded,
      title: 'AGENTES',
      description: 'Consulte o catálogo\nde heróis',
      accentColor: HomePage.pink,
      destination: AgentsPage(),
    ),
    _MenuItemData(
      icon: Icons.today_rounded,
      title: 'CONTRATO\nDIÁRIO',
      description: 'Recrute um agente\npor dia',
      accentColor: HomePage.lime,
      destination: DailyContractPage(),
    ),
    _MenuItemData(
      icon: Icons.shield_rounded,
      title: 'MEU\nESQUADRÃO',
      description: 'Veja seus agentes\nrecrutados',
      accentColor: HomePage.lilac,
      destination: SquadPage(),
    ),
    _MenuItemData(
      icon: Icons.flash_on_rounded,
      title: 'MISSÕES',
      description: 'Inicie uma\noperação',
      accentColor: HomePage.pink,
      destination: MissionPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return _NavCard(data: _items[index]);
      },
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String title;
  final String description;
  final Color accentColor;
  final Widget destination;

  const _MenuItemData({
    required this.icon,
    required this.title,
    required this.description,
    required this.accentColor,
    required this.destination,
  });
}

class _NavCard extends StatelessWidget {
  final _MenuItemData data;

  const _NavCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HomePage.surface,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => data.destination,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFF292929),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: data.accentColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  data.icon,
                  color: Colors.black,
                  size: 27,
                ),
              ),
              const Spacer(),
              Text(
                data.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                data.description,
                style: const TextStyle(
                  color: HomePage.secondaryText,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 13),
              Container(
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                  color: data.accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}