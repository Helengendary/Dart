import 'package:flutter/material.dart';
import 'package:flutter_application_1/detalhes_receita_screen.dart';

import 'receita_model.dart'; // Importe o modelo que criamos

import 'package:provider/provider.dart'; // Importe o provider

import 'favoritas_provider.dart'; // Importe nosso novo provider

import 'FavoritasScreen.dart'; // Importe a tela de favoritas

// Dados fictícios para nosso catálogo

final List<Receita> DADOS_RECEITAS = [
  Receita(
    id: 'r1',
    titulo: 'Bolo de Chocolate',
    ingredientes: 'Farinha, ovos, chocolate...',
    modoDePreparo: 'Misture tudo e asse.',
    imageUrl: 'https://tse1.explicit.bing.net/th/id/OIP.9cqIG9z-2NTsJ4O2UAZluAHaI_?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
  ),

  Receita(
    id: 'r2',
    titulo: 'Macarrão à Carbonara',
    ingredientes: 'Massa, ovos, bacon...',
    modoDePreparo: 'Cozinhe a massa e misture.',
    imageUrl: 'https://tse1.mm.bing.net/th/id/OIP.h_DsWx-stQ0gFJhCSxQTbAHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
  ),

  // Adicione mais receitas se quiser
];

void main() {
  runApp(
    // Envolvemos nosso app com o ChangeNotifierProvider

    ChangeNotifierProvider(
      create: (context) => FavoritasProvider(),

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Receitas',

      home: ListaReceitasScreen(),
    );
  }
}

class ListaReceitasScreen extends StatelessWidget {
  const ListaReceitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Receitas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritasScreen(receitas: DADOS_RECEITAS),
                ), // Passamos a lista de receitas
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: DADOS_RECEITAS.length,

        itemBuilder: (ctx, index) {
          final receita = DADOS_RECEITAS[index];

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
              // Ação de navegação
              trailing: Consumer<FavoritasProvider>(
                builder: (ctx, favoritasProvider, child) {
                  final isFav = favoritasProvider.isFavorita(receita.id);

                  return Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,

                    color: Colors.red,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
