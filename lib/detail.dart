import 'package:flutter/material.dart';
import 'package:get_api/dataclass.dart';

class DetailPerson extends StatelessWidget {
  final DataPerson dataPerson;
  const DetailPerson({super.key, required this.dataPerson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: Colors.blue[100],
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(dataPerson.avatar),
                  ),
                  Text(
                    dataPerson.nama,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dataPerson.quote,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
