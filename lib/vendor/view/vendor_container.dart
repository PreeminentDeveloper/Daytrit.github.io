import 'package:daytrit/vendor/view/vendor_one_screen/vendor_one_screen.dart';
import 'package:daytrit/vendor/view/vendor_screen.dart';
import 'package:daytrit/vendor/view/vendor_three_page/vendor_three_page.dart';
import 'package:daytrit/vendor/view/vendor_two_screen/vendor_two_screen.dart';
import 'package:daytrit/vendor/view/view_models/vendor_view_model.dart';
import 'package:daytrit/vendor/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../authentication/components/loader/loader.dart';
import '../../utils/constants.dart';

class VendorContainerNav extends StatefulWidget {
  const VendorContainerNav({Key? key}) : super(key: key);

  @override
  State<VendorContainerNav> createState() => _VendorContainerNavState();
}

class _VendorContainerNavState extends State<VendorContainerNav> {
  BottomBarEnum type = BottomBarEnum.Home;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.gray50,
        body: getCurrentWidget(
          type,
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            setState(() {
              this.type = type;
            });
          },
        ),
      ),
    );
  }

  ///Handling view based on bottom click actions
  Widget getCurrentWidget(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return const VendorList();
      case BottomBarEnum.Search:
        return VendorOneScreen();
      case BottomBarEnum.Watchads:
        return VendorTwoScreen();
      case BottomBarEnum.Notifications:
        return VendorThreePage();
      case BottomBarEnum.Profile:
        return getDefaultWidget();
      default:
        return getDefaultWidget();
    }
  }
}

class VendorList extends StatefulWidget {
  const VendorList({Key? key}) : super(key: key);

  @override
  State<VendorList> createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VendorViewModel>(context, listen: false).getAllVendors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<VendorViewModel>(
      builder: (context,value, child){
        if(value.loading){
          return const Loader();
        }
        return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
            controller: value.refreshController,
            onRefresh: value.onRefresh,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: Text("VENDORS", style: TextStyle(
                            fontSize: 32,
                            color: AppColours.black,
                            fontWeight: FontWeight.w700)),),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: value.vendors.length,
                            itemBuilder: (context,index){
                              final vendor = value.vendors[index];
                              if(value.vendors.isEmpty){
                                return TextButton(onPressed: ()=> value.getAllVendors(), child: Text("Reload"));
                              }
                              return GestureDetector(
                                onTap: (){
                                  value.selectedVendor  = index;
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VendorScreen( )));
                                },
                                child: ListTile(
                                  title: Text("${vendor.title}", style: const TextStyle(
                                      fontSize: 22,
                                      color: AppColours.black,
                                      fontWeight: FontWeight.w700)),
                                  subtitle: Text("${vendor.address}"),
                                ),
                              );
                            }),
                      )
                    ])));
      },
    );
  }
}