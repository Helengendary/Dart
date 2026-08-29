import 'package:flutter/material.dart';
import 'package:flutter_application_1/detalhes_receita_screen.dart';

import 'receita_model.dart';

import 'package:provider/provider.dart';

import 'favoritas_provider.dart';

class FavoritasScreen extends StatelessWidget {
  final List<Receita> receitas;
  const FavoritasScreen({super.key, required this.receitas});

  @override
  Widget build(BuildContext context) {
    final favoritasProvider = context.watch<FavoritasProvider>();
    final receitas = favoritasProvider.idsReceitasFavoritas
        .map((id) => this.receitas.firstWhere((receita) => receita.id == id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Lista de Receitas Favoritas")),

      body: ListView.builder(
        itemCount: receitas.length,

        itemBuilder: (ctx, index) {
          final receita = receitas[index];

          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  receita.imageUrl,
                ), // Descomente se tiver URLs

                child: Text(receita.id.toUpperCase()),
              ),

              title: Text(receita.titulo),

              onTap: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                        DetalhesReceitaScreen(receita: receita),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
