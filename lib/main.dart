import 'package:flutter/material.dart';
import 'package:get_api/dataclass.dart';
import 'package:get_api/detail.dart';

import 'api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Services serviceApi = Services();

  late Future<List<DataPerson>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceApi.getAllData();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Get Data")),
        body: Container(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataPerson> isiData = snapshot.data!;
                return ListView.builder(
                  itemCount: isiData.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 20,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPerson()));
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        title: Text(isiData[index].nama),
                        subtitle: Text(
                          isiData[index].quote,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(isiData[index].avatar),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return const CircularProgressIndicator();
            },
            future: listData,
          ),
        ),
      ),
    );
  }
}
