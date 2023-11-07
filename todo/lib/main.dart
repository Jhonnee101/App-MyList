import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/home_page.dart';

void main() async {
  // Inicia o hive
  await Hive.initFlutter();

  // Abre as caixas do Hive (Mercado, Farmacia, Atividades)
  var mercadoBox = await Hive.openBox("Mercado");
  var farmaciaBox = await Hive.openBox("Farmacia");
  var atividadesBox = await Hive.openBox("Atividades");

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
