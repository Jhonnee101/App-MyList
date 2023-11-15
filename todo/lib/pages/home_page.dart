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
        children: [MercadoPage(), TarefasPage(), FarmaciaPage()],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(31, 34, 43, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: GNav(
            selectedIndex: paginaAtual,
            backgroundColor: Color.fromRGBO(31, 34, 43, 1),
            color: Color.fromRGBO(252, 217, 184, 1),
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromRGBO(224, 145, 69, 1),
            tabShadow: [
              BoxShadow(
                  color: Color.fromRGBO(224, 145, 69, 1).withOpacity(0.2),
                  blurRadius: 2)
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
                icon: Icons.list,
                text: 'Atividades',
              ),
              GButton(
                icon: Icons.medical_services,
                text: 'Farmácia',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
