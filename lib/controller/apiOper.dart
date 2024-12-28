import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:wallpe2/model/photosModel.dart';


class ApiOperations{
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];

  static Future<List<PhotosModel>>searchWallpapers(String query) async{

    await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30"),
        headers: {"Authorization": "vRxyxj7W5GdiExMjGT0thX5Y7FeenduLUMnxV23YY4UDFCCJQiuWiDxD"}
    ).then((value){

      Map <String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapersList.clear();

      photos.forEach((element){
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));
      });

    });

    return searchWallpapersList;
  }








  static Future<List<PhotosModel>> getTrendingWallpapers() async{


    await http.get(
      Uri.parse("https://api.pexels.com/v1/curated"),
          headers: {"Authorization": "vRxyxj7W5GdiExMjGT0thX5Y7FeenduLUMnxV23YY4UDFCCJQiuWiDxD"}
    ).then((value){

    Map <String,dynamic> jsonData = jsonDecode(value.body);
    List photos = jsonData['photos'];
    photos.forEach((element){
      trendingWallpapers.add(PhotosModel.fromAPI2App(element));
    });

    });

    return trendingWallpapers;
  }
}