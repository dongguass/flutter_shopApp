import 'package:dio/dio.dart';
import 'package:shop_app/constants/index.dart';

class DioRequest {
  // dio 请求对象
  final _dio = Dio();
  // 基础地址拦截器, 构造函数配置dio参数
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
      // 拦截器
      _addInterceptor();
  }
  void _addInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (response, handler) {
        if(response.statusCode! >= 200 && response.statusCode! <= 300){
          handler.next(response);
          return;
        }
      },
      onError: (error, handler) {
        handler.reject(error);
      },
    ));
  }

  // 封装网络请求 get方法
  Future<dynamic> get (String url, {Map<String, dynamic>? parms}){
    return _handleResponse(_dio.get(url, queryParameters: parms));
  }

  Future<dynamic> _handleResponse (Future<Response<dynamic>> task) async {
    Response<dynamic> res = await task;
    //  显示类型转换
    final data = res.data as Map<String, dynamic>;
    if(data["code"] == GlobalConstants.SUCCESS_CODE){
      // 将结果返回，此时是List<Mpa<String,String>>
      return data["result"];
    }else{
      throw Exception(data["msg"] ?? "加载数据异常");
    }
  }
}


// 当只有一个数据源的时候，用单例对象
final dioRequest = DioRequest();
