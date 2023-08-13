import 'package:flutter/material.dart';

import 'api_services.dart';
import 'dataclass.dart';

class DetailPerson extends StatefulWidget {
  const DetailPerson({super.key});

  @override
  State<DetailPerson> createState() => _DetailPersonState();
}

class _DetailPersonState extends State<DetailPerson> {
  Services serviceApi = Services();

  late Future<List<DataPerson>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceApi.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail data")),
        body: Container(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataPerson> isiData = snapshot.data!;
                return ListView.builder(
                    itemCount: isiData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [Text(isiData[index].nama)],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.hasError}");
              }
              return const CircularProgressIndicator();
            },
            future: listData,
          ),
        ));
  }
}
