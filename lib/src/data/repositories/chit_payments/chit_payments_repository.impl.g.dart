// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chit_payments_repository.impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chitPaymentsHash() => r'1ac94e8cf2c497c1e13145d79bc3ad4c57ceb00b';

/// See also [chitPayments].
@ProviderFor(chitPayments)
final chitPaymentsProvider =
    AutoDisposeStreamProvider<List<ChitPaymentWithChitNameAndIdModel>>.internal(
  chitPayments,
  name: r'chitPaymentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chitPaymentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChitPaymentsRef
    = AutoDisposeStreamProviderRef<List<ChitPaymentWithChitNameAndIdModel>>;
String _$chitPaymentHash() => r'15d7b98f7a1fbbe1e07b7d5f99f6fe46f683c8cc';

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

/// See also [chitPayment].
@ProviderFor(chitPayment)
const chitPaymentProvider = ChitPaymentFamily();

/// See also [chitPayment].
class ChitPaymentFamily
    extends Family<AsyncValue<ChitPaymentWithChitNameAndIdModel>> {
  /// See also [chitPayment].
  const ChitPaymentFamily();

  /// See also [chitPayment].
  ChitPaymentProvider call(
    int chitPaymentId,
  ) {
    return ChitPaymentProvider(
      chitPaymentId,
    );
  }

  @override
  ChitPaymentProvider getProviderOverride(
    covariant ChitPaymentProvider provider,
  ) {
    return call(
      provider.chitPaymentId,
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
  String? get name => r'chitPaymentProvider';
}

/// See also [chitPayment].
class ChitPaymentProvider
    extends AutoDisposeStreamProvider<ChitPaymentWithChitNameAndIdModel> {
  /// See also [chitPayment].
  ChitPaymentProvider(
    int chitPaymentId,
  ) : this._internal(
          (ref) => chitPayment(
            ref as ChitPaymentRef,
            chitPaymentId,
          ),
          from: chitPaymentProvider,
          name: r'chitPaymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chitPaymentHash,
          dependencies: ChitPaymentFamily._dependencies,
          allTransitiveDependencies:
              ChitPaymentFamily._allTransitiveDependencies,
          chitPaymentId: chitPaymentId,
        );

  ChitPaymentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chitPaymentId,
  }) : super.internal();

  final int chitPaymentId;

  @override
  Override overrideWith(
    Stream<ChitPaymentWithChitNameAndIdModel> Function(ChitPaymentRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChitPaymentProvider._internal(
        (ref) => create(ref as ChitPaymentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chitPaymentId: chitPaymentId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ChitPaymentWithChitNameAndIdModel>
      createElement() {
    return _ChitPaymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChitPaymentProvider && other.chitPaymentId == chitPaymentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chitPaymentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChitPaymentRef
    on AutoDisposeStreamProviderRef<ChitPaymentWithChitNameAndIdModel> {
  /// The parameter `chitPaymentId` of this provider.
  int get chitPaymentId;
}

class _ChitPaymentProviderElement
    extends AutoDisposeStreamProviderElement<ChitPaymentWithChitNameAndIdModel>
    with ChitPaymentRef {
  _ChitPaymentProviderElement(super.provider);

  @override
  int get chitPaymentId => (origin as ChitPaymentProvider).chitPaymentId;
}

String _$chitNamesAndIdsHash() => r'd62b58024bed449fedf49902e6fc88b51a1225bd';

/// See also [chitNamesAndIds].
@ProviderFor(chitNamesAndIds)
final chitNamesAndIdsProvider =
    AutoDisposeFutureProvider<List<ChitNameAndId>>.internal(
  chitNamesAndIds,
  name: r'chitNamesAndIdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chitNamesAndIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChitNamesAndIdsRef = AutoDisposeFutureProviderRef<List<ChitNameAndId>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
