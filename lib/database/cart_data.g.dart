// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartDataAdapter extends TypeAdapter<CartData> {
  @override
  final int typeId = 3;

  @override
  CartData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartData(
      products: (fields[0] as List).cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
