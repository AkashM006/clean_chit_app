// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chit_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chitsHash() => r'638921726e912bdd0e0eae6808124e450d92384b';

/// See also [chits].
@ProviderFor(chits)
final chitsProvider = AutoDisposeStreamProvider<List<ChitWithDates>>.internal(
  chits,
  name: r'chitsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChitsRef = AutoDisposeStreamProviderRef<List<ChitWithDates>>;
String _$chitHash() => r'2448ac31d09f4911f80ee5757e1b605302d2f6cf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [chit].
@ProviderFor(chit)
const chitProvider = ChitFamily();

/// See also [chit].
class ChitFamily extends Family<AsyncValue<ChitDetailWithDatesAndPayments>> {
  /// See also [chit].
  const ChitFamily();

  /// See also [chit].
  ChitProvider call(
    int id,
  ) {
    return ChitProvider(
      id,
    );
  }

  @override
  ChitProvider getProviderOverride(
    covariant ChitProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chitProvider';
}

/// See also [chit].
class ChitProvider
    extends AutoDisposeStreamProvider<ChitDetailWithDatesAndPayments> {
  /// See also [chit].
  ChitProvider(
    int id,
  ) : this._internal(
          (ref) => chit(
            ref as ChitRef,
            id,
          ),
          from: chitProvider,
          name: r'chitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$chitHash,
          dependencies: ChitFamily._dependencies,
          allTransitiveDependencies: ChitFamily._allTransitiveDependencies,
          id: id,
        );

  ChitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    Stream<ChitDetailWithDatesAndPayments> Function(ChitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChitProvider._internal(
        (ref) => create(ref as ChitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ChitDetailWithDatesAndPayments>
      createElement() {
    return _ChitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChitProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChitRef on AutoDisposeStreamProviderRef<ChitDetailWithDatesAndPayments> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ChitProviderElement
    extends AutoDisposeStreamProviderElement<ChitDetailWithDatesAndPayments>
    with ChitRef {
  _ChitProviderElement(super.provider);

  @override
  int get id => (origin as ChitProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
