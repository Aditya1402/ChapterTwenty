import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Text("Highest Rated", style: Theme.of(context).textTheme.headline6,),
              IconButton(onPressed: (){}, 
              icon: Icon(Icons.arrow_forward_rounded))
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 15),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Image.network("https://images.unsplash.com/photo-1620766165457-a8025baa82e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJlJTIwb2YlMjBpbmRpYXxlbnwwfHwwfHw%3D&w=1000&q=80",
                      width: 100,),
                      Text("Harry Potter & ...")
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
