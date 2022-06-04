// ignore_for_file: file_names, non_constant_identifier_names

class VehicleModel {
  int? slot_no;
  String? vehicle_number;
  String? owner_name;
  String? phone_number;

  VehicleModel(
      {this.slot_no, this.vehicle_number, this.owner_name, this.phone_number});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
        slot_no: int.parse(json['slot_no']),
        vehicle_number: json['vehicle_number'] as String,
        owner_name: json['name'] as String,
        phone_number: json['phone'] as String);
  }
}
