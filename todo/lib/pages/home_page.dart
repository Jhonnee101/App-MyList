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

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [MercadoPage(), FarmaciaPage(), TarefasPage()],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          child: GNav(
            selectedIndex: paginaAtual,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: const Color.fromARGB(255, 255, 255, 255),
            tabBackgroundColor: Colors.blue.withOpacity(0.6),
            tabShadow: [
              BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 2)
            ],
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            onTabChange: (index) {
              if (index == 0) {
                pc.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              }
              if (index == 1) {
                pc.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              }
              if (index == 2) {
                pc.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              }
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
