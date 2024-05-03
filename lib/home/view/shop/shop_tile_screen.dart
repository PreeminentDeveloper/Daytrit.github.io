import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/edit_profile_view_model.dart.dart';
import 'package:daytrit/home/models/dataModel/shop_trit_model.dart';
import 'package:daytrit/home/repo/paystack_integration.dart';
import 'package:daytrit/home/view_models/purchase_coin_viewmodel.dart';
import 'package:daytrit/home/view_models/purchase_trit_coin_viewmodel.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/url_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:provider/provider.dart';

class ShopTile extends StatefulWidget {
  final ShopTritModel shopModel;
  const ShopTile({super.key, required this.shopModel});

  @override
  State<ShopTile> createState() => _ShopTileState();
}

class _ShopTileState extends State<ShopTile> {
  bool isBuy = false;

  @override
  Widget build(BuildContext context) {
    final purchaseCoinViewModel = Provider.of<PurchaseCoinViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        InkWell(
          onTap: () {
            setState(() {
              isBuy = true;
            });
          },
          child: Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: isBuy
                  ? Column(
                      children: [
                        getText(
                            context: context,
                            title:
                                'Are you sure you want to buy this\npackage?',
                            textAlign: TextAlign.center,
                            fontSize: 15,
                            weight: FontWeight.w600),
                        addVerticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                                width: 70,
                                buttonColor: AppColours.dayTritPrimaryColor,
                                fontSize: 15,
                                buttonName: 'Yes',
                                onPressed: () {
                                  purchaseCoinViewModel.purchaseTritCoin(
                                      context,
                                      amount: widget.shopModel.amount,
                                      qty: widget.shopModel.qty);
                                }),
                            CustomButton(
                              buttonName: 'No',
                              onPressed: () async {
                                setState(() {
                                  isBuy = false;
                                });
                              },
                              width: 70,
                              buttonColor: AppColours.redA700,
                              fontSize: 15,
                            )
                          ],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(widget.shopModel.coinIcon),
                              SizedBox(width: 3),
                              getText(
                                  context: context,
                                  title: widget.shopModel.qty.toString(),
                                  weight: FontWeight.bold)
                            ],
                          ),
                        ),
                        Expanded(
                            child: Image.asset(widget.shopModel.coinBoxImage)),
                      ],
                    )),
        ),
        Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColours.dayTritPrimaryColor5,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
                child: getText(
                    context: context,
                    title: "N${widget.shopModel.amount}",
                    fontSize: 20,
                    color: AppColours.white,
                    weight: FontWeight.w600)))
      ]),
    );
  }
}
