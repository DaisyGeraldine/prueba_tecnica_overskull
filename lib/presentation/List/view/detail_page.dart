import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/presentation/List/controller/detail_controller.dart';
import 'package:prueba_tecnica/presentation/List/widgets/custom_container.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailController(
        id,
      ),
      child: Consumer(
        builder: (context, DetailController detailController, child) {
          dynamic data = detailController.data;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Vista Detalle',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: detailController.isLoading
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${data['name']}',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.purpleAccent),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(data['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomContainer(
                          text: 'Fecha: ${data['created']}',
                        ),
                        const SizedBox(height: 20),
                        CustomContainer(
                          text: 'Estado: ${data['status']}',
                        ),
                        const SizedBox(height: 10),
                        CustomContainer(
                          text: 'Especie: ${data['species']}',
                        ),
                        const SizedBox(height: 10),
                        CustomContainer(
                          text: 'Genero: ${data['gender']}',
                        ),
                        const SizedBox(height: 10),
                        CustomContainer(
                          text: 'Origen: ${data['origin']['name']}',
                        ),
                        const SizedBox(height: 10),
                        CustomContainer(
                          text: 'Ubicación: ${data['location']['name']}',
                        ),
                        const SizedBox(height: 10),
                        Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        const SizedBox(height: 10),
                        CustomContainer(
                          text: 'Episodio: ${data['episode'].length}',
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
