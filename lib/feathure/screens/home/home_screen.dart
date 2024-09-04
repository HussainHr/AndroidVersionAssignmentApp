import 'package:assignment_project/config/app_constant/app_constant.dart';
import 'package:assignment_project/config/service/json_service.dart';
import 'package:flutter/material.dart';

import '../../../config/model/android_version_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AndroidVersion> androidVersion = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Android Version Data List'),centerTitle: true,),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    androidVersion = jsonEncode(jsonDataListOne);
                  });
                },
                child: const Text('Button One'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    androidVersion = jsonEncode(jsonDataListTwo);
                  });
                },
                child: const Text('Button Two'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: androidVersion.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(androidVersion[index].title ?? ''),
                subtitle:
                Text("ID: ${androidVersion[index].id.toString() ?? ''}"),
              );
            },
          ),
        ),
      ],),
    );
  }
}
