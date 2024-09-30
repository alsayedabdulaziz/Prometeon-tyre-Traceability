import 'package:collection/collection.dart';

enum ZebraInterfaces {
  rfidapi3,
  datawedge,
  unknown,
}

enum ZebraScanRequest {
  rfidStartInventory,
  rfidStopInventory,
  unknown,
}

enum ZebraEvents {
  readRfid,
  readBarcode,
  error,
  connectionStatus,
  unknown,
}

enum ZebraConnectionStatus {
  disconnected,
  connected,
  error,
  unknown,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ZebraInterfaces):
      return ZebraInterfaces.values.deserialize(value) as T?;
    case (ZebraScanRequest):
      return ZebraScanRequest.values.deserialize(value) as T?;
    case (ZebraEvents):
      return ZebraEvents.values.deserialize(value) as T?;
    case (ZebraConnectionStatus):
      return ZebraConnectionStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
