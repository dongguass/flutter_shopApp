
import 'package:shop_app/constants/index.dart';
import 'package:shop_app/utils/dioRequest.dart';
import 'package:shop_app/viewmodels/home.dart';

Future<List<BannerImg>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerImg.formJSON(item as Map<String, dynamic>);
  }).toList();
}

// 分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}
