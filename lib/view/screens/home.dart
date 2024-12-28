import 'package:flutter/material.dart';
import 'package:wallpe2/controller/apiOper.dart';
import 'package:wallpe2/model/photosModel.dart';
import 'package:wallpe2/view/screens/category.dart';
import 'package:wallpe2/view/screens/fullScreen.dart';
import 'package:wallpe2/view/widgets/CustomAppBar.dart';
import 'package:wallpe2/view/widgets/catBlock.dart';
import 'package:wallpe2/view/widgets/seachBar.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <String> Listnames= ["Nature", "Cars", "Animals", "Abstract", "Space", "Minimalist"];
  List<String> Urlss = ["https://images.pexels.com/photos/158063/bellingrath-gardens-alabama-landscape-scenic-158063.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ,"https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ,"https://images.pexels.com/photos/288621/pexels-photo-288621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ,"https://images.pexels.com/photos/2693212/pexels-photo-2693212.png?auto=compress&cs=tinysrgb&w=600"
    ,"https://images.pexels.com/photos/41162/moon-landing-apollo-11-nasa-buzz-aldrin-41162.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ,"https://images.pexels.com/photos/973505/pexels-photo-973505.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"];

  late List<PhotosModel> trendingWallList;
  bool isLoading = true;


  GetTrendingWallpaper() async{



    trendingWallList = await ApiOperations.getTrendingWallpapers();
    setState(() {
    isLoading= false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetTrendingWallpaper();
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
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      // Navigate to the new page when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(namee: Listnames[index], imgUrl: Urlss[index]),
                        ),
                      );
                    },
                    child: catBlock(name: Listnames[index], imgUrl: Urlss[index]),
                  ),
                ),
              ),
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
                itemCount: trendingWallList.length,
                itemBuilder: (context, index) => GridTile(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgUrl: trendingWallList[index].imgSrc)));
                    },
                    child: Hero(
                      tag: trendingWallList[index].imgSrc,
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
                              trendingWallList[index].imgSrc),
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