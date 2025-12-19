import 'package:taraz_package_sample/src/core/enums/lead_status.dart';

class VMLead {
  final String? publicId;
  final DateTime? createdDate;
  final String? emoji;
  final String? employeeId;
  final String? processCategoryId;
  final String? processId;
  final String? processCategoryName;
  final String? processName;
  final String? title;
  final String? processStepId;
  final String? processStepName;
  final String? importantNote;
  final String? lastOpinion;
  final int? processStepOrder;
  final int? processStepsCount;
  final double? probabilityOfSuccess;
  final int? activitiesCount;
  final int? activitySuccessCount;
  final LeadStatus? successStatus;

  VMLead({
    this.publicId,
    this.createdDate,
    this.emoji,
    this.employeeId,
    this.processCategoryId,
    this.processId,
    this.processCategoryName,
    this.processName,
    this.title,
    this.processStepId,
    this.processStepName,
    this.importantNote,
    this.lastOpinion,
    this.processStepOrder,
    this.processStepsCount,
    this.probabilityOfSuccess,
    this.activitiesCount,
    this.activitySuccessCount,
    this.successStatus,
  });

  factory VMLead.fromJson(Map<String, dynamic> json) => VMLead(
    publicId: json['publicId'],
    createdDate: DateTime.parse(json['createdDate']),
    emoji: json['emoji'],
    employeeId: json['employeeId'],
    processCategoryId: json['processCategoryId'],
    processId: json['processId'],
    processCategoryName: json['processCategoryName'],
    processName: json['processName'],
    title: json['title'],
    processStepId: json['processStepId'],
    processStepName: json['processStepName'],
    importantNote: json['importantNote'],
    lastOpinion: json['lastOpinion'],
    processStepOrder: json['processStepOrder'],
    processStepsCount: json['processStepsCount'],
    probabilityOfSuccess: (json['probabilityOfSuccess'] as num?)?.toDouble(),
    activitiesCount: json['activitiesCount'],
    activitySuccessCount: json['activitySuccessCount'],
    successStatus: LeadStatus.fromJson(json['successStatus']),
  );

  Map<String, dynamic> toJson() => {
    'publicId': publicId,
    'createdDate': createdDate?.toIso8601String(),
    'emoji': emoji,
    'employeeId': employeeId,
    'processCategoryId': processCategoryId,
    'processId': processId,
    'processCategoryName': processCategoryName,
    'processName': processName,
    'title': title,
    'processStepId': processStepId,
    'processStepName': processStepName,
    'importantNote': importantNote,
    'lastOpinion': lastOpinion,
    'processStepOrder': processStepOrder,
    'processStepsCount': processStepsCount,
    'probabilityOfSuccess': probabilityOfSuccess,
    'activitiesCount': activitiesCount,
    'activitySuccessCount': activitySuccessCount,
    'successStatus': successStatus?.toJson(),
  };

  VMLead copyWith({
    String? publicId,
    DateTime? createdDate,
    String? emoji,
    String? employeeId,
    String? processCategoryId,
    String? processId,
    String? processCategoryName,
    String? processName,
    String? title,
    String? processStepId,
    String? processStepName,
    String? importantNote,
    String? lastOpinion,
    int? processStepOrder,
    int? processStepsCount,
    double? probabilityOfSuccess,
    int? activitiesCount,
    int? activitySuccessCount,
    LeadStatus? successStatus,
  }) => VMLead(
    publicId: publicId ?? this.publicId,
    createdDate: createdDate ?? this.createdDate,
    emoji: emoji ?? this.emoji,
    employeeId: employeeId ?? this.employeeId,
    processCategoryId: processCategoryId ?? this.processCategoryId,
    processId: processId ?? this.processId,
    processCategoryName: processCategoryName ?? this.processCategoryName,
    processName: processName ?? this.processName,
    title: title ?? this.title,
    processStepId: processStepId ?? this.processStepId,
    processStepName: processStepName ?? this.processStepName,
    importantNote: importantNote ?? this.importantNote,
    lastOpinion: lastOpinion ?? this.lastOpinion,
    processStepOrder: processStepOrder ?? this.processStepOrder,
    processStepsCount: processStepsCount ?? this.processStepsCount,
    probabilityOfSuccess: probabilityOfSuccess ?? this.probabilityOfSuccess,
    activitiesCount: activitiesCount ?? this.activitiesCount,
    activitySuccessCount: activitySuccessCount ?? this.activitySuccessCount,
    successStatus: successStatus ?? this.successStatus,
  );

  @override
  dynamic getCustomFieldValue(String fieldName) {
    switch (fieldName) {
      case 'employeeId':
        return employeeId;
      case 'processCategoryId':
        return processCategoryId;
      case 'processId':
        return processId;
      case 'title':
        return title;
      case 'processName':
        return processName;
      case 'processCategoryName':
        return processCategoryName;
      case 'processStepId':
        return processStepId;
      case 'processStepName':
        return processStepName;
      case 'importantNote':
        return importantNote;
      case 'processStepOrder':
        return processStepOrder;
      case 'processStepsCount':
        return processStepsCount;
      case 'probabilityOfSuccess':
        return probabilityOfSuccess;
      case 'successStatus':
        return successStatus?.name;
      case 'activitiesCount':
        return activitiesCount;
      case 'activitySuccessCount':
        return activitySuccessCount;
      // case 'employee':
      //   return employee?.fullName;
      // case 'personHowKnowName':
      //   return person?.howKnow?.name;
      // case 'personGender':
      //   return person?.getCustomFieldValue('Gender');
      // case 'personFirstName':
      //   return person?.firstName;
      // case 'personLastName':
      //   return person?.lastName;
      // case 'personDefinitiveName':
      //   return person?.definitiveName;
      // case 'personLegalType':
      //   return person?.legalType?.name;
      // case 'personCompanyName':
      //   return person?.companyName;
      // case 'personCountry':
      //   return person?.country?.name;
      // case 'personState':
      //   return person?.state?.name;
      // case 'personCity':
      //   return person?.city?.name;
      // case 'personIndustryName':
      //   return person?.industry?.name;
      // case 'personTel':
      //   return person?.getCustomFieldValue('PersonContacts.Tel');
      // case 'personMobile':
      //   return person?.getCustomFieldValue('PersonContacts.Mobile');
      // case 'personEmail':
      //   return person?.getCustomFieldValue('PersonContacts.Email');
      // case 'personSite':
      //   return person?.getCustomFieldValue('PersonContacts.Site');
      // case 'personFax':
      //   return person?.getCustomFieldValue('PersonContacts.Fax');
      // case 'personBirthDate':
      //   return person?.birthdate;
      // case 'personNationalCode':
      //   return person?.nationalCode;
      // case 'personZipCode':
      //   return person?.zipCode;
      // case 'personAddress':
      //   return person?.address;
      default:
        return null;
    }
  }
}
