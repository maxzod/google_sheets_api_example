import 'package:equatable/equatable.dart';

class SheetRow extends Equatable {
  final String name;
  final String mobile;
  final String modelNumber;
  final String email;
  final DateTime putchaseDate;

  const SheetRow({
    required this.name,
    required this.mobile,
    required this.modelNumber,
    required this.email,
    required this.putchaseDate,
  });

  @override
  List<Object> get props {
    return [
      name,
      mobile,
      modelNumber,
      email,
      putchaseDate,
    ];
  }

  SheetRow copyWith({
    int? id,
    String? name,
    String? mobile,
    String? modelNumber,
    String? email,
    DateTime? putchaseDate,
  }) {
    return SheetRow(
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      modelNumber: modelNumber ?? this.modelNumber,
      email: email ?? this.email,
      putchaseDate: putchaseDate ?? this.putchaseDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'modelNumber': modelNumber,
      'email': email,
      'putchaseDate': putchaseDate.millisecondsSinceEpoch,
    };
  }

  factory SheetRow.fromMap(Map<String, dynamic> map) {
    return SheetRow(
      name: map['name'],
      mobile: map['mobile'],
      modelNumber: map['modelNumber'],
      email: map['email'],
      putchaseDate:
          DateTime.fromMillisecondsSinceEpoch(map['putchaseDate']),
    );
  }
}
