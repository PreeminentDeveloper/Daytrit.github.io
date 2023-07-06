import 'package:daytrit/home/view/explore/explore_widget/search_bar.dart';
import 'package:daytrit/home/view/explore/explore_widget/custom_search_delegate.dart';
import 'package:daytrit/home/view_models/explore_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:daytrit/vendor/widgets/common_image_view.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    fetchTitleResult();
    super.initState();
  }

  List<String> searchResult = [];

  void fetchTitleResult() {
    final exploreModel = Provider.of<ExploreViewModel>(context, listen: false);
    for (var element in exploreModel.exploreData!.data) {
      searchResult.add(element.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    final exploreModel = Provider.of<ExploreViewModel>(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: CustomScrollView(
        slivers: [
          CustomSearchBar(
            onTapSearchBar: (() => showSearch(
                context: context,
                delegate: CustomSearchDelegate(searchResult: searchResult))),
          ),
          SliverStaggeredGrid.countBuilder(
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            crossAxisCount: 3,
            staggeredTileBuilder: (int index) {
              int modeIndex = index % 20;
              int cXCellCount = modeIndex == 11 ? 2 : 1;

              double mXCellCount = 1;
              if (modeIndex == 2 || modeIndex == 11) {
                mXCellCount = 2;
              }
              return StaggeredTile.count(cXCellCount, mXCellCount);
            },
            itemCount: exploreModel.exploreData == null
                ? 0
                : exploreModel.exploreData!.data.length,
            itemBuilder: (BuildContext context, int index) {
              var exploreData =
                  exploreModel.exploreData?.data.reversed.toList();
              return InkWell(
                onTap: () => openVideoPlayerScreen(
                    context: context,
                    videoData: exploreData,
                    videoIndex: index),
                child: CommonImageView(
                  url: "https://daytrit.net/${exploreData![index].thumbnail}",
                  height: getVerticalSize(
                    172.00,
                  ),
                  width: getHorizontalSize(
                    170.00,
                  ),
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
