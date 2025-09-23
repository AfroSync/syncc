import 'package:afrosync/model/enums/license_terms.dart';

class LicenseModel {
  final String amount;
  final TermsModel terms;

  const LicenseModel({this.amount = '', TermsModel? terms})
    : terms = terms ?? const TermsModel();

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'terms': terms.toJson()};
  }

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      amount: json['amount'] as String? ?? '',
      terms: json['terms'] != null
          ? TermsModel.fromJson(json['terms'] as Map<String, dynamic>)
          : const TermsModel(),
    );
  }

  LicenseModel copyWith({String? amount, TermsModel? terms}) {
    return LicenseModel(
      amount: amount ?? this.amount,
      terms: terms ?? this.terms,
    );
  }

  @override
  String toString() {
    return 'LicenseModel(amount: $amount, terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LicenseModel &&
        other.amount == amount &&
        other.terms == terms;
  }

  @override
  int get hashCode {
    return amount.hashCode ^ terms.hashCode;
  }
}

class TermsModel {
  final List<PaymentPresets> paymentPresets;
  final List<TerritoryPresets> territoryPresets;
  final List<ExclusivityPresets> exclusivityPresets;
  final List<UsageRightsPresets> usageRightsPresets;
  final List<PerformingRightsPresets> performingRightsPresets;
  final List<ApprovalLevels> approvalLevels;
  final List<CreditPresets> creditPresets;
  final List<ModificationLevels> modificationLevels;
  final List<RenewalOptions> renewalOptions;
  final List<TerminationTriggers> terminationTriggers;

  const TermsModel({
    this.paymentPresets = const [],
    this.territoryPresets = const [],
    this.exclusivityPresets = const [],
    this.usageRightsPresets = const [],
    this.performingRightsPresets = const [],
    this.approvalLevels = const [],
    this.creditPresets = const [],
    this.modificationLevels = const [],
    this.renewalOptions = const [],
    this.terminationTriggers = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'paymentPresets': paymentPresets.map((e) => e.categoryName).toList(),
      'territoryPresets': territoryPresets.map((e) => e.categoryName).toList(),
      'exclusivityPresets': exclusivityPresets
          .map((e) => e.categoryName)
          .toList(),
      'usageRightsPresets': usageRightsPresets
          .map((e) => e.categoryName)
          .toList(),
      'performingRightsPresets': performingRightsPresets
          .map((e) => e.categoryName)
          .toList(),
      'approvalLevels': approvalLevels.map((e) => e.categoryName).toList(),
      'creditPresets': creditPresets.map((e) => e.categoryName).toList(),
      'modificationLevels': modificationLevels
          .map((e) => e.categoryName)
          .toList(),
      'renewalOptions': renewalOptions.map((e) => e.categoryName).toList(),
      'terminationTriggers': terminationTriggers
          .map((e) => e.categoryName)
          .toList(),
    };
  }

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      paymentPresets:
          (json['paymentPresets'] as List<dynamic>?)
              ?.map((e) => PaymentPresets())
              .toList() ??
          const [],
      territoryPresets:
          (json['territoryPresets'] as List<dynamic>?)
              ?.map((e) => TerritoryPresets())
              .toList() ??
          const [],
      exclusivityPresets:
          (json['exclusivityPresets'] as List<dynamic>?)
              ?.map((e) => ExclusivityPresets())
              .toList() ??
          const [],
      usageRightsPresets:
          (json['usageRightsPresets'] as List<dynamic>?)
              ?.map((e) => UsageRightsPresets())
              .toList() ??
          const [],
      performingRightsPresets:
          (json['performingRightsPresets'] as List<dynamic>?)
              ?.map((e) => PerformingRightsPresets())
              .toList() ??
          const [],
      approvalLevels:
          (json['approvalLevels'] as List<dynamic>?)
              ?.map((e) => ApprovalLevels())
              .toList() ??
          const [],
      creditPresets:
          (json['creditPresets'] as List<dynamic>?)
              ?.map((e) => CreditPresets())
              .toList() ??
          const [],
      modificationLevels:
          (json['modificationLevels'] as List<dynamic>?)
              ?.map((e) => ModificationLevels())
              .toList() ??
          const [],
      renewalOptions:
          (json['renewalOptions'] as List<dynamic>?)
              ?.map((e) => RenewalOptions())
              .toList() ??
          const [],
      terminationTriggers:
          (json['terminationTriggers'] as List<dynamic>?)
              ?.map((e) => TerminationTriggers())
              .toList() ??
          const [],
    );
  }

  TermsModel copyWith({
    List<PaymentPresets>? paymentPresets,
    List<TerritoryPresets>? territoryPresets,
    List<ExclusivityPresets>? exclusivityPresets,
    List<UsageRightsPresets>? usageRightsPresets,
    List<PerformingRightsPresets>? performingRightsPresets,
    List<ApprovalLevels>? approvalLevels,
    List<CreditPresets>? creditPresets,
    List<ModificationLevels>? modificationLevels,
    List<RenewalOptions>? renewalOptions,
    List<TerminationTriggers>? terminationTriggers,
  }) {
    return TermsModel(
      paymentPresets: paymentPresets ?? this.paymentPresets,
      territoryPresets: territoryPresets ?? this.territoryPresets,
      exclusivityPresets: exclusivityPresets ?? this.exclusivityPresets,
      usageRightsPresets: usageRightsPresets ?? this.usageRightsPresets,
      performingRightsPresets:
          performingRightsPresets ?? this.performingRightsPresets,
      approvalLevels: approvalLevels ?? this.approvalLevels,
      creditPresets: creditPresets ?? this.creditPresets,
      modificationLevels: modificationLevels ?? this.modificationLevels,
      renewalOptions: renewalOptions ?? this.renewalOptions,
      terminationTriggers: terminationTriggers ?? this.terminationTriggers,
    );
  }

  @override
  String toString() {
    return 'TermsModel(paymentPresets: $paymentPresets, territoryPresets: $territoryPresets, exclusivityPresets: $exclusivityPresets, usageRightsPresets: $usageRightsPresets, performingRightsPresets: $performingRightsPresets, approvalLevels: $approvalLevels, creditPresets: $creditPresets, modificationLevels: $modificationLevels, renewalOptions: $renewalOptions, terminationTriggers: $terminationTriggers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TermsModel &&
        other.paymentPresets == paymentPresets &&
        other.territoryPresets == territoryPresets &&
        other.exclusivityPresets == exclusivityPresets &&
        other.usageRightsPresets == usageRightsPresets &&
        other.performingRightsPresets == performingRightsPresets &&
        other.approvalLevels == approvalLevels &&
        other.creditPresets == creditPresets &&
        other.modificationLevels == modificationLevels &&
        other.renewalOptions == renewalOptions &&
        other.terminationTriggers == terminationTriggers;
  }

  @override
  int get hashCode {
    return paymentPresets.hashCode ^
        territoryPresets.hashCode ^
        exclusivityPresets.hashCode ^
        usageRightsPresets.hashCode ^
        performingRightsPresets.hashCode ^
        approvalLevels.hashCode ^
        creditPresets.hashCode ^
        modificationLevels.hashCode ^
        renewalOptions.hashCode ^
        terminationTriggers.hashCode;
  }
}
