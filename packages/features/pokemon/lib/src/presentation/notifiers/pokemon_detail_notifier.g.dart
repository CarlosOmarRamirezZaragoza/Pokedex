// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonDetailNotifierHash() =>
    r'0ef6a9976b2fb5d1c27935502939f6be8724c3ab';

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

abstract class _$PokemonDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Pokemon> {
  late final String idOrName;
  late final Pokemon? initialPokemon;

  FutureOr<Pokemon> build(
    String idOrName, {
    Pokemon? initialPokemon,
  });
}

/// See also [PokemonDetailNotifier].
@ProviderFor(PokemonDetailNotifier)
const pokemonDetailNotifierProvider = PokemonDetailNotifierFamily();

/// See also [PokemonDetailNotifier].
class PokemonDetailNotifierFamily extends Family<AsyncValue<Pokemon>> {
  /// See also [PokemonDetailNotifier].
  const PokemonDetailNotifierFamily();

  /// See also [PokemonDetailNotifier].
  PokemonDetailNotifierProvider call(
    String idOrName, {
    Pokemon? initialPokemon,
  }) {
    return PokemonDetailNotifierProvider(
      idOrName,
      initialPokemon: initialPokemon,
    );
  }

  @override
  PokemonDetailNotifierProvider getProviderOverride(
    covariant PokemonDetailNotifierProvider provider,
  ) {
    return call(
      provider.idOrName,
      initialPokemon: provider.initialPokemon,
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
  String? get name => r'pokemonDetailNotifierProvider';
}

/// See also [PokemonDetailNotifier].
class PokemonDetailNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PokemonDetailNotifier,
        Pokemon> {
  /// See also [PokemonDetailNotifier].
  PokemonDetailNotifierProvider(
    String idOrName, {
    Pokemon? initialPokemon,
  }) : this._internal(
          () => PokemonDetailNotifier()
            ..idOrName = idOrName
            ..initialPokemon = initialPokemon,
          from: pokemonDetailNotifierProvider,
          name: r'pokemonDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonDetailNotifierHash,
          dependencies: PokemonDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              PokemonDetailNotifierFamily._allTransitiveDependencies,
          idOrName: idOrName,
          initialPokemon: initialPokemon,
        );

  PokemonDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idOrName,
    required this.initialPokemon,
  }) : super.internal();

  final String idOrName;
  final Pokemon? initialPokemon;

  @override
  FutureOr<Pokemon> runNotifierBuild(
    covariant PokemonDetailNotifier notifier,
  ) {
    return notifier.build(
      idOrName,
      initialPokemon: initialPokemon,
    );
  }

  @override
  Override overrideWith(PokemonDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PokemonDetailNotifierProvider._internal(
        () => create()
          ..idOrName = idOrName
          ..initialPokemon = initialPokemon,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idOrName: idOrName,
        initialPokemon: initialPokemon,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PokemonDetailNotifier, Pokemon>
      createElement() {
    return _PokemonDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailNotifierProvider &&
        other.idOrName == idOrName &&
        other.initialPokemon == initialPokemon;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idOrName.hashCode);
    hash = _SystemHash.combine(hash, initialPokemon.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PokemonDetailNotifierRef on AutoDisposeAsyncNotifierProviderRef<Pokemon> {
  /// The parameter `idOrName` of this provider.
  String get idOrName;

  /// The parameter `initialPokemon` of this provider.
  Pokemon? get initialPokemon;
}

class _PokemonDetailNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PokemonDetailNotifier,
        Pokemon> with PokemonDetailNotifierRef {
  _PokemonDetailNotifierProviderElement(super.provider);

  @override
  String get idOrName => (origin as PokemonDetailNotifierProvider).idOrName;
  @override
  Pokemon? get initialPokemon =>
      (origin as PokemonDetailNotifierProvider).initialPokemon;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
