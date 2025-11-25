import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:isar_agent_memory/isar_agent_memory.dart';
import 'dart:math';

@module
abstract class MemoryModule {
  @lazySingleton
  EmbeddingsAdapter get embeddingsAdapter => SimpleEmbeddingsAdapter();

  @lazySingleton
  MemoryGraph memoryGraph(Isar isar, EmbeddingsAdapter adapter) {
    return MemoryGraph(isar, embeddingsAdapter: adapter);
  }
}

class SimpleEmbeddingsAdapter implements EmbeddingsAdapter {
  @override
  int get dimension => 768; // Default for ObjectBox in isar_agent_memory

  @override
  String get providerName => 'simple_hash';

  @override
  Future<List<double>> embed(String text) async {
    // Deterministic pseudo-random generation based on text hash
    final seed = text.hashCode;
    final random = Random(seed);
    return List.generate(dimension, (_) => random.nextDouble());
  }
}
