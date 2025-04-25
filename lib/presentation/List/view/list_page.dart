import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/presentation/List/controller/list_controller.dart';
import 'package:prueba_tecnica/presentation/List/view/detail_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListController(),
      child: Consumer(
        builder: (context, ListController listController, child) {
          print("ListPage : ${listController.listData}");
          final list = listController.listData;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de elementos'),
              centerTitle: true,
              backgroundColor: Colors.blue,
              // leading: IconButton(
              //   icon: const Icon(Icons.arrow_back),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
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
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DetailPage(),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 30,
                              child: Image(image:
                                NetworkImage(list[index]['image'])),
                            ),
                            title: Text('${index + 1}. ${list[index]['name']}'),
                            subtitle: Text('Status: ${list[index]['status']}'),
                          );
                        },
                      ),
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
