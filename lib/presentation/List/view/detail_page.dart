import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/presentation/List/controller/detail_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailController(),
      child: Consumer(
        builder: (context, DetailController detailController, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Vista Detalle'),
              centerTitle: true,
              backgroundColor: Colors.blue,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Rick and Morty',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Text("Hola"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
