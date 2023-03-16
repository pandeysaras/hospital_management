import 'package:medteam/model/shift_data_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class ShiftRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<ShiftDataModel> shiftDataApi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("https://clickandstaff.com/api/get_shift_data?user_id=224");
      return response = ShiftDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
}

  Future<dynamic> bidShiftAPi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.postBidShiftEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }



}