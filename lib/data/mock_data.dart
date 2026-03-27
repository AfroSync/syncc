/// Toggle to switch between mock data and live API calls.

import 'package:afrosync/model/user/artist_model.dart';
import 'package:afrosync/model/enums/music_genre.dart';

const bool useMockData = true;

// ---------------------------------------------------------------------------
// Artists (uses existing ArtistModel)
// ---------------------------------------------------------------------------

final List<ArtistModel> mockArtists = [
  ArtistModel(
    firstName: 'Adaeze',
    lastName: 'Okonkwo',
    countryCode: 'NG',
    email: 'adaeze.okonkwo@syncc.io',
    stageName: 'Adaeze',
    genres: [MusicGenre.afroBeats, MusicGenre.pop],
  ),
  ArtistModel(
    firstName: 'Kwame',
    lastName: 'Mensah',
    countryCode: 'GH',
    email: 'kwame.mensah@syncc.io',
    stageName: 'Kwame Mensah',
    genres: [MusicGenre.highlife],
  ),
  ArtistModel(
    firstName: 'Thandiwe',
    lastName: 'Ndlovu',
    countryCode: 'ZA',
    email: 'thandiwe.n@syncc.io',
    stageName: 'Thandiwe',
    genres: [MusicGenre.amapiano],
  ),
  ArtistModel(
    firstName: 'Aminata',
    lastName: 'Diallo',
    countryCode: 'SN',
    email: 'aminata.diallo@syncc.io',
    stageName: 'Aminata',
    genres: [MusicGenre.rnbSoul],
  ),
  ArtistModel(
    firstName: 'Kofi',
    lastName: 'Asante',
    countryCode: 'GH',
    email: 'kofi.asante@syncc.io',
    stageName: 'Kofi Asante',
    genres: [MusicGenre.afroBeats, MusicGenre.electronic],
  ),
  ArtistModel(
    firstName: 'Wanjiku',
    lastName: 'Kamau',
    countryCode: 'KE',
    email: 'wanjiku.kamau@syncc.io',
    stageName: 'Wanjiku',
    genres: [MusicGenre.pop, MusicGenre.afroBeats],
  ),
  ArtistModel(
    firstName: 'Yohannes',
    lastName: 'Tekle',
    countryCode: 'ET',
    email: 'yohannes.t@syncc.io',
    stageName: 'Yohannes',
    genres: [MusicGenre.rnbSoul],
  ),
  ArtistModel(
    firstName: 'Oluwaseun',
    lastName: 'Adeyinka',
    countryCode: 'NG',
    email: 'seun.adeyinka@syncc.io',
    stageName: 'Seun Adeyinka',
    genres: [MusicGenre.juju, MusicGenre.afroBeats],
  ),
];

/// Bio text for each artist, keyed by stageName.
const Map<String, String> mockArtistBios = {
  'Adaeze': 'The voice of the new Lagos — raw, rhythmic, unapologetic.',
  'Kwame Mensah': 'Bringing highlife into the streaming age without losing the soul.',
  'Thandiwe': "Johannesburg's underground queen — amapiano with a poet's touch.",
  'Aminata': 'Dakar sunsets in every note.',
  'Kofi Asante': 'Where talking drums meet synth pads.',
  "Wanjiku": "Nairobi's answer to the global stage.",
  'Yohannes': 'Ancient melodies, modern arrangements — Addis Ababa to the world.',
  'Seun Adeyinka': "Juju music didn't die — it evolved.",
};

/// Available track counts per artist, keyed by stageName.
const Map<String, int> mockArtistTrackCounts = {
  'Adaeze': 14,
  'Kwame Mensah': 9,
  'Thandiwe': 22,
  'Aminata': 7,
  'Kofi Asante': 11,
  'Wanjiku': 16,
  'Yohannes': 5,
  'Seun Adeyinka': 19,
};

/// Verified status per artist.
const Map<String, bool> mockArtistVerified = {
  'Adaeze': true,
  'Kwame Mensah': true,
  'Thandiwe': true,
  'Aminata': false,
  'Kofi Asante': true,
  'Wanjiku': false,
  'Yohannes': false,
  'Seun Adeyinka': true,
};

// ---------------------------------------------------------------------------
// Licensing Inquiries
// ---------------------------------------------------------------------------

enum InquiryStatus { pending, approved, declined, countered }

enum RequesterType { filmmaker, adAgency, podcast, streamingPlatform, tvNetwork }

class MockLicensingInquiry {
  final String requesterName;
  final RequesterType requesterType;
  final String trackRequested;
  final String usageType;
  final String territory;
  final String projectDescription;
  final InquiryStatus status;
  final DateTime submittedDate;

  const MockLicensingInquiry({
    required this.requesterName,
    required this.requesterType,
    required this.trackRequested,
    required this.usageType,
    required this.territory,
    required this.projectDescription,
    required this.status,
    required this.submittedDate,
  });
}

final List<MockLicensingInquiry> mockInquiries = [
  MockLicensingInquiry(
    requesterName: 'Nollywood Digital Studios',
    requesterType: RequesterType.filmmaker,
    trackRequested: 'Water',
    usageType: 'Film soundtrack — opening credits',
    territory: 'Worldwide',
    projectDescription: 'Feature-length drama set in 1990s Lagos, streaming release on Prime Video.',
    status: InquiryStatus.approved,
    submittedDate: DateTime(2025, 9, 14),
  ),
  MockLicensingInquiry(
    requesterName: 'Ogilvy Africa',
    requesterType: RequesterType.adAgency,
    trackRequested: 'Rush',
    usageType: 'TV commercial — 30 second spot',
    territory: 'Africa only',
    projectDescription: 'Telecoms brand campaign targeting Gen Z across West Africa.',
    status: InquiryStatus.pending,
    submittedDate: DateTime(2026, 1, 7),
  ),
  MockLicensingInquiry(
    requesterName: 'The Pan-African Podcast',
    requesterType: RequesterType.podcast,
    trackRequested: 'Ye',
    usageType: 'Podcast intro/outro — recurring',
    territory: 'Worldwide',
    projectDescription: 'Weekly culture podcast covering diaspora stories, 50k average listeners.',
    status: InquiryStatus.approved,
    submittedDate: DateTime(2025, 11, 22),
  ),
  MockLicensingInquiry(
    requesterName: 'Canal+ Afrique',
    requesterType: RequesterType.tvNetwork,
    trackRequested: 'Unavailable',
    usageType: 'Series soundtrack — background score',
    territory: 'Francophone Africa',
    projectDescription: 'Limited series exploring contemporary art scenes in Dakar and Abidjan.',
    status: InquiryStatus.countered,
    submittedDate: DateTime(2026, 2, 3),
  ),
  MockLicensingInquiry(
    requesterName: 'Showmax Originals',
    requesterType: RequesterType.streamingPlatform,
    trackRequested: 'Essence',
    usageType: 'Trailer placement — exclusive 60 days',
    territory: 'Worldwide excluding US',
    projectDescription: 'Romantic drama series trailer for Q3 release, targeted at African diaspora audiences.',
    status: InquiryStatus.pending,
    submittedDate: DateTime(2026, 3, 1),
  ),
  MockLicensingInquiry(
    requesterName: 'Reel South Films',
    requesterType: RequesterType.filmmaker,
    trackRequested: 'Last Last',
    usageType: 'Documentary — featured placement',
    territory: 'Worldwide',
    projectDescription: 'Documentary on Afrobeats global rise, selected for TIFF 2026.',
    status: InquiryStatus.declined,
    submittedDate: DateTime(2025, 10, 19),
  ),
];

// ---------------------------------------------------------------------------
// Contract Templates
// ---------------------------------------------------------------------------

class MockContractTemplate {
  final String type;
  final String territory;
  final String duration;
  final List<String> usageRights;
  final Map<String, dynamic> feeStructure;
  final String revisionNotes;

  const MockContractTemplate({
    required this.type,
    required this.territory,
    required this.duration,
    required this.usageRights,
    required this.feeStructure,
    required this.revisionNotes,
  });
}

const List<MockContractTemplate> mockContractTemplates = [
  MockContractTemplate(
    type: 'Standard Non-Exclusive',
    territory: 'Worldwide',
    duration: '2 years',
    usageRights: [
      'Background music in film/TV',
      'Online streaming platforms',
      'Social media advertising',
      'Podcast use',
    ],
    feeStructure: {
      'base_fee_usd': 1500,
      'royalty_split': '70/30 artist-favoured',
      'payment_terms': 'Net 30 from execution',
    },
    revisionNotes: 'Standard template — suitable for most indie and mid-budget projects. No exclusivity restrictions.',
  ),
  MockContractTemplate(
    type: 'Exclusive Territory-Limited',
    territory: 'West Africa + East Africa',
    duration: '1 year',
    usageRights: ['Exclusive sync in specified territories', 'TV broadcast', 'Cinema release', 'Digital advertising'],
    feeStructure: {
      'base_fee_usd': 5000,
      'exclusivity_premium': 2500,
      'total_usd': 7500,
      'payment_terms': '50% upfront, 50% on first broadcast',
    },
    revisionNotes:
        'Territory-limited exclusivity. Artist retains rights outside specified regions. Premium pricing reflects restricted competition.',
  ),
  MockContractTemplate(
    type: 'Festival / Event One-Time',
    territory: 'Event venue only',
    duration: 'Single use — event date range',
    usageRights: [
      'Live event playback',
      'Event promotional material (30 days pre-event)',
      'Post-event highlight reel (90 days)',
    ],
    feeStructure: {'flat_fee_usd': 800, 'payment_terms': 'Full payment 14 days before event'},
    revisionNotes:
        'Flat-fee, single-use license. No ongoing royalties. Covers the event itself plus limited promotional window.',
  ),
];

// ---------------------------------------------------------------------------
// Albums
// ---------------------------------------------------------------------------

class MockAlbum {
  final String title;
  final int year;
  final int trackCount;
  final String coverArtUrl;

  const MockAlbum({
    required this.title,
    required this.year,
    required this.trackCount,
    required this.coverArtUrl,
  });
}

final List<MockAlbum> mockAlbums = [
  MockAlbum(
    title: 'Lagos After Dark',
    year: 2024,
    trackCount: 12,
    coverArtUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/1e/c9/5b/1ec95bbc-a56f-cbef-070c-ddec9f4fdd3c/196871296205.jpg/600x600bb.jpg',
  ),
  MockAlbum(
    title: 'Continent',
    year: 2023,
    trackCount: 10,
    coverArtUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/ca/eb/31/caeb3173-eaf0-0cd5-65ea-585adfe312ba/075679745156.jpg/600x600bb.jpg',
  ),
  MockAlbum(
    title: 'Red Clay Sessions',
    year: 2022,
    trackCount: 8,
    coverArtUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/b0/09/8e/b0098ed0-ef53-f2b5-386a-c8e6181f3c8a/886448775256.jpg/600x600bb.jpg',
  ),
  MockAlbum(
    title: 'Motherboard',
    year: 2021,
    trackCount: 14,
    coverArtUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/b2/b4/7c/b2b47cf9-d8e2-53f6-5c62-c974d665c95b/22UMGIM08994.rgb.jpg/600x600bb.jpg',
  ),
  MockAlbum(
    title: 'Origins EP',
    year: 2020,
    trackCount: 6,
    coverArtUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/00/d3/73/00d373d0-0a08-4e3f-3ace-d2075d4f36f8/196589586582.jpg/600x600bb.jpg',
  ),
];

// ---------------------------------------------------------------------------
// Music Player State
// ---------------------------------------------------------------------------

class MockPlayerState {
  final int currentTrackId;
  final bool isPlaying;
  final int progressSeconds;
  final List<int> queue;

  const MockPlayerState({
    required this.currentTrackId,
    required this.isPlaying,
    required this.progressSeconds,
    required this.queue,
  });
}

const MockPlayerState mockPlayerState = MockPlayerState(
  currentTrackId: 1,
  isPlaying: true,
  progressSeconds: 73,
  queue: [1, 5, 8, 12, 3, 19, 22],
);
