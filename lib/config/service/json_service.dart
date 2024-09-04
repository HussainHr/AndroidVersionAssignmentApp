import 'dart:convert';

import '../model/android_version_model.dart';

List<AndroidVersion> jsonEncode(String jsonStringList){
  final parsedData = jsonDecode(jsonStringList);
  List<AndroidVersion> androidVersion = [];
  
  for(var item in parsedData){
    if(item is Map){
      item.values.forEach((element) { 
        androidVersion.add(AndroidVersion(id: element['id'], title: element['title']));
      });
    }
    else if(item is List){
      item.forEach((element) { 
        androidVersion.add(AndroidVersion(id: element['id'],title: element['element']));
      });
    }
  }
  return androidVersion;
}