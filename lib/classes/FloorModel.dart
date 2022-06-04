// ignore_for_file: file_names, non_constant_identifier_names

class FloorModel {
  int? floor_no;
  String? floor_name;
  int? no_of_slots;

  FloorModel({this.floor_no, this.floor_name, this.no_of_slots});
  factory FloorModel.fromJson(Map<String, dynamic> json) {
    return FloorModel(
        floor_no: int.parse(json['floor_no']),
        floor_name: json['floor_name'] as String,
        no_of_slots: int.parse(json['no_of_slot']));
  }
}
