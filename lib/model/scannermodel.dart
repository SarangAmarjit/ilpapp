// To parse this JSON data, do
//
//     final qrScannerModel = qrScannerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QrScannerModel qrScannerModelFromJson(String str) => QrScannerModel.fromJson(json.decode(str));

String qrScannerModelToJson(QrScannerModel data) => json.encode(data.toJson());

class QrScannerModel {
    final String permitType;
    final String permitNo;
    final String applicantName;
    final String applicantParent;
    final String idNo;
    final String dateOfIssue;
    final String validUpto;
    final String placeOfStay;
    final String hs;

    QrScannerModel({
        required this.permitType,
        required this.permitNo,
        required this.applicantName,
        required this.applicantParent,
        required this.idNo,
        required this.dateOfIssue,
        required this.validUpto,
        required this.placeOfStay,
        required this.hs,
    });

    factory QrScannerModel.fromJson(Map<String, dynamic> json) => QrScannerModel(
        permitType: json["Permit Type"],
        permitNo: json["Permit No"],
        applicantName: json["Applicant Name"],
        applicantParent: json["Applicant Parent"],
        idNo: json["ID No"],
        dateOfIssue: json["Date of Issue"],
        validUpto: json["Valid Upto"],
        placeOfStay: json["Place of Stay"],
        hs: json["HS"],
    );

    Map<String, dynamic> toJson() => {
        "Permit Type": permitType,
        "Permit No": permitNo,
        "Applicant Name": applicantName,
        "Applicant Parent": applicantParent,
        "ID No": idNo,
        "Date of Issue": dateOfIssue,
        "Valid Upto": validUpto,
        "Place of Stay": placeOfStay,
        "HS": hs,
    };
}
