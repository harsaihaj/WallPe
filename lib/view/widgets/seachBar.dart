import 'package:flutter/material.dart';
import 'package:wallpe2/view/screens/search.dart';

class SearchBbar extends StatelessWidget {

   SearchBbar({super.key});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(

        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(17.5)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey.shade50,
                filled: true, // Make sure this is set to true
                fillColor: Colors.blueGrey.shade50,
                hintText: "Search Here",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
            
              ),
            
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(query: _searchController.text)));
    },
              child:Icon(Icons.search)
          )
        ],
      ),

    );
  }
}
