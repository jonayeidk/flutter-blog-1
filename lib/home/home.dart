import 'package:flutter/material.dart';
import 'package:test_project1/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text(" Blog",style: TextStyle(
                color: Colors.blue
              ),)
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              child: ListView.builder(
                itemCount: getCategories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return CategoryTile(
                    imageUrl: getCategories[index].imageUrl,
                    categoryName: getCategories[index].categoryName,
                  );
                  }),
            )
          ],
        ),
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(imageUrl, width: 120, height: 60,),
        ],
      ),
    );
  }
}
