import 'package:todoapp/features/data/datasource/product_service.dart';
import 'package:todoapp/features/domain/model/product.dart';
import 'package:todoapp/features/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductService productService;
  ProductRepoImpl(this.productService);
    @override
  Future<List<Product>> getAllProduct() {
    return productService.getAllProduct();
  }
  @override
  Future<void> addNewProduct(Product product) {
    return productService.addProduct(product);
  }

  @override
  Future<void> deleteProduct(String id) {
    return productService.deleteProduct(id);
  }



  @override
  Future<void> toggleProduct(String id, bool value) {
    return productService.toggleProduct(id, value);
  }
}
