import 'package:afrosync/model/track_model.dart';
import 'package:afrosync/model/track_metadata.dart';
import 'package:afrosync/model/license_model.dart';
import 'package:afrosync/model/tracks_response.dart';

/// Mock track data inspired by Billboard U.S. Afrobeats Songs Year-End 2025
/// Cover art and 30-second previews sourced from the iTunes Search API (free, no auth)
class MockTracks {
  static String _art(String url) => url.replaceAll('100x100bb', '600x600bb');

  static final List<TrackModel> all = [
    TrackModel(
      id: 1,
      title: 'Water',
      artistName: 'Tyla',
      releaseDate: DateTime(2023, 7, 28),
      duration: 200,
      description:
          'The breakthrough smash that introduced the world to amapiano-infused Afropop. Tyla\'s silky vocals over a hypnotic rhythm made this song a global phenomenon.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/9a/62/e6/9a62e688-9080-feed-2411-cc793c4545cf/mzaf_4449175929344535361.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/1e/c9/5b/1ec95bbc-a56f-cbef-070c-ddec9f4fdd3c/196871296205.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Romantic',
        instrumentation: ['Synth Bass', 'Hi-Hat', 'Piano', 'Kick Drum'],
        sceneSuitability: ['Club', 'Date Night', 'Summer Vibes'],
        build: 'Gradual',
        vocalType: 'Female Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '299'),
    ),
    TrackModel(
      id: 2,
      title: 'Calm Down',
      artistName: 'Rema & Selena Gomez',
      releaseDate: DateTime(2022, 2, 11),
      duration: 220,
      description:
          'A smooth Afrobeats love anthem that crossed over globally with Selena Gomez\'s feature. The remix became one of the longest-charting Afrobeats songs ever.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/3c/7e/3b/3c7e3b1d-c005-91cb-51d1-2d86effd9990/mzaf_6788794088599474630.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/b2/b4/7c/b2b47cf9-d8e2-53f6-5c62-c974d665c95b/22UMGIM08994.rgb.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats',
        mood: 'Romantic',
        instrumentation: ['Guitar', 'Talking Drum', 'Bass', 'Synth Pad'],
        sceneSuitability: ['Date Night', 'Party', 'Chill'],
        build: 'Steady',
        vocalType: 'Male/Female Duet',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '349'),
    ),
    TrackModel(
      id: 3,
      title: 'Essence',
      artistName: 'Wizkid ft. Tems',
      releaseDate: DateTime(2020, 10, 29),
      duration: 240,
      description:
          'The song that put Afrobeats firmly on the global mainstream map. Wizkid and Tems created one of the most beautiful sonic moments in modern music history.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/b3/dc/ba/b3dcba73-7f33-9abe-089c-73557a6dcb54/mzaf_16412591162283722395.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/b0/09/8e/b0098ed0-ef53-f2b5-386a-c8e6181f3c8a/886448775256.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats',
        mood: 'Sensual',
        instrumentation: ['Acoustic Guitar', 'Shaker', 'Bass', 'Pad Synth'],
        sceneSuitability: ['Date Night', 'Sunset', 'Chill Vibes'],
        build: 'Gradual',
        vocalType: 'Male/Female Duet',
        tempo: 'Slow',
      ),
      license: LicenseModel(amount: '399'),
    ),
    TrackModel(
      id: 4,
      title: 'UNAVAILABLE',
      artistName: 'Davido ft. Musa Keys',
      releaseDate: DateTime(2023, 3, 31),
      duration: 172,
      description:
          'An irresistible blend of Afrobeats and Amapiano. Davido channels unbridled energy over a log drum-heavy production that demands you move.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/6a/08/f8/6a08f8f4-05ac-fe83-68b9-85e4f8cac8b1/mzaf_11447656297166015034.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/f2/6f/40/f26f409e-958b-0b9f-adce-395673632c18/196871414814.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats / Amapiano',
        mood: 'Energetic',
        instrumentation: ['Log Drum', 'Bass', 'Piano Keys', 'Claps'],
        sceneSuitability: ['Club', 'Festival', 'Party'],
        build: 'Explosive',
        vocalType: 'Male Lead',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '299'),
    ),
    TrackModel(
      id: 5,
      title: 'Rush',
      artistName: 'Ayra Starr',
      releaseDate: DateTime(2022, 9, 16),
      duration: 180,
      description:
          'Ayra Starr\'s sultry voice rides a danceable Afrobeats groove in this certified fan favorite. The song showcases her magnetic stage presence and songwriting maturity.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/a0/0c/07/a00c0745-9162-1e7f-af70-b92f891a728e/mzaf_12267370392753596352.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/92/93/c1/9293c1af-2881-bcb7-439f-99a516e5d715/5059449090122.png/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Playful',
        instrumentation: ['Drum Machine', 'Guitar Riff', 'Bass', 'Synth'],
        sceneSuitability: ['Club', 'Girls Night Out', 'Party'],
        build: 'Steady',
        vocalType: 'Female Lead',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 6,
      title: 'Love Nwantiti',
      artistName: 'CKay',
      releaseDate: DateTime(2019, 9, 6),
      duration: 184,
      description:
          'The viral TikTok hit that exposed millions to Afrobeats worldwide. CKay\'s plaintive vocals and addictive melody created one of the biggest crossover moments for African music.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/3a/6d/b1/3a6db18b-e3f0-e067-ae12-366ebee3f291/mzaf_15456079741276818033.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/47/75/a4/4775a4de-e5bd-e553-7dec-5a3911718276/795152501603.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Romantic',
        instrumentation: ['Electric Guitar', 'Bass', 'Clap', 'Kick'],
        sceneSuitability: ['Social Media', 'Party', 'Date Night'],
        build: 'Steady',
        vocalType: 'Male Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '199'),
    ),
    TrackModel(
      id: 7,
      title: 'Peru',
      artistName: 'Fireboy DML ft. Ed Sheeran',
      releaseDate: DateTime(2021, 7, 30),
      duration: 204,
      description:
          'Fireboy DML\'s smooth Afropop vibes collide with Ed Sheeran\'s star power in this genre-blending hit that dominated charts worldwide.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/0a/43/e9/0a43e979-a23f-b7cb-7d39-1b82994d5010/mzaf_39468596823542521.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/b9/a8/79/b9a87900-13cb-5655-2ac8-64191ee6ec5d/194690720895_cover.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Happy',
        instrumentation: ['Acoustic Guitar', 'Bass', 'Drums', 'Synth Pad'],
        sceneSuitability: ['Daytime Party', 'Road Trip', 'Festival'],
        build: 'Gradual',
        vocalType: 'Male Duet',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '299'),
    ),
    TrackModel(
      id: 8,
      title: 'Soso',
      artistName: 'Omah Lay',
      releaseDate: DateTime(2021, 9, 3),
      duration: 196,
      description:
          'A heartfelt Afrobeats ballad filled with raw emotion and longing. Omah Lay\'s unique melodic style makes this one of the most moving Afropop records of the decade.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/33/7e/62/337e62a0-3554-1b2f-4edc-21985a7fea8e/mzaf_17413803498290716027.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/b1/77/f7/b177f74e-ff94-ac1f-0317-e0e120178661/093624869191.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Melancholic',
        instrumentation: ['Acoustic Guitar', 'Piano', 'Strings', 'Soft Drum'],
        sceneSuitability: ['Late Night', 'Heartbreak', 'Chill'],
        build: 'Gradual',
        vocalType: 'Male Lead',
        tempo: 'Slow',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 9,
      title: 'Last Last',
      artistName: 'Burna Boy',
      releaseDate: DateTime(2022, 5, 26),
      duration: 216,
      description:
          'Built around a sample of Toni Braxton\'s "He Wasn\'t Man Enough", Burna Boy turns heartbreak into a dance-floor anthem with his trademark Afrofusion sound.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/98/27/c3/9827c314-7ee0-7f70-2528-b904f3914188/mzaf_3677227575880735836.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/ca/eb/31/caeb3173-eaf0-0cd5-65ea-585adfe312ba/075679745156.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrofusion',
        mood: 'Bittersweet',
        instrumentation: ['Sample', 'Drums', 'Bass', 'Synth'],
        sceneSuitability: ['Club', 'Party', 'Late Night'],
        build: 'Steady',
        vocalType: 'Male Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '349'),
    ),
    TrackModel(
      id: 10,
      title: '2:30',
      artistName: 'Asake',
      releaseDate: DateTime(2022, 9, 8),
      duration: 188,
      description:
          'Asake\'s signature Afrobeats-meets-Fuji sound shines in this late-night anthem. His distinctive vocal delivery and NXWRTH\'s production make for an irresistible combo.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/2a/cb/89/2acb8940-e972-da62-3923-bb11ef93867d/mzaf_13832618993713587194.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/c3/31/6e/c3316eb4-4a88-dfbd-0d89-ded6ff156f0d/197342109697_cover.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats / Fuji',
        mood: 'Euphoric',
        instrumentation: ['Talking Drum', 'Guitar', 'Bass', 'Claps'],
        sceneSuitability: ['Club', 'Late Night', 'Party'],
        build: 'Explosive',
        vocalType: 'Male Lead',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 11,
      title: 'Mnike',
      artistName: 'Tyler ICU & Tumelo.za ft. DJ Maphorisa',
      releaseDate: DateTime(2023, 2, 17),
      duration: 337,
      description:
          'A deep amapiano cut that became one of 2023\'s biggest anthems. The log drum patterns and haunting vocals create an almost spiritual dance experience.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview126/v4/eb/57/dd/eb57dd43-ac42-6ab1-2a1d-9241a1ce88d5/mzaf_4507028321606345173.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/a9/96/7d/a9967d8f-427d-9026-7234-360b6a9d9fe4/196871045292.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Amapiano',
        mood: 'Spiritual',
        instrumentation: ['Log Drum', 'Piano', 'Bass', 'Percussion'],
        sceneSuitability: ['Club', 'Deep House Set', 'Festival'],
        build: 'Gradual',
        vocalType: 'Male Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '299'),
    ),
    TrackModel(
      id: 12,
      title: 'Joha',
      artistName: 'Asake ft. Olamide',
      releaseDate: DateTime(2023, 5, 26),
      duration: 198,
      description:
          'Asake links up with his mentor Olamide for a feel-good Afrobeats-Fuji banger. The two share an effortless chemistry over a bouncy, hypnotic beat.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/87/b6/80/87b68044-92a6-a859-eea2-54bfa23a46e2/mzaf_2412647798936735530.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/5e/4f/66/5e4f6644-a234-d037-609d-7ed53fd6c7f9/194690909856_cover.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats / Fuji',
        mood: 'Happy',
        instrumentation: ['Talking Drum', 'Guitar', 'Bass', 'Shaker'],
        sceneSuitability: ['Party', 'Daytime', 'Celebration'],
        build: 'Steady',
        vocalType: 'Male Duet',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 13,
      title: 'Ku Lo Sa',
      artistName: 'Oxlade',
      releaseDate: DateTime(2021, 11, 5),
      duration: 186,
      description:
          'Oxlade\'s velvet voice glides over a minimal Afropop production in this deeply emotional love song. The TikTok boost propelled it to global attention.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/7a/7f/fe/7a7ffee5-133e-2e78-d89f-809c25786029/mzaf_9431411460967559122.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/00/d3/73/00d373d0-0a08-4e3f-3ace-d2075d4f36f8/196589586582.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Romantic',
        instrumentation: ['Acoustic Guitar', 'Soft Bass', 'Pad', 'Light Drums'],
        sceneSuitability: ['Date Night', 'Chill', 'Evening'],
        build: 'Gradual',
        vocalType: 'Male Lead',
        tempo: 'Slow',
      ),
      license: LicenseModel(amount: '199'),
    ),
    TrackModel(
      id: 14,
      title: 'Champion',
      artistName: 'Burna Boy',
      releaseDate: DateTime(2024, 3, 22),
      duration: 211,
      description:
          'An energetic Afrofusion anthem brimming with confidence. Burna Boy\'s booming baritone commands the track from start to finish.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/f8/47/b7/f847b71d-63d9-8dd6-d547-c482a86bb7ba/mzaf_5768004375856692765.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/af/3c/0f/af3c0fe2-1c4f-8499-67a8-14a8e41fdbf8/5021732410535.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrofusion',
        mood: 'Empowering',
        instrumentation: ['Horns', 'Drums', 'Bass', 'Synth'],
        sceneSuitability: ['Workout', 'Festival', 'Motivation'],
        build: 'Explosive',
        vocalType: 'Male Lead',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '349'),
    ),
    TrackModel(
      id: 15,
      title: 'Benin Boys',
      artistName: 'Rema',
      releaseDate: DateTime(2024, 4, 12),
      duration: 195,
      description:
          'Rema pays homage to his roots in Benin City with this swaggering Afrobeats track. His melodic flow and confident delivery are impossible to ignore.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/28/7e/3b/287e3bf6-d5a7-3cb5-c23c-05c1b02e36d6/mzaf_12245227739514061484.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/9d/f2/6d/9df26db8-92c6-41d8-81da-2bc68bdb471f/24UMGIM62607.rgb.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats',
        mood: 'Confident',
        instrumentation: ['Synth Bass', 'Kick', 'Hi-Hat', 'Guitar'],
        sceneSuitability: ['Club', 'Party', 'Hype'],
        build: 'Steady',
        vocalType: 'Male Lead',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 16,
      title: 'More Love Less Ego',
      artistName: 'Wizkid',
      releaseDate: DateTime(2022, 11, 4),
      duration: 194,
      description:
          'Wizkid takes his smooth, laid-back Afropop style to new heights. An infectious, feel-good track with a message of love and humility.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/0d/21/6f/0d216f38-92aa-8339-f507-a312efdb498e/mzaf_8728431651282342229.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/a9/3f/f5/a93ff5e8-5c00-607a-4851-3aae9b356a64/196589495877.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Feel-Good',
        instrumentation: ['Guitar', 'Soft Bass', 'Shaker', 'Pad'],
        sceneSuitability: ['Chill', 'Brunch', 'Daytime'],
        build: 'Gradual',
        vocalType: 'Male Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '299'),
    ),
    TrackModel(
      id: 17,
      title: 'Feel',
      artistName: 'Davido',
      releaseDate: DateTime(2023, 3, 31),
      duration: 202,
      description:
          'Davido turns up the heat with a swaggering Afrobeats banger that showcases his knack for crafting timeless party anthems with emotional depth.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/89/ec/07/89ec07d6-bc49-9e37-7eb2-98cf384ece2c/mzaf_757461899043186347.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/40/12/87/4012878d-d267-09b8-7fe0-8c3fd8fdf169/886449553617.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats',
        mood: 'Party',
        instrumentation: ['Talking Drum', 'Guitar', 'Bass', 'Claps'],
        sceneSuitability: ['Club', 'Party', 'Festival'],
        build: 'Explosive',
        vocalType: 'Male Lead',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '299'),
    ),
    TrackModel(
      id: 18,
      title: 'Sungba',
      artistName: 'Asake',
      releaseDate: DateTime(2022, 6, 10),
      duration: 191,
      description:
          'The record that announced Asake to the world. A hypnotic Afrobeats-Fuji hybrid that went viral and established his instantly recognizable sound.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/c1/9d/a0/c19da06c-22fa-e00f-3f6c-24e29ffad9a9/mzaf_12387587556846704305.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/15/df/2f/15df2f12-e18b-b114-8bfb-3c6183dc966f/194690805264_cover.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrobeats / Fuji',
        mood: 'Confident',
        instrumentation: ['Bass', 'Guitar', 'Talking Drum', 'Synth'],
        sceneSuitability: ['Club', 'Late Night', 'Hype'],
        build: 'Steady',
        vocalType: 'Male Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 19,
      title: 'Terminator',
      artistName: 'King Promise',
      releaseDate: DateTime(2023, 10, 6),
      duration: 185,
      description:
          'King Promise brings his Highlife-infused Afropop charm to this silky, guitar-driven record. His vocal range and natural charisma shine throughout.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/27/2b/ab/272babce-4cd5-c77c-a09f-3b6ad206b216/mzaf_12473158194572398578.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/44/00/1a/44001a9f-db79-c9ac-045b-6c6b717b8f0d/196871678414.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop / Highlife',
        mood: 'Romantic',
        instrumentation: ['Guitar', 'Horns', 'Bass', 'Drums'],
        sceneSuitability: ['Date Night', 'Evening', 'Chill'],
        build: 'Gradual',
        vocalType: 'Male Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '199'),
    ),
    TrackModel(
      id: 20,
      title: 'Julia',
      artistName: 'Ayra Starr',
      releaseDate: DateTime(2023, 12, 8),
      duration: 197,
      description:
          'Ayra Starr blends Afropop with alt-R&B influences in this introspective track. Her storytelling is vivid and her voice has never sounded better.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/00/68/81/006881a3-f8d9-c838-7140-ecb4bd48e0db/mzaf_12801853916686278238.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/85/c8/c6/85c8c647-4c7f-8e55-f435-4a8f7c741019/196589588821.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop / R&B',
        mood: 'Introspective',
        instrumentation: ['Piano', 'Bass', 'Soft Drums', 'Strings'],
        sceneSuitability: ['Late Night', 'Chill', 'Drive'],
        build: 'Gradual',
        vocalType: 'Female Lead',
        tempo: 'Slow',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 21,
      title: 'Try Me',
      artistName: 'Tems',
      releaseDate: DateTime(2020, 7, 17),
      duration: 209,
      description:
          'The record that introduced the world to Tems. A sultry, guitar-driven Afropop breakout that established her as one of the genre\'s most compelling voices.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/20/20/e9/2020e95d-30d0-e332-3580-d9f303f0e282/mzaf_14044068381155205848.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/2a/aa/b4/2aaab42a-a4cb-a600-4a25-d78961495960/18UMGIM17204.rgb.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop / R&B',
        mood: 'Sensual',
        instrumentation: ['Electric Guitar', 'Bass', 'Drum Machine', 'Reverb'],
        sceneSuitability: ['Late Night', 'Date Night', 'Chill'],
        build: 'Gradual',
        vocalType: 'Female Lead',
        tempo: 'Slow',
      ),
      license: LicenseModel(amount: '299'),
    ),
    TrackModel(
      id: 22,
      title: 'Understand',
      artistName: 'Omah Lay',
      releaseDate: DateTime(2021, 5, 28),
      duration: 176,
      description:
          'Omah Lay brings his signature melodic Afropop style to this danceable, percussion-heavy track. Emotional and groove-driven in equal measure.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/a3/87/2a/a3872abf-2fb4-2c00-47a9-45dfcba43b01/mzaf_12417728789903436232.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/e2/b2/11/e2b211b8-f0f1-eb5f-e1b9-96add18831c7/093624865452.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Energetic',
        instrumentation: ['Percussion', 'Bass', 'Guitar', 'Synth'],
        sceneSuitability: ['Club', 'Party', 'Festival'],
        build: 'Explosive',
        vocalType: 'Male Lead',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '199'),
    ),
    TrackModel(
      id: 23,
      title: 'HABA',
      artistName: 'Burna Boy ft. J Balvin',
      releaseDate: DateTime(2024, 5, 31),
      duration: 214,
      description:
          'Afrofusion meets Latin flavor as Burna Boy teams up with reggaeton legend J Balvin. The cross-genre collaboration is infectious and undeniably danceable.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/94/2e/53/942e53b3-30db-b192-2a85-716b48b4f877/mzaf_1075022031316496751.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/8d/58/f1/8d58f169-5f12-3574-3ba1-3a482eefe459/075679849304.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afrofusion / Latin',
        mood: 'Energetic',
        instrumentation: ['Bass', 'Drum Machine', 'Guitar', 'Congas'],
        sceneSuitability: ['Club', 'Party', 'Festival'],
        build: 'Steady',
        vocalType: 'Male Duet',
        tempo: 'Uptempo',
      ),
      license: LicenseModel(amount: '349'),
    ),
    TrackModel(
      id: 24,
      title: 'Away',
      artistName: 'Oxlade',
      releaseDate: DateTime(2022, 3, 4),
      duration: 193,
      description:
          'Oxlade\'s honeyed voice floats over a breezy Afropop production in this feel-good escape anthem. Carefree, sun-drenched, and utterly irresistible.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/77/31/1b/77311be2-80c1-866b-f97b-aeca6e40370c/mzaf_10874821233532043915.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/0c/ac/53/0cac53b8-8b3f-4d79-d5d9-8654c38dbae0/886448975717.jpg/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Carefree',
        instrumentation: ['Guitar', 'Soft Bass', 'Pad Synth', 'Hi-Hat'],
        sceneSuitability: ['Daytime', 'Summer', 'Road Trip'],
        build: 'Gradual',
        vocalType: 'Male Lead',
        tempo: 'Mid-Tempo',
      ),
      license: LicenseModel(amount: '249'),
    ),
    TrackModel(
      id: 25,
      title: 'Carry Me',
      artistName: 'Victony',
      releaseDate: DateTime(2023, 4, 21),
      duration: 181,
      description:
          'Victony\'s smooth vocals float effortlessly over a minimal Afropop beat in this heartfelt love song. A slow-burning gem from one of Nigeria\'s most promising new acts.',
      trackUrl:
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/bc/55/3d/bc553deb-ca8a-bb11-ca9c-b7856f2314b5/mzaf_10832397129994214467.plus.aac.p.m4a',
      coverArtUrl: _art(
          'https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/7d/5c/46/7d5c46e9-9fec-f101-0cc4-b8f7aae03c0f/0757572943135.png/100x100bb.jpg'),
      metadata: TrackMetadata(
        genre: 'Afropop',
        mood: 'Romantic',
        instrumentation: ['Guitar', 'Soft Bass', 'Whisper Pad', 'Soft Drum'],
        sceneSuitability: ['Date Night', 'Chill', 'Late Night'],
        build: 'Gradual',
        vocalType: 'Male Lead',
        tempo: 'Slow',
      ),
      license: LicenseModel(amount: '149'),
    ),
  ];

  static TracksResponse get response => TracksResponse(
        tracks: all,
        totalCount: all.length,
        currentPage: 1,
        totalPages: 1,
        hasNextPage: false,
        hasPreviousPage: false,
      );
}
