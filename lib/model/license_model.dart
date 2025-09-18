// Base enums for common license parameters
enum LicenseType { exclusive, nonExclusive, semiExclusive }

class LicenseModel {}

enum Territory {
  nigeria('Nigeria'),
  westAfrica('West Africa'),
  africa('Africa'),
  worldwide('Worldwide'),
  custom('Custom');

  const Territory(this.displayName);

  final String displayName;
}

enum Currency {
  ngn('NGN'),
  usd('USD'),
  eur('EUR');

  const Currency(this.displayName);

  final String displayName;
}

enum PaymentMethod {
  bankTransfer('Bank Transfer'),
  mobileMoney('Mobile Money'),
  cryptocurrency('Cryptocurrency'),
  escrow('Escrow Service'),
  paypal('PayPal'),
  flutterwave('Flutterwave');

  const PaymentMethod(this.displayName);

  final String displayName;
}

enum UsageType {
  filmScore('Film Score/Soundtrack'),
  backgroundMusic('Background Music'),
  openingCredits('Opening Credits'),
  closingCredits('Closing Credits'),
  trailer('Trailer/Promotional'),
  advertising('Commercial/Advertising'),
  streaming('Streaming Platforms'),
  broadcast('TV/Radio Broadcast'),
  livePerformance('Live Performance'),
  podcast('Podcast/Audio Content');

  const UsageType(this.displayName);

  final String displayName;
}

enum ProductionType {
  independent('Independent Film'),
  commercial('Commercial Film'),
  documentary('Documentary'),
  shortFilm('Short Film'),
  webSeries('Web Series'),
  tvSeries('TV Series'),
  advertisement('Advertisement'),
  corporateVideo('Corporate Video'),
  musicVideo('Music Video'),
  podcast('Podcast'),
  game('Video Game'),
  app('Mobile App');

  const ProductionType(this.displayName);

  final String displayName;
}

enum ComposerExperienceLevel {
  beginner('0-2 years'),
  intermediate('3-5 years'),
  experienced('6-10 years'),
  expert('10+ years');

  const ComposerExperienceLevel(this.displayName);

  final String displayName;
}

enum ProjectUrgency {
  standard('Standard (4-6 weeks)'),
  rush('Rush (2-3 weeks)'),
  emergency('Emergency (1 week)');

  const ProjectUrgency(this.displayName);

  final String displayName;
}

enum RoyaltyBasis {
  netReceipts('Net Receipts'),
  grossReceipts('Gross Receipts'),
  distributorReceipts('Distributor Receipts'),
  noRoyalties('No Ongoing Royalties');

  const RoyaltyBasis(this.displayName);

  final String displayName;
}

enum PaymentSchedule {
  upfront('100% Upfront'),
  fiftyFifty('50% Upfront, 50% on Completion'),
  threePhase('30% Upfront, 40% Midway, 30% Final'),
  quarterly('Quarterly Payments'),
  monthly('Monthly Payments');

  const PaymentSchedule(this.displayName);

  final String displayName;
}

enum ModificationRights {
  none('No Modifications Allowed'),
  basicEditing('Basic Editing (Length, Volume)'),
  fullEditing('Full Editing Rights'),
  withApproval('With Prior Approval');

  const ModificationRights(this.displayName);

  final String displayName;
}

// Value objects for reusable components
class ContactInfo {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String? companyName;
  final String? registrationNumber;
  final String? bvn;

  const ContactInfo({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.companyName,
    this.registrationNumber,
    this.bvn,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'companyName': companyName,
      'registrationNumber': registrationNumber,
      'bvn': bvn,
    };
  }

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      companyName: json['companyName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      bvn: json['bvn'] as String?,
    );
  }
}

class PaymentTerms {
  final double amount;
  final Currency currency;
  final PaymentMethod method;
  final PaymentSchedule schedule;
  final double? royaltyRate;
  final RoyaltyBasis? royaltyBasis;
  final int paymentDueDays;
  final double? latePaymentInterest;
  final Map<String, String>? bankDetails;

  const PaymentTerms({
    required this.amount,
    required this.currency,
    required this.method,
    required this.schedule,
    this.royaltyRate,
    this.royaltyBasis,
    this.paymentDueDays = 14,
    this.latePaymentInterest,
    this.bankDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency.name,
      'method': method.name,
      'schedule': schedule.name,
      'royaltyRate': royaltyRate,
      'royaltyBasis': royaltyBasis?.name,
      'paymentDueDays': paymentDueDays,
      'latePaymentInterest': latePaymentInterest,
      'bankDetails': bankDetails,
    };
  }
}

class MusicalWork {
  final String title;
  final String? artist;
  final Duration duration;
  final String genre;
  final List<String> tags;
  final String? description;
  final String? audioFileUrl;
  final String? coverArtUrl;
  final DateTime? releaseDate;
  final String? isrc; // International Standard Recording Code
  final String? mcsn; // Musical Copyright Society Nigeria registration

  const MusicalWork({
    required this.title,
    this.artist,
    required this.duration,
    required this.genre,
    this.tags = const [],
    this.description,
    this.audioFileUrl,
    this.coverArtUrl,
    this.releaseDate,
    this.isrc,
    this.mcsn,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'duration': duration.inSeconds,
      'genre': genre,
      'tags': tags,
      'description': description,
      'audioFileUrl': audioFileUrl,
      'coverArtUrl': coverArtUrl,
      'releaseDate': releaseDate?.toIso8601String(),
      'isrc': isrc,
      'mcsn': mcsn,
    };
  }
}

class ProjectRequirements {
  final String projectTitle;
  final ProductionType productionType;
  final String genre;
  final List<UsageType> usageTypes;
  final String? description;
  final DateTime? deadline;
  final ProjectUrgency urgency;
  final Map<String, dynamic>? customRequirements;

  const ProjectRequirements({
    required this.projectTitle,
    required this.productionType,
    required this.genre,
    required this.usageTypes,
    this.description,
    this.deadline,
    this.urgency = ProjectUrgency.standard,
    this.customRequirements,
  });

  Map<String, dynamic> toJson() {
    return {
      'projectTitle': projectTitle,
      'productionType': productionType.name,
      'genre': genre,
      'usageTypes': usageTypes.map((e) => e.name).toList(),
      'description': description,
      'deadline': deadline?.toIso8601String(),
      'urgency': urgency.name,
      'customRequirements': customRequirements,
    };
  }
}

// Base license class - superclass for all license types
abstract class BaseLicense {
  final String id;
  final DateTime createdAt;
  final DateTime effectiveDate;
  final DateTime? expirationDate;
  final ContactInfo licensor;
  final ContactInfo licensee;
  final LicenseType licenseType;
  final Territory territory;
  final List<String> customTerritories;
  final PaymentTerms paymentTerms;
  final ModificationRights modificationRights;
  final String creditFormat;
  final bool moralRightsRetained;
  final Map<String, dynamic> customClauses;

  const BaseLicense({
    required this.id,
    required this.createdAt,
    required this.effectiveDate,
    this.expirationDate,
    required this.licensor,
    required this.licensee,
    required this.licenseType,
    required this.territory,
    this.customTerritories = const [],
    required this.paymentTerms,
    this.modificationRights = ModificationRights.basicEditing,
    required this.creditFormat,
    this.moralRightsRetained = true,
    this.customClauses = const {},
  });

  Map<String, dynamic> toBaseJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'effectiveDate': effectiveDate.toIso8601String(),
      'expirationDate': expirationDate?.toIso8601String(),
      'licensor': licensor.toJson(),
      'licensee': licensee.toJson(),
      'licenseType': licenseType.name,
      'territory': territory.name,
      'customTerritories': customTerritories,
      'paymentTerms': paymentTerms.toJson(),
      'modificationRights': modificationRights.name,
      'creditFormat': creditFormat,
      'moralRightsRetained': moralRightsRetained,
      'customClauses': customClauses,
    };
  }

  // Abstract methods to be implemented by subclasses
  Map<String, dynamic> toJson();

  String generateContract();
}

// Synchronization License for existing music
class SynchronizationLicense extends BaseLicense {
  final MusicalWork musicalWork;
  final ProjectRequirements projectRequirements;
  final List<UsageType> rightsGranted;
  final bool publicPerformanceIncluded;
  final bool streamingRightsIncluded;
  final bool internationalDistribution;
  final List<String> excludedPlatforms;

  const SynchronizationLicense({
    required super.id,
    required super.createdAt,
    required super.effectiveDate,
    super.expirationDate,
    required super.licensor,
    required super.licensee,
    required super.licenseType,
    required super.territory,
    super.customTerritories,
    required super.paymentTerms,
    super.modificationRights,
    required super.creditFormat,
    super.moralRightsRetained,
    super.customClauses,
    required this.musicalWork,
    required this.projectRequirements,
    required this.rightsGranted,
    this.publicPerformanceIncluded = true,
    this.streamingRightsIncluded = true,
    this.internationalDistribution = false,
    this.excludedPlatforms = const [],
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      ...toBaseJson(),
      'licenseSubtype': 'synchronization',
      'musicalWork': musicalWork.toJson(),
      'projectRequirements': projectRequirements.toJson(),
      'rightsGranted': rightsGranted.map((e) => e.name).toList(),
      'publicPerformanceIncluded': publicPerformanceIncluded,
      'streamingRightsIncluded': streamingRightsIncluded,
      'internationalDistribution': internationalDistribution,
      'excludedPlatforms': excludedPlatforms,
    };
  }

  @override
  String generateContract() {
    // Return template key or contract content
    return 'SYNC_LICENSE_TEMPLATE';
  }
}

// Composition requirements for custom music creation
class CompositionRequirements {
  final int numberOfTracks;
  final Map<String, int>
  trackBreakdown; // e.g., {"opening_theme": 1, "background": 5}
  final Map<String, String> styleRequirements;
  final List<String> requiredInstruments;
  final List<String> culturalElements;
  final bool liveRecordingRequired;
  final Map<String, String> technicalSpecs;
  final List<DateTime> deliveryMilestones;

  const CompositionRequirements({
    required this.numberOfTracks,
    this.trackBreakdown = const {},
    this.styleRequirements = const {},
    this.requiredInstruments = const [],
    this.culturalElements = const [],
    this.liveRecordingRequired = false,
    this.technicalSpecs = const {},
    this.deliveryMilestones = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'numberOfTracks': numberOfTracks,
      'trackBreakdown': trackBreakdown,
      'styleRequirements': styleRequirements,
      'requiredInstruments': requiredInstruments,
      'culturalElements': culturalElements,
      'liveRecordingRequired': liveRecordingRequired,
      'technicalSpecs': technicalSpecs,
      'deliveryMilestones': deliveryMilestones
          .map((e) => e.toIso8601String())
          .toList(),
    };
  }
}

// Custom Composition Contract for commissioned work
class CustomCompositionContract extends BaseLicense {
  final CompositionRequirements compositionRequirements;
  final ProjectRequirements projectRequirements;
  final ComposerExperienceLevel requiredExperience;
  final bool workForHire; // True means client owns everything
  final double revisionLimit;
  final double additionalRevisionFee;
  final bool publishingRightsIncluded;
  final bool performanceRoyaltiesIncluded;
  final List<String> deliverableFormats;
  final Map<String, double> milestonePayments;

  const CustomCompositionContract({
    required super.id,
    required super.createdAt,
    required super.effectiveDate,
    super.expirationDate,
    required super.licensor,
    required super.licensee,
    required super.licenseType,
    required super.territory,
    super.customTerritories,
    required super.paymentTerms,
    super.modificationRights,
    required super.creditFormat,
    super.moralRightsRetained,
    super.customClauses,
    required this.compositionRequirements,
    required this.projectRequirements,
    this.requiredExperience = ComposerExperienceLevel.intermediate,
    this.workForHire = true,
    this.revisionLimit = 3.0,
    this.additionalRevisionFee = 15000.0,
    this.publishingRightsIncluded = true,
    this.performanceRoyaltiesIncluded = false,
    this.deliverableFormats = const ['WAV', 'MP3'],
    this.milestonePayments = const {},
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      ...toBaseJson(),
      'licenseSubtype': 'custom_composition',
      'compositionRequirements': compositionRequirements.toJson(),
      'projectRequirements': projectRequirements.toJson(),
      'requiredExperience': requiredExperience.name,
      'workForHire': workForHire,
      'revisionLimit': revisionLimit,
      'additionalRevisionFee': additionalRevisionFee,
      'publishingRightsIncluded': publishingRightsIncluded,
      'performanceRoyaltiesIncluded': performanceRoyaltiesIncluded,
      'deliverableFormats': deliverableFormats,
      'milestonePayments': milestonePayments,
    };
  }

  @override
  String generateContract() {
    return 'CUSTOM_COMPOSITION_TEMPLATE';
  }
}

// Factory class for creating different license types
class LicenseFactory {
  static BaseLicense createLicense({
    required String type,
    required Map<String, dynamic> data,
  }) {
    switch (type.toLowerCase()) {
      case 'synchronization':
      case 'sync':
        return SynchronizationLicense(
          id: data['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
          createdAt: DateTime.parse(
            data['createdAt'] ?? DateTime.now().toIso8601String(),
          ),
          effectiveDate: DateTime.parse(data['effectiveDate']),
          expirationDate: data['expirationDate'] != null
              ? DateTime.parse(data['expirationDate'])
              : null,
          licensor: ContactInfo.fromJson(data['licensor']),
          licensee: ContactInfo.fromJson(data['licensee']),
          licenseType: LicenseType.values.byName(data['licenseType']),
          territory: Territory.values.byName(data['territory']),
          paymentTerms: PaymentTerms(
            amount: data['paymentTerms']['amount'].toDouble(),
            currency: Currency.values.byName(data['paymentTerms']['currency']),
            method: PaymentMethod.values.byName(data['paymentTerms']['method']),
            schedule: PaymentSchedule.values.byName(
              data['paymentTerms']['schedule'],
            ),
          ),
          creditFormat: data['creditFormat'],
          musicalWork: MusicalWork(
            title: data['musicalWork']['title'],
            duration: Duration(seconds: data['musicalWork']['duration']),
            genre: data['musicalWork']['genre'],
          ),
          projectRequirements: ProjectRequirements(
            projectTitle: data['projectRequirements']['projectTitle'],
            productionType: ProductionType.values.byName(
              data['projectRequirements']['productionType'],
            ),
            genre: data['projectRequirements']['genre'],
            usageTypes: (data['projectRequirements']['usageTypes'] as List)
                .map((e) => UsageType.values.byName(e))
                .toList(),
          ),
          rightsGranted: (data['rightsGranted'] as List)
              .map((e) => UsageType.values.byName(e))
              .toList(),
        );

      case 'custom_composition':
      case 'composition':
        return CustomCompositionContract(
          id: data['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
          createdAt: DateTime.parse(
            data['createdAt'] ?? DateTime.now().toIso8601String(),
          ),
          effectiveDate: DateTime.parse(data['effectiveDate']),
          expirationDate: data['expirationDate'] != null
              ? DateTime.parse(data['expirationDate'])
              : null,
          licensor: ContactInfo.fromJson(data['licensor']),
          licensee: ContactInfo.fromJson(data['licensee']),
          licenseType: LicenseType.values.byName(data['licenseType']),
          territory: Territory.values.byName(data['territory']),
          paymentTerms: PaymentTerms(
            amount: data['paymentTerms']['amount'].toDouble(),
            currency: Currency.values.byName(data['paymentTerms']['currency']),
            method: PaymentMethod.values.byName(data['paymentTerms']['method']),
            schedule: PaymentSchedule.values.byName(
              data['paymentTerms']['schedule'],
            ),
          ),
          creditFormat: data['creditFormat'],
          compositionRequirements: CompositionRequirements(
            numberOfTracks: data['compositionRequirements']['numberOfTracks'],
            trackBreakdown: Map<String, int>.from(
              data['compositionRequirements']['trackBreakdown'] ?? {},
            ),
          ),
          projectRequirements: ProjectRequirements(
            projectTitle: data['projectRequirements']['projectTitle'],
            productionType: ProductionType.values.byName(
              data['projectRequirements']['productionType'],
            ),
            genre: data['projectRequirements']['genre'],
            usageTypes: (data['projectRequirements']['usageTypes'] as List)
                .map((e) => UsageType.values.byName(e))
                .toList(),
          ),
        );

      default:
        throw ArgumentError('Unknown license type: $type');
    }
  }
}

// Helper class for license validation
class LicenseValidator {
  static List<String> validateSyncLicense(SynchronizationLicense license) {
    List<String> errors = [];

    if (license.musicalWork.title.isEmpty) {
      errors.add('Musical work title is required');
    }

    if (license.paymentTerms.amount <= 0) {
      errors.add('Payment amount must be greater than 0');
    }

    if (license.effectiveDate.isAfter(
      license.expirationDate ?? DateTime.now().add(Duration(days: 365)),
    )) {
      errors.add('Effective date cannot be after expiration date');
    }

    return errors;
  }

  static List<String> validateCompositionContract(
    CustomCompositionContract contract,
  ) {
    List<String> errors = [];

    if (contract.compositionRequirements.numberOfTracks <= 0) {
      errors.add('Number of tracks must be greater than 0');
    }

    if (contract.paymentTerms.amount <= 0) {
      errors.add('Payment amount must be greater than 0');
    }

    if (contract.revisionLimit < 1) {
      errors.add('Revision limit must be at least 1');
    }

    return errors;
  }
}
