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
