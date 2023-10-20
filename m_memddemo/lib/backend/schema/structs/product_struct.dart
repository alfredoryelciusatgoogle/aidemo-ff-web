// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    int? id,
    String? description,
    String? title,
    bool? isAvailable,
    int? inventoryCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _description = description,
        _title = title,
        _isAvailable = isAvailable,
        _inventoryCount = inventoryCount,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  set isAvailable(bool? val) => _isAvailable = val;
  bool hasIsAvailable() => _isAvailable != null;

  // "inventoryCount" field.
  int? _inventoryCount;
  int get inventoryCount => _inventoryCount ?? 0;
  set inventoryCount(int? val) => _inventoryCount = val;
  void incrementInventoryCount(int amount) =>
      _inventoryCount = inventoryCount + amount;
  bool hasInventoryCount() => _inventoryCount != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        id: castToType<int>(data['id']),
        description: data['description'] as String?,
        title: data['title'] as String?,
        isAvailable: data['isAvailable'] as bool?,
        inventoryCount: castToType<int>(data['inventoryCount']),
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProductStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'description': _description,
        'title': _title,
        'isAvailable': _isAvailable,
        'inventoryCount': _inventoryCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'isAvailable': serializeParam(
          _isAvailable,
          ParamType.bool,
        ),
        'inventoryCount': serializeParam(
          _inventoryCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        isAvailable: deserializeParam(
          data['isAvailable'],
          ParamType.bool,
          false,
        ),
        inventoryCount: deserializeParam(
          data['inventoryCount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductStruct &&
        id == other.id &&
        description == other.description &&
        title == other.title &&
        isAvailable == other.isAvailable &&
        inventoryCount == other.inventoryCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, description, title, isAvailable, inventoryCount]);
}

ProductStruct createProductStruct({
  int? id,
  String? description,
  String? title,
  bool? isAvailable,
  int? inventoryCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      id: id,
      description: description,
      title: title,
      isAvailable: isAvailable,
      inventoryCount: inventoryCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
