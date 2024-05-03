import 'package:daytrit/home/models/dataModel/agent_vendor_model.dart';
import 'package:daytrit/home/models/dataModel/agent_vendor_order_model.dart';
import 'package:daytrit/home/models/dataModel/agent_vendor_revenue_model.dart';
import 'package:daytrit/home/models/error_model/fetch_data_error.dart';
import 'package:daytrit/home/repo/api_status.dart';
import 'package:daytrit/home/repo/fetch_agent_vendor_service.dart';
import 'package:flutter/material.dart';

class AgentVendorViewModel extends ChangeNotifier {
  FetchAgentVendorService service = FetchAgentVendorService();

  bool _loading = false;

  FetchDataError? _fetchDataError;

  AgentVendorModel? _agentVendorDataResponse;

  AgentVendorOrderModel? _orderDataResponse;

  AgentVendorRevenueModel? _revenueDataResponse;

  HomeScreenDataFailure? _homeScreenDataFailure;

  FetchDataError? get fetchDataError => _fetchDataError;

  List<MyVendor> get myVendor => agentVendorDataResponse?.data ?? [];
  AgentVendorModel? get agentVendorDataResponse => _agentVendorDataResponse;

  List<Datum>? get orders => orderDataResponse?.data.data ?? [];
  AgentVendorOrderModel? get orderDataResponse => _orderDataResponse;

  Object get revenue => revenueDataResponse?.data ?? [];
  AgentVendorRevenueModel? get revenueDataResponse => _revenueDataResponse;

  HomeScreenDataFailure? get userProfileFailure => _homeScreenDataFailure;

  // MyVendor? vendor;

  bool get loading => _loading;

  Map<String, dynamic>? decodedData;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setAgentVendorDataResponse(dynamic agentVendorDataResponse) {
    return _agentVendorDataResponse = agentVendorDataResponse;
  }

  setOrderDataResponse(dynamic orderDataResponse) {
    return _orderDataResponse = orderDataResponse;
  }

  setRevenueDataResponse(dynamic revenueDataResponse) {
    return _revenueDataResponse = revenueDataResponse;
  }

  setFetchDataError(FetchDataError fetchDataError) =>
      _fetchDataError = fetchDataError;
  //setHomeScreenDataFailure(FetchDataError fetchDataError) => _homeScreenDataFailure = fetchDataError;

  Future<List<MyVendor>> getAgentVendors() async {
    setLoading(true);
    var response = await FetchAgentVendorService.getAgentVendors();
    print(("resp-data: $response"));
    setAgentVendorDataResponse(response.data);
    if (response is HomeScreenDataFailure) {
      FetchDataError fetchDataError = FetchDataError(message: response.message);
      setFetchDataError(fetchDataError);
    }
    setLoading(false);
    return myVendor;
  }

  Future<List<Datum>?> getAgentOrders() async {
    setLoading(true);
    var response = await FetchAgentVendorService.getAgentOrders();
    print("Order-response: $response");
    setOrderDataResponse(response.data);
    if (response is HomeScreenDataFailure) {
      FetchDataError fetchDataError = FetchDataError(message: response.message);
      setFetchDataError(fetchDataError);
    }
    setLoading(false);
    return orders;
  }

  Future<List<Datum>?> getAgentRevenue() async {
    setLoading(true);
    var response = await FetchAgentVendorService.getAgentRevenue();
    print("Revenue-response: $response");
    setRevenueDataResponse(response.data);
    if (response is HomeScreenDataFailure) {
      FetchDataError fetchDataError = FetchDataError(message: response.message);
      setFetchDataError(fetchDataError);
    }
    setLoading(false);
    return orders;
  }
}
