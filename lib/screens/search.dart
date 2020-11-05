import 'package:flutter/material.dart';
import 'package:my_movies/component/cardSearch.dart';
import 'package:my_movies/provider/search.dart';
import 'package:my_movies/screens/detail.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {

  final String value;
  SearchPage({this.value});

  @override
  Widget build(BuildContext context) {
    final SearchBlock searchBlock = Provider.of<SearchBlock>(context);
    searchBlock.fetchPost(value);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: searchBlock.listpost != null
          ? ListView.builder(
              itemCount: searchBlock.listpost.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    searchBlock.idPost = searchBlock.listpost[index].imdbId;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(searchBlock.listpost[index].imdbId)));
                  },
                  child: cardSearch(
                      (searchBlock.listpost[index].poster != "N/A" ? searchBlock.listpost[index].poster : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"),
                      searchBlock.listpost[index].title,
                      searchBlock.listpost[index].year),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
