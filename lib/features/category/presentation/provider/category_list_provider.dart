import 'package:crafty_bey/app/set_up_network_caller.dart';
import 'package:crafty_bey/app/urls.dart';
import 'package:crafty_bey/core/services/network_caller.dart';
import 'package:crafty_bey/features/category/data/models/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryListProvider extends ChangeNotifier{
  final int _pageSize = 30;
  int _currentPageNo = 0;
   int? _lastPageNo;
  bool _initialLoading = false;
  bool _loadingMoreData = false;
  final List<CategoryModel> _categoryList = [];
  String? _errorMessage;

  List<CategoryModel> get CategoryList => _categoryList;
  bool get initialLoading => _initialLoading;
  bool get moreLoading => _loadingMoreData;
  String? get errorMessage => _errorMessage;

  Future<bool> fetchCategoryList() async {
    bool isSuccess = false;

    if (_currentPageNo == 0) {
      _categoryList.clear();
      _initialLoading = true;
    } else if (_lastPageNo != null && _currentPageNo < _lastPageNo!) {
      _loadingMoreData = true;
    } else {
      return false;
    }

    notifyListeners();
    _currentPageNo++;

    final NetworkResponse response =
    await getNetworkCaller().getRequest(
      url: Urls.categoryListUrl(_pageSize, _currentPageNo),
    );

    if (response.isSuccess) {
      final data = response.responseData['data'];

      if (data != null && data['results'] != null) {
        _lastPageNo = data['last_page'];

        List<dynamic> results = data['results'];

        List<CategoryModel> list = results
            .map((json) => CategoryModel.fromJson(json))
            .toList();

        _categoryList.addAll(list);

        isSuccess = true;
      }
    } else {
      _errorMessage = response.errorMessage;
    }

    _initialLoading = false;
    _loadingMoreData = false;

    notifyListeners();
    return isSuccess;
  }
}