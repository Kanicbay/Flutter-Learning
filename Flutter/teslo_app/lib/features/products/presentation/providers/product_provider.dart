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
  ProductNotifier(this.id);

  @override
  ProductState build() {
    return ProductState(id: id);
  }

  Future<void> loadProduct() async {
    final product = await productsRepository.getProductById(state.id);
    state = state.copyWith(isLoading: false, product: product);
  }
}

final productProvider = NotifierProvider.autoDispose
    .family<ProductNotifier, ProductState, String>(ProductNotifier.new);
