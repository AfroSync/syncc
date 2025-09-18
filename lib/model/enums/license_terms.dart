// License terms enums for music licensing contracts
//
// This file contains all the preset categories and values used in
// music licensing agreements, providing standardized options for
// different types of licensing scenarios.

/// Payment tier presets for different project scales
enum PaymentPresets {
  student(
    'Student',
    'For student films and very small projects with limited budgets',
  ),
  independent(
    'Independent',
    'For indie films or small production houses with moderate budgets',
  ),
  commercial(
    'Commercial',
    'For commercials, TV series, or bigger projects with substantial budgets',
  ),
  premium(
    'Premium',
    'For major or international productions with high budgets',
  );

  const PaymentPresets(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Payment Tiers';
  static const String definition =
      'Standardized payment categories based on project scale, budget, and production value to help determine appropriate licensing fees.';
}

/// Geographic territory presets for licensing rights
enum TerritoryPresets {
  local('Local', 'Nigeria-only rights for domestic productions'),
  regional('Regional', 'West Africa region rights covering multiple countries'),
  continental(
    'Continental',
    'Entire African continent rights for pan-African productions',
  ),
  worldwide(
    'Worldwide',
    'Global or full international rights for worldwide distribution',
  );

  const TerritoryPresets(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Territory Rights';
  static const String definition =
      'Geographic scope of licensing rights determining where the music can be used, distributed, or broadcast.';
}

/// Exclusivity level presets for licensing agreements
enum ExclusivityPresets {
  nonExclusive(
    'Non-Exclusive',
    'Artist can license to other projects simultaneously without restrictions',
  ),
  semiExclusive(
    'Semi-Exclusive',
    'Limited exclusivity within certain category or territory constraints',
  ),
  exclusive(
    'Exclusive',
    'Full exclusivity where only one project can use the music during the license period',
  );

  const ExclusivityPresets(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Exclusivity Rights';
  static const String definition =
      'Level of exclusivity determining whether the artist can license the same music to other projects during the license period.';
}

/// Usage rights presets for different media platforms
enum UsageRightsPresets {
  basic('Basic', 'Film only - limited to the main production'),
  standard(
    'Standard',
    'Film plus streaming platforms and digital distribution',
  ),
  enhanced(
    'Enhanced',
    'Film, streaming, and marketing or promotional materials',
  ),
  comprehensive(
    'Comprehensive',
    'All media rights including film, streaming, advertisements, and sequels',
  );

  const UsageRightsPresets(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Usage Rights';
  static const String definition =
      'Scope of media platforms and formats where the licensed music can be used, from basic film rights to comprehensive multi-platform usage.';
}

/// Performing rights presets for royalty management
enum PerformingRightsPresets {
  keepRoyalties(
    'Keep Royalties',
    'Artist retains future royalties from TV, radio, and streaming performances',
  ),
  waiveRoyalties(
    'Waive Royalties',
    'Producer pays more upfront compensation in exchange for artist waiving future royalties',
  );

  const PerformingRightsPresets(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Performing Rights';
  static const String definition =
      'Options for managing future royalty payments from performing rights organizations, balancing upfront payments with ongoing royalty streams.';
}

/// Approval level presets for content usage control
enum ApprovalLevels {
  none(
    'No Approval',
    'No approval needed - producer can use music however they see fit',
  ),
  basic(
    'Basic Notification',
    'Just notify artist of final usage without requiring approval',
  ),
  contextOnly(
    'Context Approval',
    'Artist must approve the scene context and usage environment',
  ),
  fullApproval(
    'Full Approval',
    'Artist must approve everything before the music can be used',
  );

  const ApprovalLevels(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Approval Rights';
  static const String definition =
      'Level of control the artist maintains over how and where their music is used, from no oversight to complete approval requirements.';
}

/// Credit presets for artist attribution
enum CreditPresets {
  none(
    'No Credit',
    'No credit required - music can be used without attribution',
  ),
  minimal('Minimal Credit', 'End credits only with basic artist information'),
  standard(
    'Standard Credit',
    'End credits plus social media rights and mentions',
  ),
  prominent(
    'Prominent Credit',
    'Opening credits or larger text with enhanced visibility',
  ),
  premium(
    'Premium Credit',
    'Opening credits plus logo placement and marketing inclusion',
  ),
  custom('Custom Credit', 'Build your own custom credit arrangement');

  const CreditPresets(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Credit Requirements';
  static const String definition =
      'Artist attribution and credit requirements ranging from no credit to premium placement, determining how the artist is recognized for their work.';
}

/// Modification level presets for music editing rights
enum ModificationLevels {
  prohibited(
    'Prohibited',
    'No changes allowed - music must be used exactly as provided',
  ),
  basicOnly(
    'Basic Only',
    'Length and volume adjustments only - no creative modifications',
  ),
  withApproval(
    'With Approval',
    'Changes allowed but require artist approval before implementation',
  ),
  fullRights(
    'Full Rights',
    'Edit however needed - complete creative freedom for modifications',
  );

  const ModificationLevels(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Modification Rights';
  static const String definition =
      'Level of permission for editing, remixing, or modifying the original music, from no changes to complete creative freedom.';
}

/// Renewal option presets for license extensions
enum RenewalOptions {
  noRenewal(
    'No Renewal',
    'One-time deal only - no option to extend the license',
  ),
  automatic('Automatic', 'Auto-renews with the same terms and conditions'),
  negotiated(
    'Negotiated',
    'Renewal requires renegotiation of new terms and pricing',
  ),
  firstRefusal(
    'First Refusal',
    'Producer gets first chance to renew before offering to others',
  );

  const RenewalOptions(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Renewal Options';
  static const String definition =
      'Options for extending or renewing the license agreement after the initial term expires, from one-time deals to automatic renewals.';
}

/// Termination trigger presets for contract violations
enum TerminationTriggers {
  standard(
    'Standard',
    'Standard violations: non-payment, major contract breaches, or producer bankruptcy',
  ),
  artistProtections(
    'Artist Protections',
    'Artist-specific protections: inappropriate usage, offensive context, or damage to artist reputation',
  );

  const TerminationTriggers(this.name, this.description);

  final String name;
  final String description;

  static const String categoryName = 'Termination Rights';
  static const String definition =
      'Conditions that allow either party to terminate the license agreement, protecting both financial interests and artistic integrity.';
}
