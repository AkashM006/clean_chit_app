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
String _$chitDatesHash() => r'756dd0a240807b48f833a9af50cc9987253071ee';

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

/// See also [chitDates].
@ProviderFor(chitDates)
const chitDatesProvider = ChitDatesFamily();

/// See also [chitDates].
class ChitDatesFamily extends Family<AsyncValue<List<DateTime>>> {
  /// See also [chitDates].
  const ChitDatesFamily();

  /// See also [chitDates].
  ChitDatesProvider call(
    int chitId,
  ) {
    return ChitDatesProvider(
      chitId,
    );
  }

  @override
  ChitDatesProvider getProviderOverride(
    covariant ChitDatesProvider provider,
  ) {
    return call(
      provider.chitId,
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
  String? get name => r'chitDatesProvider';
}

/// See also [chitDates].
class ChitDatesProvider extends AutoDisposeFutureProvider<List<DateTime>> {
  /// See also [chitDates].
  ChitDatesProvider(
    int chitId,
  ) : this._internal(
          (ref) => chitDates(
            ref as ChitDatesRef,
            chitId,
          ),
          from: chitDatesProvider,
          name: r'chitDatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chitDatesHash,
          dependencies: ChitDatesFamily._dependencies,
          allTransitiveDependencies: ChitDatesFamily._allTransitiveDependencies,
          chitId: chitId,
        );

  ChitDatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chitId,
  }) : super.internal();

  final int chitId;

  @override
  Override overrideWith(
    FutureOr<List<DateTime>> Function(ChitDatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChitDatesProvider._internal(
        (ref) => create(ref as ChitDatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chitId: chitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DateTime>> createElement() {
    return _ChitDatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChitDatesProvider && other.chitId == chitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChitDatesRef on AutoDisposeFutureProviderRef<List<DateTime>> {
  /// The parameter `chitId` of this provider.
  int get chitId;
}

class _ChitDatesProviderElement
    extends AutoDisposeFutureProviderElement<List<DateTime>> with ChitDatesRef {
  _ChitDatesProviderElement(super.provider);

  @override
  int get chitId => (origin as ChitDatesProvider).chitId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
