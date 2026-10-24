import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  Future<List> getHomeProducts() async {
    final Response homeProductsResponse = await dio.get(
      'https://talabat639.runasp.net/api/Products',
    );
    return homeProductsResponse.data['data'];
  }
  Future<List> getCategories() async {
    final Response categories = await dio.get(
      'https://talabat639.runasp.net/api/Products/categories',
    );
    return categories.data;
  }
  Future<List> getBrands() async {
    final Response brands = await dio.get(
      'https://talabat639.runasp.net/api/Products/brands',
    );
    return brands.data;
  }

  Future<List> getProductsByCategoryID({required int categoryId}) async {
    final Response categoryProductsResponse = await dio.get(
      'https://talabat639.runasp.net/api/Products',
      queryParameters:{"categoryId": categoryId}
    );
    return categoryProductsResponse.data['data'];
  }

  Future<List> getProductsByBrandID({required int brandId}) async {
    final Response brandProductsResponse = await dio.get(
        'https://talabat639.runasp.net/api/Products',
        queryParameters:{"brandId": brandId}
    );
    return brandProductsResponse.data['data'];
  }
}


