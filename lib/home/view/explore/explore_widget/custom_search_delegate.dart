import 'package:daytrit/home/view_models/explore_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String>? searchResult;
  CustomSearchDelegate({this.searchResult});

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    final exploreModel = Provider.of<ExploreViewModel>(context);
    var exploreData = exploreModel.exploreData?.data;
    List<String> matchQuery = [];
    for (var title in searchResult!) {
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(title);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery.reversed.toList()[index];
        return ListTile(
          title: InkWell(
              onTap: () => openVideoPlayerScreen(
                  context: context, videoData: exploreData, videoIndex: index),
              child: Text(result)),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    final exploreModel = Provider.of<ExploreViewModel>(context);
    var exploreData = exploreModel.exploreData?.data;
    List<String> matchQuery = [];
    for (var title in searchResult!) {
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(title);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        int? shuffledIndex;
        bool checkShuffledResult = searchResult!.length > matchQuery.length;
        if (checkShuffledResult) {
          for (var i = 0; i < searchResult!.length; i++) {
            if (result == searchResult![i]) {
              shuffledIndex = i;
            }
          }
        }
        return ListTile(
          title: InkWell(
              onTap: () => openVideoPlayerScreen(
                  context: context,
                  videoData: exploreData,
                  videoIndex: checkShuffledResult ? shuffledIndex : index),
              child: Text(result)),
        );
      },
    );
  }
}
