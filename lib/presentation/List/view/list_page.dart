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
              title: const Text(
                'Lista de elementos',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
            ),
            body: listController.isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Rick and Morty',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                id: list[index]['id'],
                                              ),
                                            ),
                                          );
                                        },
                                        leading: CircleAvatar(
                                          radius: 30,
                                          child: Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  list[index]['image'])),
                                        ),
                                        trailing: Text(
                                          list[index]['species'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.purpleAccent,
                                          ),
                                        ),
                                        title: Text(
                                          '${index + 1}. ${list[index]['name']}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        subtitle: Text(
                                            'Status: ${list[index]['status']}'),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
