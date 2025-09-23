// import 'package:afrosync/model/license_model.dart';
// import 'package:afrosync/model/enums/license_terms.dart';

// /// Default license model that all tracks have by default
// ///
// /// This represents a standard, non-exclusive license suitable for most
// /// independent and small commercial projects with reasonable terms.
// /// Priced in Nigerian Naira (₦750,000) for the local market.
// const basicLicense = LicenseModel(
//   amount: '750000', // ₦750,000 NGN - reasonable for indie projects
//   terms: TermsModel(
//     // Payment tier - independent level for most tracks
//     paymentPresets: [PaymentPresets.independent],

//     // Territory - local rights by default, can be upgraded
//     territoryPresets: [TerritoryPresets.local],

//     // Exclusivity - non-exclusive by default to allow multiple uses
//     exclusivityPresets: [ExclusivityPresets.nonExclusive],

//     // Usage rights - standard film + streaming
//     usageRightsPresets: [UsageRightsPresets.standard],

//     // Performing rights - artist keeps royalties
//     performingRightsPresets: [PerformingRightsPresets.keepRoyalties],

//     // Approval - basic notification only
//     approvalLevels: [ApprovalLevels.basic],

//     // Credit - standard end credits
//     creditPresets: [CreditPresets.standard],

//     // Modification - basic length/volume adjustments only
//     modificationLevels: [ModificationLevels.basicOnly],

//     // Renewal - no automatic renewal, negotiate new terms
//     renewalOptions: [RenewalOptions.negotiated],

//     // Termination - standard protections
//     terminationTriggers: [TerminationTriggers.standard],
//   ),
// );
