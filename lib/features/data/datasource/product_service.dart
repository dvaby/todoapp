import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/features/domain/model/product.dart';

class ProductService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference get _productref => firestore.collection('producdt');

  Future<List<Product>> getAllProduct() async {
    try {
      final snapshot = await _productref.get();
      return snapshot.docs.map((e) {
        return Product.fromMap(e.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch Products");
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      await _productref.doc(product.id).set(product.toMap());
    } catch (e) {
      throw Exception('Failed to add Product $e');
    }
  }

  //delete
  Future<void> deleteProduct(String id) async {
    try {
      await _productref.doc(id).delete();
    } catch (e) {
      throw Exception('Failde to Delete Product $e');
    }
  }

  //toggle
  Future<void> toggleProduct(String id, bool value) async {
    try {
      await _productref.doc(id).update({'isCompleted': value});
    } catch (e) {
      throw Exception('failed to toggle product');
    }
  }
}
