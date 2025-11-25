import 'package:injectable/injectable.dart';
import 'package:isar_agent_memory/isar_agent_memory.dart';
import '../../domain/services/vector_store_service.dart';

@LazySingleton(as: VectorStoreService)
class IsarVectorStoreService implements VectorStoreService {
  final MemoryGraph _memoryGraph;

  IsarVectorStoreService(this._memoryGraph);

  @override
  Future<void> addDocument(String id, String content, Map<String, dynamic> metadata) async {
    await _memoryGraph.storeNodeWithEmbedding(
      content: content,
      metadata: {
        'externalId': id,
        ...metadata,
      },
      deduplicate: true,
    );
  }

  @override
  Future<List<String>> search(String query, {int limit = 3}) async {
    // Use hybrid search for better results
    final results = await _memoryGraph.hybridSearch(
      query,
      topK: limit,
      alpha: 0.5, // Balance between vector and keyword search
    );

    return results.map((r) => r.node.content).toList();
  }
}
