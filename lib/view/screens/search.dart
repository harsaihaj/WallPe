import 'package:flutter/material.dart';
import 'package:wallpe2/controller/apiOper.dart';
import 'package:wallpe2/model/photosModel.dart';
import 'package:wallpe2/view/screens/fullScreen.dart';
import 'package:wallpe2/view/widgets/CustomAppBar.dart';
import 'package:wallpe2/view/widgets/catBlock.dart';
import 'package:wallpe2/view/widgets/seachBar.dart';

class SearchScreen extends StatefulWidget {
  String query;
   SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
late List <PhotosModel> searchResults;
bool isLoading = true;

  GetSearchResults() async{
  searchResults = await ApiOperations.searchWallpapers(widget.query);

  setState(() {
  isLoading = false;
  });

}


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetSearchResults();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBar(),
      ),
      body: isLoading? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SearchBbar(),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 730,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 400,
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                ),
                itemCount: searchResults.length,
                itemBuilder: (context, index) => GridTile(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgUrl: searchResults[index].imgSrc)));
                    },
                    child: Hero(
                      tag: searchResults[index].imgSrc,
                      child: Container(
                        height: 500,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,

                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(15),

                          child: Image.network(
                              fit: BoxFit.cover,
                              searchResults[index].imgSrc),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}