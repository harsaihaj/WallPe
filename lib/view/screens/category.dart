import 'package:flutter/material.dart';
import 'package:wallpe2/controller/apiOper.dart';
import 'package:wallpe2/model/photosModel.dart';
import 'package:wallpe2/view/screens/fullScreen.dart';
import 'package:wallpe2/view/widgets/CustomAppBar.dart';
import 'package:wallpe2/view/widgets/catBlock.dart';
import 'package:wallpe2/view/widgets/seachBar.dart';

class CategoryScreen extends StatefulWidget {
  final String namee;
  final String imgUrl;

  CategoryScreen({super.key, required this.namee, required this.imgUrl});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<PhotosModel> searchResults = []; // Initialize the list

  // Modify the method to accept a parameter
  GetSearchResults(String nameee) async {
    searchResults = await ApiOperations.searchWallpapers(nameee);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Pass widget.namee to the GetSearchResults method
    GetSearchResults(widget.namee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                Image.network(
                    height: 200,
                    width:  MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    widget.imgUrl
                ),

                Container(
                  height: 200,
                  width:  MediaQuery.of(context).size.width,
                  color: Colors.black38,

                ),

                Positioned(
                  left: (MediaQuery.of(context).size.width)/2.65,
                  top: 60,
                  child: Column(
                    children: [
                      Text("Category", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400)),
                      Text(widget.namee, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),),
                    ],
                  ),
                )
              ],
            ),


            SizedBox(height: 20,),
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