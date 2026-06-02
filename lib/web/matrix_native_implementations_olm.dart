import 'olm_session_manager.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:html';
import 'dart:js';
import 'package:matrix/matrix.dart';
import 'package:matrix/encryption/key_manager.dart';
import 'package:matrix/encryption/ssss.dart';
import 'package:image/image.dart';
import 'package:blurhash_dart/blurhash_dart.dart';

class NativeImplementationsOlm implements NativeImplementations {
  NativeImplementationsOlm() {
    print("Olm bridge created!");
  }

  @override
  Future<void> init() async {
    print("OLM INIT STARTED!");
  }

  @override
  Future<void> dispose() async {}

  @override
  Future<Uint8List?> decryptFile(EncryptedFile file, {bool retryInDummy = true}) async {
    print("decryptFile called");
    return null;
  }

  @override
  Future<RoomKeys> generateUploadKeys(GenerateUploadKeysArgs args, {bool retryInDummy = true}) async {
  print("🔑 Generating upload keys for user: ${args.userId}");
  
  try {
    // Get or create Olm account for this user
    final account = OlmSessionManager.getOrCreateAccount(args.userId);
    final identityKeys = OlmSessionManager.getIdentityKeys(args.userId);
    
    print("✅ Identity keys generated: $identityKeys");
    
    // Return empty RoomKeys for now (we will fill with real keys later)
    return RoomKeys(rooms: {});
  } catch (e) {
    print("❌ Failed to generate keys: $e");
    return RoomKeys(rooms: {});
  }
}
  @override
  Future<Uint8List> keyFromPassphrase(KeyFromPassphraseArgs args, {bool retryInDummy = true}) async {
    print("keyFromPassphrase called");
    return Uint8List(32);
  }

  @override
  Future<MatrixImageFileResizedResponse?> shrinkImage(
    MatrixImageFileResizeArguments args, {
    bool retryInDummy = false,
  }) async {
    return calcImageMetadata(args.bytes);
  }

  @override
  Future<MatrixImageFileResizedResponse?> calcImageMetadata(
    Uint8List bytes, {
    bool retryInDummy = false,
  }) async {
    final image = decodeImage(bytes);
    if (image == null) return null;
    return MatrixImageFileResizedResponse(
      bytes: bytes,
      width: image.width,
      height: image.height,
      blurhash: "",
    );
  }
}
