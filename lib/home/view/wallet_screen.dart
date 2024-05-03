import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/transaction_model.dart';
import 'package:daytrit/home/view/wallet_details_screen.dart';
import 'package:daytrit/home/view_models/fetch_coin_view_model.dart';
import 'package:daytrit/home/view_models/transaction_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    initialize();

    super.initState();
  }

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final transactionModel =
          Provider.of<TransactionViewModel>(context, listen: false);

      await transactionModel.getTransaction();
    });
  }

  var formatter = NumberFormat('#,##,000');

  @override
  Widget build(BuildContext context) {
    final transactionModel = Provider.of<TransactionViewModel>(
      context,
    );
    print("Trans: ${transactionModel.transact.toString()}");
    final fetchCoinViewModel = Provider.of<FetchCoinViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColours.gray50,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Wallet",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColours.black,
              fontSize: getFontSize(
                28,
              ),
              fontFamily: 'Aeonik',
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black45,
              size: 20,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(
                      context: context,
                      title: 'Balance',
                      color: AppColours.gray700,
                      fontSize: 15,
                      weight: FontWeight.w600),
                  addVerticalSpace(10),
                  RichText(
                    text: TextSpan(
                      text:
                          '${formatter.format(fetchCoinViewModel.coinData) ?? ""}',
                      style: TextStyle(color: AppColours.black, fontSize: 30),
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' TC',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            textBaseline: TextBaseline.alphabetic,
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(10),
                  Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                        color: AppColours.dayTritPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset('assets/svgs/deposit.svg'),
                        getText(
                            context: context,
                            title: 'Deposit',
                            color: AppColours.white,
                            fontSize: 15,
                            weight: FontWeight.w600)
                      ],
                    ),
                  ),
                  addVerticalSpace(20),
                  getText(
                      context: context,
                      title: 'Transactions',
                      color: AppColours.gray700,
                      fontSize: 15,
                      weight: FontWeight.w600),
                  addVerticalSpace(20)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: AppColours.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(20),
                    ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GroupedListView<TransactionModel, DateTime>(
                          shrinkWrap: true,
                          elements: transactionModel.transact,
                          groupBy: (element) {
                            return DateTime(
                                element.createdAt!.year,
                                element.createdAt!.month,
                                element.createdAt!.day);
                          },
                          groupComparator: (value1, value2) =>
                              DateTime(value2.year, value2.month, value2.day)
                                  .compareTo(DateTime(
                                      value1.year, value1.month, value1.day)),
                          useStickyGroupSeparators: true,
                          groupSeparatorBuilder: (DateTime value) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                GetTimeAgo.parse(value),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColours.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            );
                          },
                          itemBuilder: (
                            context,
                            element,
                          ) =>
                              WalletTile(transactionModel: element)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WalletTile extends StatelessWidget {
  final TransactionModel transactionModel;

  const WalletTile({
    super.key,
    required this.transactionModel,
  });

  @override
  Widget build(BuildContext context) {
    String dateTimeString = transactionModel.createdAt.toString();
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDateTime = DateFormat.Hm().format(dateTime);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WalletDetailsScreen(
                      transactionModel: transactionModel,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(transactionModel.type == 'Credit'
                        ? 'assets/svgs/deep_wallet.svg'
                        : 'assets/svgs/light_wallet.svg'),
                    addHorizontalSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getText(
                            context: context,
                            title: transactionModel.description ?? '',
                            fontSize: 14,
                            weight: FontWeight.w600),
                        getText(
                            context: context,
                            title: transactionModel.type ?? '',
                            fontSize: 12,
                            weight: FontWeight.w600,
                            color: AppColours.gray700)
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        getText(
                            context: context,
                            title: transactionModel.amount ?? '',
                            fontSize: 12,
                            weight: FontWeight.w600,
                            color: transactionModel.type == 'Credit'
                                ? AppColours.dayTritPrimaryColor
                                : AppColours.black),
                        getText(
                            context: context,
                            title: " TC",
                            fontSize: 12,
                            weight: FontWeight.w600,
                            color: transactionModel.type == 'Credit'
                                ? AppColours.dayTritPrimaryColor
                                : AppColours.black),
                      ],
                    ),
                    getText(
                        context: context,
                        title: formattedDateTime,
                        fontSize: 12,
                        weight: FontWeight.w600,
                        color: AppColours.gray700)
                  ],
                )
              ],
            ),
            addVerticalSpace(10),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColours.gray700,
            )
          ],
        ),
      ),
    );
  }
}
