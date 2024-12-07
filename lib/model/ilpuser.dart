import 'dart:convert';

class InnerLinePermitUser {
  final int id;
  final String applicationNo;
  final String name;
  final String parentName;
  final String idProof;
  final String idNo;
  final String gender;
  final String dob;
  final String idMark;
  final String occupation;
  final String photo;
  final String signature;
  final String idCard;
  final String state;
  final String policeStation;
  final String district;
  final String houseNo;
  final String tehsil;
  final String village;
  final String applicationDate;
  final String entryBy;
  final String entryType;
  final String permitNo;
  final int permitId;
  final String permitType;
  final String purposeCategory;
  final String purpose;
  final String residingPeriodEst;
  final String residingPlace;
  final String residingLandmark;
  final String residingDistrict;
  final String residingPinCode;
  final String localResident;
  final String localResidentPhone;
  final String nearestPS;
  final SponsorInfo sponsorInfo;
  final AgencyInfo agencyInfo;
  final String applicantCategory;
  final String department;
  final String workPlace;
  final int gateID;
  final String gateName;
  final String issueDate;
  final String validDate;
  final int processingDistrictID;
  final String type;
  final String office;
  final String authority;
  final String authorityDesignation;
  final String issueBy;
  final bool status;
  final String revokeDate;
  final String revokeReason;
  final String revokeBy;
  final bool isExit;
  final String transitDate;
  final String transitGateID;
  final String transitAuthUser;

  InnerLinePermitUser({
    required this.id,
    required this.applicationNo,
    required this.name,
    required this.parentName,
    required this.idProof,
    required this.idNo,
    required this.gender,
    required this.dob,
    required this.idMark,
    required this.occupation,
    required this.photo,
    required this.signature,
    required this.idCard,
    required this.state,
    required this.policeStation,
    required this.district,
    required this.houseNo,
    required this.tehsil,
    required this.village,
    required this.applicationDate,
    required this.entryBy,
    required this.entryType,
    required this.permitNo,
    required this.permitId,
    required this.permitType,
    required this.purposeCategory,
    required this.purpose,
    required this.residingPeriodEst,
    required this.residingPlace,
    required this.residingLandmark,
    required this.residingDistrict,
    required this.residingPinCode,
    required this.localResident,
    required this.localResidentPhone,
    required this.nearestPS,
    required this.sponsorInfo,
    required this.agencyInfo,
    required this.applicantCategory,
    required this.department,
    required this.workPlace,
    required this.gateID,
    required this.gateName,
    required this.issueDate,
    required this.validDate,
    required this.processingDistrictID,
    required this.type,
    required this.office,
    required this.authority,
    required this.authorityDesignation,
    required this.issueBy,
    required this.status,
    required this.revokeDate,
    required this.revokeReason,
    required this.revokeBy,
    required this.isExit,
    required this.transitDate,
    required this.transitGateID,
    required this.transitAuthUser,
  });

  factory InnerLinePermitUser.fromJson(Map<String, dynamic> json) {
    return InnerLinePermitUser(
      id: json['id'],
      applicationNo: json['applicationNo'],
      name: json['name'],
      parentName: json['parentName'],
      idProof: json['idProof'],
      idNo: json['idNo'],
      gender: json['gender'],
      dob: json['dob'],
      idMark: json['idMark'],
      occupation: json['occupation'],
      photo: json['photo'],
      signature: json['signature'],
      idCard: json['idCard'],
      state: json['state'],
      policeStation: json['policeStation'],
      district: json['district'],
      houseNo: json['houseNo'],
      tehsil: json['tehsil'],
      village: json['village'],
      applicationDate: json['applicationDate'],
      entryBy: json['entryBy'],
      entryType: json['entryType'],
      permitNo: json['permitNo'],
      permitId: json['permitId'],
      permitType: json['permitType'],
      purposeCategory: json['purposeCategory'],
      purpose: json['purpose'],
      residingPeriodEst: json['residingPeriodEst'],
      residingPlace: json['residingPlace'],
      residingLandmark: json['residingLandmark'],
      residingDistrict: json['residingDistrict'],
      residingPinCode: json['residingPinCode'],
      localResident: json['localResident'],
      localResidentPhone: json['localResidentPhone'],
      nearestPS: json['nearestPS'],
      sponsorInfo: SponsorInfo.fromJson(json['sponsorInfo']),
      agencyInfo: AgencyInfo.fromJson(json['agencyInfo']),
      applicantCategory: json['applicantCategory'],
      department: json['department'],
      workPlace: json['workPlace'],
      gateID: json['gateID'],
      gateName: json['gateName'],
      issueDate: json['issueDate'],
      validDate: json['validDate'],
      processingDistrictID: json['processingDistrictID'],
      type: json['type'],
      office: json['office'],
      authority: json['authority'],
      authorityDesignation: json['authorityDesignation'],
      issueBy: json['issueBy'],
      status: json['status'],
      revokeDate: json['revokeDate'],
      revokeReason: json['revokeReason'],
      revokeBy: json['revokeBy'],
      isExit: json['isExit'],
      transitDate: json['transitDate'],
      transitGateID: json['transitGateID'],
      transitAuthUser: json['transitAuthUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'applicationNo': applicationNo,
      'name': name,
      'parentName': parentName,
      'idProof': idProof,
      'idNo': idNo,
      'gender': gender,
      'dob': dob,
      'idMark': idMark,
      'occupation': occupation,
      'photo': photo,
      'signature': signature,
      'idCard': idCard,
      'state': state,
      'policeStation': policeStation,
      'district': district,
      'houseNo': houseNo,
      'tehsil': tehsil,
      'village': village,
      'applicationDate': applicationDate,
      'entryBy': entryBy,
      'entryType': entryType,
      'permitNo': permitNo,
      'permitId': permitId,
      'permitType': permitType,
      'purposeCategory': purposeCategory,
      'purpose': purpose,
      'residingPeriodEst': residingPeriodEst,
      'residingPlace': residingPlace,
      'residingLandmark': residingLandmark,
      'residingDistrict': residingDistrict,
      'residingPinCode': residingPinCode,
      'localResident': localResident,
      'localResidentPhone': localResidentPhone,
      'nearestPS': nearestPS,
      'sponsorInfo': sponsorInfo.toJson(),
      'agencyInfo': agencyInfo.toJson(),
      'applicantCategory': applicantCategory,
      'department': department,
      'workPlace': workPlace,
      'gateID': gateID,
      'gateName': gateName,
      'issueDate': issueDate,
      'validDate': validDate,
      'processingDistrictID': processingDistrictID,
      'type': type,
      'office': office,
      'authority': authority,
      'authorityDesignation': authorityDesignation,
      'issueBy': issueBy,
      'status': status,
      'revokeDate': revokeDate,
      'revokeReason': revokeReason,
      'revokeBy': revokeBy,
      'isExit': isExit,
      'transitDate': transitDate,
      'transitGateID': transitGateID,
      'transitAuthUser': transitAuthUser,
    };
  }
}

class SponsorInfo {
  final String sponsorID;
  final String name;
  final String address;
  final String phone;
  final String department;

  SponsorInfo({
    required this.sponsorID,
    required this.name,
    required this.address,
    required this.phone,
    required this.department,
  });

  factory SponsorInfo.fromJson(Map<String, dynamic> json) {
    return SponsorInfo(
      sponsorID: json['sponsorID'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      department: json['department'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sponsorID': sponsorID,
      'name': name,
      'address': address,
      'phone': phone,
      'department': department,
    };
  }
}

class AgencyInfo {
  final String agencyID;
  final String name;
  final String address;
  final String phone;
  final String workName;
  final String workDuration;
  final String engagementPurpose;

  AgencyInfo({
    required this.agencyID,
    required this.name,
    required this.address,
    required this.phone,
    required this.workName,
    required this.workDuration,
    required this.engagementPurpose,
  });

  factory AgencyInfo.fromJson(Map<String, dynamic> json) {
    return AgencyInfo(
      agencyID: json['agencyID'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      workName: json['workName'],
      workDuration: json['workDuration'],
      engagementPurpose: json['engagementPurpose'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'agencyID': agencyID,
      'name': name,
      'address': address,
      'phone': phone,
      'workName': workName,
      'workDuration': workDuration,
      'engagementPurpose': engagementPurpose,
    };
  }
}