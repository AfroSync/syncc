// Base enums for common license parameters
// enum LicenseType { exclusive, nonExclusive, semiExclusive }
//
//
//
// enum Territory {
//   nigeria('Nigeria'),
//   westAfrica('West Africa'),
//   africa('Africa'),
//   worldwide('Worldwide'),
//   custom('Custom');
//
//   const Territory(this.displayName);
//
//   final String displayName;
// }
//
// enum Currency {
//   ngn('NGN'),
//   usd('USD'),
//   eur('EUR');
//
//   const Currency(this.displayName);
//
//   final String displayName;
// }
//
// enum PaymentMethod {
//   bankTransfer('Bank Transfer'),
//   mobileMoney('Mobile Money'),
//   cryptocurrency('Cryptocurrency'),
//   escrow('Escrow Service'),
//   paypal('PayPal'),
//   flutterwave('Flutterwave');
//
//   const PaymentMethod(this.displayName);
//
//   final String displayName;
// }
//
// enum UsageType {
//   filmScore('Film Score/Soundtrack'),
//   backgroundMusic('Background Music'),
//   openingCredits('Opening Credits'),
//   closingCredits('Closing Credits'),
//   trailer('Trailer/Promotional'),
//   advertising('Commercial/Advertising'),
//   streaming('Streaming Platforms'),
//   broadcast('TV/Radio Broadcast'),
//   livePerformance('Live Performance'),
//   podcast('Podcast/Audio Content');
//
//   const UsageType(this.displayName);
//
//   final String displayName;
// }
//
// enum ProductionType {
//   independent('Independent Film'),
//   commercial('Commercial Film'),
//   documentary('Documentary'),
//   shortFilm('Short Film'),
//   webSeries('Web Series'),
//   tvSeries('TV Series'),
//   advertisement('Advertisement'),
//   corporateVideo('Corporate Video'),
//   musicVideo('Music Video'),
//   podcast('Podcast'),
//   game('Video Game'),
//   app('Mobile App');
//
//   const ProductionType(this.displayName);
//
//   final String displayName;
// }
//
// enum ComposerExperienceLevel {
//   beginner('0-2 years'),
//   intermediate('3-5 years'),
//   experienced('6-10 years'),
//   expert('10+ years');
//
//   const ComposerExperienceLevel(this.displayName);
//
//   final String displayName;
// }
//
// enum ProjectUrgency {
//   standard('Standard (4-6 weeks)'),
//   rush('Rush (2-3 weeks)'),
//   emergency('Emergency (1 week)');
//
//   const ProjectUrgency(this.displayName);
//
//   final String displayName;
// }
//
// enum RoyaltyBasis {
//   netReceipts('Net Receipts'),
//   grossReceipts('Gross Receipts'),
//   distributorReceipts('Distributor Receipts'),
//   noRoyalties('No Ongoing Royalties');
//
//   const RoyaltyBasis(this.displayName);
//
//   final String displayName;
// }
//
// enum PaymentSchedule {
//   upfront('100% Upfront'),
//   fiftyFifty('50% Upfront, 50% on Completion'),
//   threePhase('30% Upfront, 40% Midway, 30% Final'),
//   quarterly('Quarterly Payments'),
//   monthly('Monthly Payments');
//
//   const PaymentSchedule(this.displayName);
//
//   final String displayName;
// }
//
// enum ModificationRights {
//   none('No Modifications Allowed'),
//   basicEditing('Basic Editing (Length, Volume)'),
//   fullEditing('Full Editing Rights'),
//   withApproval('With Prior Approval');
//
//   const ModificationRights(this.displayName);
//
//   final String displayName;
// }
//
// // Value objects for reusable components
// class ContactInfo {
//   final String name;
//   final String email;
//   final String phone;
//   final String address;
//   final String? companyName;
//   final String? registrationNumber;
//   final String? bvn;
//
//   const ContactInfo({
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.address,
//     this.companyName,
//     this.registrationNumber,
//     this.bvn,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'address': address,
//       'companyName': companyName,
//       'registrationNumber': registrationNumber,
//       'bvn': bvn,
//     };
//   }
//
//   factory ContactInfo.fromJson(Map<String, dynamic> json) {
//     return ContactInfo(
//       name: json['name'] as String,
//       email: json['email'] as String,
//       phone: json['phone'] as String,
//       address: json['address'] as String,
//       companyName: json['companyName'] as String?,
//       registrationNumber: json['registrationNumber'] as String?,
//       bvn: json['bvn'] as String?,
//     );
//   }
// }
//
// class PaymentTerms {
//   final double amount;
//   final Currency currency;
//   final PaymentMethod method;
//   final PaymentSchedule schedule;
//   final double? royaltyRate;
//   final RoyaltyBasis? royaltyBasis;
//   final int paymentDueDays;
//   final double? latePaymentInterest;
//   final Map<String, String>? bankDetails;
//
//   const PaymentTerms({
//     required this.amount,
//     required this.currency,
//     required this.method,
//     required this.schedule,
//     this.royaltyRate,
//     this.royaltyBasis,
//     this.paymentDueDays = 14,
//     this.latePaymentInterest,
//     this.bankDetails,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'amount': amount,
//       'currency': currency.name,
//       'method': method.name,
//       'schedule': schedule.name,
//       'royaltyRate': royaltyRate,
//       'royaltyBasis': royaltyBasis?.name,
//       'paymentDueDays': paymentDueDays,
//       'latePaymentInterest': latePaymentInterest,
//       'bankDetails': bankDetails,
//     };
//   }
// }
//
// class MusicalWork {
//   final String title;
//   final String? artist;
//   final Duration duration;
//   final String genre;
//   final List<String> tags;
//   final String? description;
//   final String? audioFileUrl;
//   final String? coverArtUrl;
//   final DateTime? releaseDate;
//   final String? isrc; // International Standard Recording Code
//   final String? mcsn; // Musical Copyright Society Nigeria registration
//
//   const MusicalWork({
//     required this.title,
//     this.artist,
//     required this.duration,
//     required this.genre,
//     this.tags = const [],
//     this.description,
//     this.audioFileUrl,
//     this.coverArtUrl,
//     this.releaseDate,
//     this.isrc,
//     this.mcsn,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'artist': artist,
//       'duration': duration.inSeconds,
//       'genre': genre,
//       'tags': tags,
//       'description': description,
//       'audioFileUrl': audioFileUrl,
//       'coverArtUrl': coverArtUrl,
//       'releaseDate': releaseDate?.toIso8601String(),
//       'isrc': isrc,
//       'mcsn': mcsn,
//     };
//   }
// }
//
// class ProjectRequirements {
//   final String projectTitle;
//   final ProductionType productionType;
//   final String genre;
//   final List<UsageType> usageTypes;
//   final String? description;
//   final DateTime? deadline;
//   final ProjectUrgency urgency;
//   final Map<String, dynamic>? customRequirements;
//
//   const ProjectRequirements({
//     required this.projectTitle,
//     required this.productionType,
//     required this.genre,
//     required this.usageTypes,
//     this.description,
//     this.deadline,
//     this.urgency = ProjectUrgency.standard,
//     this.customRequirements,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'projectTitle': projectTitle,
//       'productionType': productionType.name,
//       'genre': genre,
//       'usageTypes': usageTypes.map((e) => e.name).toList(),
//       'description': description,
//       'deadline': deadline?.toIso8601String(),
//       'urgency': urgency.name,
//       'customRequirements': customRequirements,
//     };
//   }
// }
//
// // Base license class - superclass for all license types
// abstract class BaseLicense {
//   final String id;
//   final DateTime createdAt;
//   final DateTime effectiveDate;
//   final DateTime? expirationDate;
//   final ContactInfo licensor;
//   final ContactInfo licensee;
//   final LicenseType licenseType;
//   final Territory territory;
//   final List<String> customTerritories;
//   final PaymentTerms paymentTerms;
//   final ModificationRights modificationRights;
//   final String creditFormat;
//   final bool moralRightsRetained;
//   final Map<String, dynamic> customClauses;
//
//   const BaseLicense({
//     required this.id,
//     required this.createdAt,
//     required this.effectiveDate,
//     this.expirationDate,
//     required this.licensor,
//     required this.licensee,
//     required this.licenseType,
//     required this.territory,
//     this.customTerritories = const [],
//     required this.paymentTerms,
//     this.modificationRights = ModificationRights.basicEditing,
//     required this.creditFormat,
//     this.moralRightsRetained = true,
//     this.customClauses = const {},
//   });
//
//   Map<String, dynamic> toBaseJson() {
//     return {
//       'id': id,
//       'createdAt': createdAt.toIso8601String(),
//       'effectiveDate': effectiveDate.toIso8601String(),
//       'expirationDate': expirationDate?.toIso8601String(),
//       'licensor': licensor.toJson(),
//       'licensee': licensee.toJson(),
//       'licenseType': licenseType.name,
//       'territory': territory.name,
//       'customTerritories': customTerritories,
//       'paymentTerms': paymentTerms.toJson(),
//       'modificationRights': modificationRights.name,
//       'creditFormat': creditFormat,
//       'moralRightsRetained': moralRightsRetained,
//       'customClauses': customClauses,
//     };
//   }
//
//   // Abstract methods to be implemented by subclasses
//   Map<String, dynamic> toJson();
//
//   String generateContract();
// }
//
// // Synchronization License for existing music
// class SynchronizationLicense extends BaseLicense {
//   final MusicalWork musicalWork;
//   final ProjectRequirements projectRequirements;
//   final List<UsageType> rightsGranted;
//   final bool publicPerformanceIncluded;
//   final bool streamingRightsIncluded;
//   final bool internationalDistribution;
//   final List<String> excludedPlatforms;
//
//   const SynchronizationLicense({
//     required super.id,
//     required super.createdAt,
//     required super.effectiveDate,
//     super.expirationDate,
//     required super.licensor,
//     required super.licensee,
//     required super.licenseType,
//     required super.territory,
//     super.customTerritories,
//     required super.paymentTerms,
//     super.modificationRights,
//     required super.creditFormat,
//     super.moralRightsRetained,
//     super.customClauses,
//     required this.musicalWork,
//     required this.projectRequirements,
//     required this.rightsGranted,
//     this.publicPerformanceIncluded = true,
//     this.streamingRightsIncluded = true,
//     this.internationalDistribution = false,
//     this.excludedPlatforms = const [],
//   });
//
//   @override
//   Map<String, dynamic> toJson() {
//     return {
//       ...toBaseJson(),
//       'licenseSubtype': 'synchronization',
//       'musicalWork': musicalWork.toJson(),
//       'projectRequirements': projectRequirements.toJson(),
//       'rightsGranted': rightsGranted.map((e) => e.name).toList(),
//       'publicPerformanceIncluded': publicPerformanceIncluded,
//       'streamingRightsIncluded': streamingRightsIncluded,
//       'internationalDistribution': internationalDistribution,
//       'excludedPlatforms': excludedPlatforms,
//     };
//   }
//
//   @override
//   String generateContract() {
//     // Return template key or contract content
//     return 'SYNC_LICENSE_TEMPLATE';
//   }
// }
//
// // Composition requirements for custom music creation
// class CompositionRequirements {
//   final int numberOfTracks;
//   final Map<String, int>
//   trackBreakdown; // e.g., {"opening_theme": 1, "background": 5}
//   final Map<String, String> styleRequirements;
//   final List<String> requiredInstruments;
//   final List<String> culturalElements;
//   final bool liveRecordingRequired;
//   final Map<String, String> technicalSpecs;
//   final List<DateTime> deliveryMilestones;
//
//   const CompositionRequirements({
//     required this.numberOfTracks,
//     this.trackBreakdown = const {},
//     this.styleRequirements = const {},
//     this.requiredInstruments = const [],
//     this.culturalElements = const [],
//     this.liveRecordingRequired = false,
//     this.technicalSpecs = const {},
//     this.deliveryMilestones = const [],
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'numberOfTracks': numberOfTracks,
//       'trackBreakdown': trackBreakdown,
//       'styleRequirements': styleRequirements,
//       'requiredInstruments': requiredInstruments,
//       'culturalElements': culturalElements,
//       'liveRecordingRequired': liveRecordingRequired,
//       'technicalSpecs': technicalSpecs,
//       'deliveryMilestones': deliveryMilestones
//           .map((e) => e.toIso8601String())
//           .toList(),
//     };
//   }
// }
//
// // Custom Composition Contract for commissioned work
// class CustomCompositionContract extends BaseLicense {
//   final CompositionRequirements compositionRequirements;
//   final ProjectRequirements projectRequirements;
//   final ComposerExperienceLevel requiredExperience;
//   final bool workForHire; // True means client owns everything
//   final double revisionLimit;
//   final double additionalRevisionFee;
//   final bool publishingRightsIncluded;
//   final bool performanceRoyaltiesIncluded;
//   final List<String> deliverableFormats;
//   final Map<String, double> milestonePayments;
//
//   const CustomCompositionContract({
//     required super.id,
//     required super.createdAt,
//     required super.effectiveDate,
//     super.expirationDate,
//     required super.licensor,
//     required super.licensee,
//     required super.licenseType,
//     required super.territory,
//     super.customTerritories,
//     required super.paymentTerms,
//     super.modificationRights,
//     required super.creditFormat,
//     super.moralRightsRetained,
//     super.customClauses,
//     required this.compositionRequirements,
//     required this.projectRequirements,
//     this.requiredExperience = ComposerExperienceLevel.intermediate,
//     this.workForHire = true,
//     this.revisionLimit = 3.0,
//     this.additionalRevisionFee = 15000.0,
//     this.publishingRightsIncluded = true,
//     this.performanceRoyaltiesIncluded = false,
//     this.deliverableFormats = const ['WAV', 'MP3'],
//     this.milestonePayments = const {},
//   });
//
//   @override
//   Map<String, dynamic> toJson() {
//     return {
//       ...toBaseJson(),
//       'licenseSubtype': 'custom_composition',
//       'compositionRequirements': compositionRequirements.toJson(),
//       'projectRequirements': projectRequirements.toJson(),
//       'requiredExperience': requiredExperience.name,
//       'workForHire': workForHire,
//       'revisionLimit': revisionLimit,
//       'additionalRevisionFee': additionalRevisionFee,
//       'publishingRightsIncluded': publishingRightsIncluded,
//       'performanceRoyaltiesIncluded': performanceRoyaltiesIncluded,
//       'deliverableFormats': deliverableFormats,
//       'milestonePayments': milestonePayments,
//     };
//   }
//
//   @override
//   String generateContract() {
//     return 'CUSTOM_COMPOSITION_TEMPLATE';
//   }
// }
//
// // Factory class for creating different license types
// class LicenseFactory {
//   static BaseLicense createLicense({
//     required String type,
//     required Map<String, dynamic> data,
//   }) {
//     switch (type.toLowerCase()) {
//       case 'synchronization':
//       case 'sync':
//         return SynchronizationLicense(
//           id: data['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
//           createdAt: DateTime.parse(
//             data['createdAt'] ?? DateTime.now().toIso8601String(),
//           ),
//           effectiveDate: DateTime.parse(data['effectiveDate']),
//           expirationDate: data['expirationDate'] != null
//               ? DateTime.parse(data['expirationDate'])
//               : null,
//           licensor: ContactInfo.fromJson(data['licensor']),
//           licensee: ContactInfo.fromJson(data['licensee']),
//           licenseType: LicenseType.values.byName(data['licenseType']),
//           territory: Territory.values.byName(data['territory']),
//           paymentTerms: PaymentTerms(
//             amount: data['paymentTerms']['amount'].toDouble(),
//             currency: Currency.values.byName(data['paymentTerms']['currency']),
//             method: PaymentMethod.values.byName(data['paymentTerms']['method']),
//             schedule: PaymentSchedule.values.byName(
//               data['paymentTerms']['schedule'],
//             ),
//           ),
//           creditFormat: data['creditFormat'],
//           musicalWork: MusicalWork(
//             title: data['musicalWork']['title'],
//             duration: Duration(seconds: data['musicalWork']['duration']),
//             genre: data['musicalWork']['genre'],
//           ),
//           projectRequirements: ProjectRequirements(
//             projectTitle: data['projectRequirements']['projectTitle'],
//             productionType: ProductionType.values.byName(
//               data['projectRequirements']['productionType'],
//             ),
//             genre: data['projectRequirements']['genre'],
//             usageTypes: (data['projectRequirements']['usageTypes'] as List)
//                 .map((e) => UsageType.values.byName(e))
//                 .toList(),
//           ),
//           rightsGranted: (data['rightsGranted'] as List)
//               .map((e) => UsageType.values.byName(e))
//               .toList(),
//         );
//
//       case 'custom_composition':
//       case 'composition':
//         return CustomCompositionContract(
//           id: data['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
//           createdAt: DateTime.parse(
//             data['createdAt'] ?? DateTime.now().toIso8601String(),
//           ),
//           effectiveDate: DateTime.parse(data['effectiveDate']),
//           expirationDate: data['expirationDate'] != null
//               ? DateTime.parse(data['expirationDate'])
//               : null,
//           licensor: ContactInfo.fromJson(data['licensor']),
//           licensee: ContactInfo.fromJson(data['licensee']),
//           licenseType: LicenseType.values.byName(data['licenseType']),
//           territory: Territory.values.byName(data['territory']),
//           paymentTerms: PaymentTerms(
//             amount: data['paymentTerms']['amount'].toDouble(),
//             currency: Currency.values.byName(data['paymentTerms']['currency']),
//             method: PaymentMethod.values.byName(data['paymentTerms']['method']),
//             schedule: PaymentSchedule.values.byName(
//               data['paymentTerms']['schedule'],
//             ),
//           ),
//           creditFormat: data['creditFormat'],
//           compositionRequirements: CompositionRequirements(
//             numberOfTracks: data['compositionRequirements']['numberOfTracks'],
//             trackBreakdown: Map<String, int>.from(
//               data['compositionRequirements']['trackBreakdown'] ?? {},
//             ),
//           ),
//           projectRequirements: ProjectRequirements(
//             projectTitle: data['projectRequirements']['projectTitle'],
//             productionType: ProductionType.values.byName(
//               data['projectRequirements']['productionType'],
//             ),
//             genre: data['projectRequirements']['genre'],
//             usageTypes: (data['projectRequirements']['usageTypes'] as List)
//                 .map((e) => UsageType.values.byName(e))
//                 .toList(),
//           ),
//         );
//
//       default:
//         throw ArgumentError('Unknown license type: $type');
//     }
//   }
// }
//
// // Helper class for license validation
// class LicenseValidator {
//   static List<String> validateSyncLicense(SynchronizationLicense license) {
//     List<String> errors = [];
//
//     if (license.musicalWork.title.isEmpty) {
//       errors.add('Musical work title is required');
//     }
//
//     if (license.paymentTerms.amount <= 0) {
//       errors.add('Payment amount must be greater than 0');
//     }
//
//     if (license.effectiveDate.isAfter(
//       license.expirationDate ?? DateTime.now().add(Duration(days: 365)),
//     )) {
//       errors.add('Effective date cannot be after expiration date');
//     }
//
//     return errors;
//   }
//
//   static List<String> validateCompositionContract(
//       CustomCompositionContract contract,
//       ) {
//     List<String> errors = [];
//
//     if (contract.compositionRequirements.numberOfTracks <= 0) {
//       errors.add('Number of tracks must be greater than 0');
//     }
//
//     if (contract.paymentTerms.amount <= 0) {
//       errors.add('Payment amount must be greater than 0');
//     }
//
//     if (contract.revisionLimit < 1) {
//       errors.add('Revision limit must be at least 1');
//     }
//
//     return errors;
//   }
// }

// import 'package:flutter/material.dart';
//
// // License Type Selection Screen
// class LicenseTypeSelectionScreen extends StatelessWidget {
//   const LicenseTypeSelectionScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: Text('Create License'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black87,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'What do you need?',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Choose the type of music license you want to create',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             SizedBox(height: 40),
//             Expanded(
//               child: Column(
//                 children: [
//                   _buildLicenseTypeCard(
//                     context,
//                     icon: Icons.library_music,
//                     title: 'License Existing Music',
//                     subtitle: 'Use music that\'s already created',
//                     color: Colors.blue,
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => SyncLicenseForm()),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   _buildLicenseTypeCard(
//                     context,
//                     icon: Icons.create,
//                     title: 'Commission Original Music',
//                     subtitle: 'Hire a composer to create custom music',
//                     color: Colors.green,
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => CompositionContractForm(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLicenseTypeCard(
//     BuildContext context, {
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(24),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Icon(icon, color: color, size: 30),
//             ),
//             SizedBox(height: 16),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               subtitle,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Sync License Form
// class SyncLicenseForm extends StatefulWidget {
//   @override
//   _SyncLicenseFormState createState() => _SyncLicenseFormState();
// }
//
// class _SyncLicenseFormState extends State<SyncLicenseForm> {
//   final PageController _pageController = PageController();
//   int _currentStep = 0;
//
//   // Form data
//   String? selectedMusic;
//   String projectTitle = '';
//   String productionType = 'Independent Film';
//   String licenseType = 'Non-Exclusive';
//   String territory = 'Nigeria';
//   double amount = 0;
//   String paymentMethod = 'Bank Transfer';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: Text('License Music'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black87,
//       ),
//       body: Column(
//         children: [
//           _buildProgressIndicator(),
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: (index) => setState(() => _currentStep = index),
//               children: [
//                 _buildMusicSelectionStep(),
//                 _buildProjectDetailsStep(),
//                 _buildLicenseTermsStep(),
//                 _buildPaymentStep(),
//                 _buildReviewStep(),
//               ],
//             ),
//           ),
//           _buildBottomNavigation(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressIndicator() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       color: Colors.white,
//       child: Row(
//         children: List.generate(5, (index) {
//           return Expanded(
//             child: Container(
//               height: 4,
//               margin: EdgeInsets.symmetric(horizontal: 2),
//               decoration: BoxDecoration(
//                 color: index <= _currentStep ? Colors.blue : Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildMusicSelectionStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Select Music',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey[300]!),
//             ),
//             child: Column(
//               children: [
//                 Icon(Icons.upload_file, size: 48, color: Colors.grey[400]),
//                 SizedBox(height: 16),
//                 Text('Upload or select music file'),
//                 SizedBox(height: 12),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() => selectedMusic = 'Lagos Nights.mp3');
//                   },
//                   child: Text('Browse Files'),
//                 ),
//               ],
//             ),
//           ),
//           if (selectedMusic != null) ...[
//             SizedBox(height: 16),
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.blue[50],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.music_note, color: Colors.blue),
//                   SizedBox(width: 12),
//                   Expanded(child: Text(selectedMusic!)),
//                   Icon(Icons.check_circle, color: Colors.green),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProjectDetailsStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Project Details',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           _buildTextField(
//             label: 'Project Title',
//             value: projectTitle,
//             onChanged: (value) => setState(() => projectTitle = value),
//           ),
//           SizedBox(height: 16),
//           _buildDropdown(
//             label: 'Production Type',
//             value: productionType,
//             items: [
//               'Independent Film',
//               'Commercial Film',
//               'Web Series',
//               'Documentary',
//             ],
//             onChanged: (value) => setState(() => productionType = value!),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLicenseTermsStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'License Terms',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           _buildDropdown(
//             label: 'License Type',
//             value: licenseType,
//             items: ['Exclusive', 'Non-Exclusive'],
//             onChanged: (value) => setState(() => licenseType = value!),
//           ),
//           SizedBox(height: 16),
//           _buildDropdown(
//             label: 'Territory',
//             value: territory,
//             items: ['Nigeria', 'West Africa', 'Africa', 'Worldwide'],
//             onChanged: (value) => setState(() => territory = value!),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPaymentStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Payment',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           _buildTextField(
//             label: 'Amount (₦)',
//             value: amount.toString(),
//             keyboardType: TextInputType.number,
//             onChanged: (value) =>
//                 setState(() => amount = double.tryParse(value) ?? 0),
//           ),
//           SizedBox(height: 16),
//           _buildDropdown(
//             label: 'Payment Method',
//             value: paymentMethod,
//             items: ['Bank Transfer', 'Flutterwave', 'Escrow'],
//             onChanged: (value) => setState(() => paymentMethod = value!),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReviewStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Review',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildReviewItem('Music', selectedMusic ?? 'Not selected'),
//                 _buildReviewItem('Project', projectTitle),
//                 _buildReviewItem('Type', productionType),
//                 _buildReviewItem('License', licenseType),
//                 _buildReviewItem('Territory', territory),
//                 _buildReviewItem('Amount', '₦${amount.toStringAsFixed(2)}'),
//                 _buildReviewItem('Payment', paymentMethod),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () => _showSuccessDialog(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: Text('Create License', style: TextStyle(fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReviewItem(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(color: Colors.grey[600])),
//           Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required String value,
//     required Function(String) onChanged,
//     TextInputType? keyboardType,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
//         SizedBox(height: 8),
//         TextField(
//           onChanged: onChanged,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDropdown({
//     required String label,
//     required String value,
//     required List<String> items,
//     required Function(String?) onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
//         SizedBox(height: 8),
//         DropdownButtonFormField<String>(
//           value: value,
//           items: items
//               .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//               .toList(),
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBottomNavigation() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       color: Colors.white,
//       child: Row(
//         children: [
//           if (_currentStep > 0)
//             Expanded(
//               child: OutlinedButton(
//                 onPressed: () {
//                   _pageController.previousPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 child: Text('Back'),
//               ),
//             ),
//           if (_currentStep > 0) SizedBox(width: 16),
//           if (_currentStep < 4)
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _pageController.nextPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 child: Text('Next'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.check_circle, color: Colors.green, size: 64),
//             SizedBox(height: 16),
//             Text(
//               'License Created!',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Your license has been created successfully.',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.grey[600]),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.of(context).pop();
//             },
//             child: Text('Done'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Simplified Composition Contract Form
// class CompositionContractForm extends StatefulWidget {
//   @override
//   _CompositionContractFormState createState() =>
//       _CompositionContractFormState();
// }
//
// class _CompositionContractFormState extends State<CompositionContractForm> {
//   final PageController _pageController = PageController();
//   int _currentStep = 0;
//
//   // Form data
//   String projectTitle = '';
//   String projectType = 'Film';
//   int numberOfTracks = 1;
//   double budget = 0;
//   String deadline = '4 weeks';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: Text('Commission Music'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black87,
//       ),
//       body: Column(
//         children: [
//           _buildProgressIndicator(),
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: (index) => setState(() => _currentStep = index),
//               children: [
//                 _buildProjectStep(),
//                 _buildRequirementsStep(),
//                 _buildBudgetStep(),
//                 _buildReviewStep(),
//               ],
//             ),
//           ),
//           _buildBottomNavigation(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressIndicator() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       color: Colors.white,
//       child: Row(
//         children: List.generate(4, (index) {
//           return Expanded(
//             child: Container(
//               height: 4,
//               margin: EdgeInsets.symmetric(horizontal: 2),
//               decoration: BoxDecoration(
//                 color: index <= _currentStep ? Colors.green : Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildProjectStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Project Info',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           _buildTextField(
//             label: 'Project Title',
//             value: projectTitle,
//             onChanged: (value) => setState(() => projectTitle = value),
//           ),
//           SizedBox(height: 16),
//           _buildDropdown(
//             label: 'Project Type',
//             value: projectType,
//             items: ['Film', 'Web Series', 'Documentary', 'Advertisement'],
//             onChanged: (value) => setState(() => projectType = value!),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRequirementsStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Music Requirements',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           _buildNumberInput(
//             label: 'Number of Tracks',
//             value: numberOfTracks,
//             onChanged: (value) => setState(() => numberOfTracks = value),
//           ),
//           SizedBox(height: 16),
//           // _buildDropdown(
//           //   label: 'Timeline',
//           //   value: deadline,
//           //   items: [
//           //     '2 weeks (Rush)',
//           //     '4 weeks (Standard)',
//           //     '8 weeks (Extended)',
//           //   ],
//           //   onChanged: (value) => setState(() => deadline = value!),
//           // ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBudgetStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Budget',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           _buildTextField(
//             label: 'Total Budget (₦)',
//             value: budget.toString(),
//             keyboardType: TextInputType.number,
//             onChanged: (value) =>
//                 setState(() => budget = double.tryParse(value) ?? 0),
//           ),
//           SizedBox(height: 16),
//           Container(
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.blue[50],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.info, color: Colors.blue),
//                 SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     'Suggested budget: ₦${(numberOfTracks * 150000).toStringAsFixed(0)}',
//                     style: TextStyle(color: Colors.blue[800]),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReviewStep() {
//     return Padding(
//       padding: EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Review & Post',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildReviewItem('Project', projectTitle),
//                 _buildReviewItem('Type', projectType),
//                 _buildReviewItem('Tracks', numberOfTracks.toString()),
//                 _buildReviewItem('Timeline', deadline),
//                 _buildReviewItem('Budget', '₦${budget.toStringAsFixed(2)}'),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () => _showSuccessDialog(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: Text('Post Project', style: TextStyle(fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReviewItem(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(color: Colors.grey[600])),
//           Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required String value,
//     required Function(String) onChanged,
//     TextInputType? keyboardType,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
//         SizedBox(height: 8),
//         TextField(
//           onChanged: onChanged,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDropdown({
//     required String label,
//     required String value,
//     required List<String> items,
//     required Function(String?) onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
//         SizedBox(height: 8),
//         DropdownButtonFormField<String>(
//           value: value,
//           items: items
//               .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//               .toList(),
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNumberInput({
//     required String label,
//     required int value,
//     required Function(int) onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
//         SizedBox(height: 8),
//         Row(
//           children: [
//             IconButton(
//               onPressed: value > 1 ? () => onChanged(value - 1) : null,
//               icon: Icon(Icons.remove_circle_outline),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey[300]!),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text(value.toString(), style: TextStyle(fontSize: 18)),
//             ),
//             IconButton(
//               onPressed: () => onChanged(value + 1),
//               icon: Icon(Icons.add_circle_outline),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBottomNavigation() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       color: Colors.white,
//       child: Row(
//         children: [
//           if (_currentStep > 0)
//             Expanded(
//               child: OutlinedButton(
//                 onPressed: () {
//                   _pageController.previousPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 child: Text('Back'),
//               ),
//             ),
//           if (_currentStep > 0) SizedBox(width: 16),
//           if (_currentStep < 3)
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _pageController.nextPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 child: Text('Next'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.check_circle, color: Colors.green, size: 64),
//             SizedBox(height: 16),
//             Text(
//               'Project Posted!',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Composers will start bidding on your project.',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.grey[600]),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.of(context).pop();
//             },
//             child: Text('Done'),
//           ),
//         ],
//       ),
//     );
//   }
// }
