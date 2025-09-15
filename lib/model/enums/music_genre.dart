enum MusicGenre {
  // Major
  pop(id: 1, displayName: 'Pop'),
  electronic(id: 2, displayName: 'Electronic'),
  gospel(id: 3, displayName: 'Gospel/Christian'),

  // African
  amapiano(id: 4, displayName: 'Amapiano'),
  afroBeats(id: 5, displayName: 'AfroBeats'),
  rnbSoul(id: 6, displayName: 'R&B/Soul'),
  highlife(id: 7, displayName: 'Highlife'),
  juju(id: 8, displayName: 'Juju'),
  fuji(id: 9, displayName: 'Fuji'),
  makossa(id: 10, displayName: 'Makossa'),
  soukous(id: 11, displayName: 'Soukous'),
  kwaito(id: 12, displayName: 'Kwaito'),
  bongoFlava(id: 13, displayName: 'Bongo Flava'),
  other(id: 99, displayName: 'Other');

  const MusicGenre({required this.id, required this.displayName});

  final int id;
  final String displayName;
}
