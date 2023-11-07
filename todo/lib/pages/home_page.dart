import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todo/pages/farmacia/farmacia.dart';
import 'package:todo/pages/mercado/mercado.dart';
import 'package:todo/pages/tarefas/tarefas.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [MercadoPage(), FarmaciaPage(), TarefasPage()],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade700,
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            onTabChange: (index) {
              if (index == 0) {
                pc.animateToPage(index,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              }
              if (index == 1) {
                pc.animateToPage(index,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              }
              if (index == 2) {
                pc.animateToPage(index,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              }
              if (index == 3) {}
            },
            tabs: const [
              GButton(
                icon: Icons.shopping_cart,
                text: 'Mercado',
              ),
              GButton(
                icon: Icons.medical_services,
                text: 'Farmácia',
              ),
              GButton(
                icon: Icons.list,
                text: 'Atividades',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
