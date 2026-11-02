import 'package:todoapp/features/domain/model/product.dart';

abstract class ProductRepo {
  Future<List<Product>> getAllProduct();
  Future<void> addNewProduct(Product product);
  Future<void> deleteProduct(String id);
  Future<void> toggleProduct(String id, bool value);
}
