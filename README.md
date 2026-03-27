# Syncc — Music sync licensing for African creators 🎵🎬

Built in 4 days for ACM Hackathon 2025 — *Distribute Africa: Hacking the
Future of Music & Film Access*. We made it to the semifinals out of a
₦10,000,000 prize pool.

## Overview

Licensing music for film in Africa is broken. There's no standard process,
no catalog to browse, and if you want to use a Rema record in your short
film, you're probably sliding into someone's DMs and hoping for the best.

Syncc fixes that. Artists upload their catalog and set licensing terms
upfront. Filmmakers, producers, and ad agencies browse, preview, and
license tracks — with a proper contract, not a WhatsApp agreement.

The name is the idea: sync licensing, the formal process of pairing music
to moving image. We just made it accessible.

## 🎥 Demo

> [coming soon / link here]

## Features

- **Dual onboarding** — separate registration flows for artists and
  film producers, with genre selection, country, and email verification
- **Track catalog** — browsable grid with cover art, metadata, and
  30-second audio previews streamed from remote URLs
- **Structured licensing** — 10 negotiation categories (territory,
  exclusivity, usage rights, credit, renewal, and more), each with
  preset options and plain-language descriptions. No legal jargon,
  just radio buttons in a bottom sheet
- **License agreement viewer** — PDF contract displayed in-app before
  any deal is confirmed
- **Track upload pipeline** — file picker extracts title, artist, and
  duration automatically from the audio file, then uploads to backend
- **Responsive layout** — works across mobile, tablet, and desktop with
  4 breakpoints. Built Flutter web-first, not as an afterthought
- **Mock data fallback** — 25 real Afrobeats tracks with actual album
  art and preview audio, all without an API key. One flag to toggle
  between live and mock

## Technical Stack

- **Framework**: Flutter 3.x / Dart 3.9+ (iOS, Android, Web, Desktop)
- **Routing**: go_router — declarative, SEO-friendly URLs
- **Networking**: Dio with interceptors + multipart upload
- **DI**: GetIt as service locator
- **Audio**: audioplayers for 30-second preview streaming
- **File I/O**: file_picker + image_picker for audio and cover art
- **PDF**: flutter_pdfview for in-app license contract display
- **Typography**: FormaDJR (10 weights)

## Architecture

MVC-ish pattern with a service locator. Lightweight by design — no
heavy state management framework, just `ValueNotifier<T>` for auth and
audio state and GetIt for dependency injection.

```
lib/
├── api/          # Dio wrapper, ApiResponse<T>, auth + tracks endpoints
├── controller/   # Audio service, auth controller, track upload flow
├── core/         # Router, theme, colors, responsive breakpoints,
│                 # permissions, PDF service
├── model/        # TrackModel, LicenseModel, user types, enums
│                 # (14 African genres, 10 license term categories)
├── data/         # Mock tracks + toggle flag
└── view/         # Auth, catalog, license, track, profile, shared widgets
```

A few things worth calling out:

- **10-category contract model** — the real product thinking lives in
  `license_terms.dart`. Each category (`PaymentPresets`,
  `TerritoryPresets`, `ExclusivityPresets`, etc.) has named preset
  instances with full descriptions. This isn't demo smoke — it's a
  real licensing architecture.
- **iTunes Search API for mock data** — 25 actual Afrobeats tracks,
  real album art at 600×600, real 30-second previews. Zero API key
  required. A small URL helper swaps the default thumbnail size to
  full resolution.
- **Web-first optimizations** — custom page transitions, clamping
  scroll physics, image quality params, and debounce/throttle
  utilities. Flutter web was a first-class target, not a port.

## Installation

```bash
git clone <repo-url>
cd syncc
flutter pub get

# iOS only
cd ios && pod install && cd ..

# Run
flutter run                                    # default device
flutter run -d chrome --web-renderer html      # web
flutter run -d macos                           # macOS
```

Requirements: Flutter 3.x+, Dart 3.9.0+

To use mock data: set `useMockData = true` in `lib/data/mock_data.dart`.
The backend runs on an ngrok tunnel — if it's down, mock mode is your
friend.

## Gotchas

- **Backend is an ngrok tunnel** — the URL in `lib/api/base.dart` will
  be dead unless the backend is actively running. Toggle mock mode

## Known Limitations

4 days of building, honestly:

- No auth token persistence — restart means re-login
- No payment integration — the licensing flow stops before money moves
- Contract counter-offers are one-directional, no real-time negotiation
- File upload uses `dart:io` — won't work on web without conditional
  imports
- Zero meaningful test coverage

## Possible Improvements

- Paystack integration for the actual licensing payment step
- WebSocket support for real-time contract negotiation between parties
- Token persistence with flutter_secure_storage
- Offline catalog caching so browsing works without a connection
- Proper environment config — right now the API URL is hardcoded

## Team

3-person team — mobile (me, team lead), backend, and a business/pitch
lead. I built the entire Flutter app across the 4-day sprint and handled
a significant chunk of the product thinking.

---

Built for [ACM Hackathon 2025](https://acmhackathon.com) —
*Distribute Africa: Hacking the Future of Music & Film Access*,
organised by Africa Creative Market. Partners: AWS, CcHub, Ascend
Studios Foundation.

## 📌 Note

This is a personal fork of the team repository. The original repo is
private — this fork exists for portfolio purposes.