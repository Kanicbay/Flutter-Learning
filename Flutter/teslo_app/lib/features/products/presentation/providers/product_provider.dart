import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/products/domain/domain.dart';
import 'package:teslo_app/features/products/presentation/providers/providers.dart';

class ProductState {
  final String id;
  final Product? product;
  final bool isLoading;
  final bool isSaving;

  ProductState({
    required this.id,
    this.product,
    this.isLoading = true,
    this.isSaving = false,
  });

  ProductState copyWith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? isSaving,
  }) => ProductState(
    id: id ?? this.id,
    product: product ?? this.product,
    isLoading: isLoading ?? this.isLoading,
    isSaving: isSaving ?? this.isSaving,
  );
}

class ProductNotifier extends Notifier<ProductState> {
  ProductsRepository get productsRepository =>
      ref.watch(productsRepositoryProvider);

  final String id;
  bool _loaded = false;

  ProductNotifier(this.id);

  @override
  ProductState build() {
    if (!_loaded) {
      _loaded = true;
      Future.microtask(loadProduct);
    }
    return ProductState(id: id);
  }

  Product newEmptyProduct() {
    return Product(
      id: 'new',
      title: '',
      price: 0,
      description: '',
      slug: '',
      stock: 0,
      sizes: [],
      gender: 'men',
      tags: [],
      images: [],
    );
  }

  Future<void> loadProduct() async {
    if (state.id == 'new') {
      state = state.copyWith(isLoading: false, product: newEmptyProduct());
      return;
    }
    final product = await productsRepository.getProductById(state.id);
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: false, product: product);
  }
}

final productProvider = NotifierProvider.autoDispose
    .family<ProductNotifier, ProductState, String>(ProductNotifier.new);
