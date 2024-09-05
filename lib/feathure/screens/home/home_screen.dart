import 'package:assignment_project/config/app_constant/app_constant.dart';
import 'package:assignment_project/config/service/json_service.dart';
import 'package:assignment_project/feathure/screens/home/widget/custom_button.dart';
import 'package:assignment_project/feathure/screens/home/widget/custom_card_widget.dart';
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
      appBar: AppBar(
        title: const Text(
          'Json Data',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Button One",
                  onPressed: () {
                    setState(() {
                      androidVersion = jsonEncode(jsonDataListOne);
                    });
                  },
                ),
                CustomButton(
                  text: "Button Two",
                  onPressed: () {
                    setState(() {
                      androidVersion = jsonEncode(jsonDataListTwo);
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: androidVersion.length,
              itemBuilder: (context, index) {
                return 
                  CustomCardWidget(title: androidVersion[index].title ?? '', subtitle: 'ID: ${androidVersion[index].id.toString() ?? ''}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
