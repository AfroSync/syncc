import 'dart:io';
import 'package:afrosync/model/license_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:afrosync/model/track_model.dart';
import 'package:afrosync/model/track_metadata.dart';
import 'package:afrosync/model/basic_license.dart';
import 'package:afrosync/api/api_service.dart';
import 'package:afrosync/core/permissions_service.dart';

/// Service for handling track creation and metadata extraction
///
/// This service manages the track creation process including file picking,
/// metadata extraction, and track model creation.
class TrackCreationService {
  static final TrackCreationService _instance = TrackCreationService._();

  static TrackCreationService get instance => _instance;

  /// Get the instance from service locator (preferred method)
  static TrackCreationService get fromServiceLocator =>
      GetIt.instance<TrackCreationService>();

  TrackCreationService._();

  /// Current track file being processed
  File? _currentTrackFile;

  /// Current track model being created
  TrackModel? _currentTrackModel;

  /// Loading state
  bool _isLoading = false;

  /// Error message
  String? _errorMessage;

  /// Uploaded track URL from server
  String? _uploadedTrackUrl;

  /// Uploaded cover art URL from server
  String? _uploadedCoverArtUrl;

  // Getters
  File? get currentTrackFile => _currentTrackFile;

  TrackModel? get currentTrackModel => _currentTrackModel;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  bool get hasTrack => _currentTrackModel != null;

  bool get hasFile => _currentTrackFile != null;

  String? get uploadedTrackUrl => _uploadedTrackUrl;

  String? get uploadedCoverArtUrl => _uploadedCoverArtUrl;

  /// Pick an audio file from the device
  Future<File?> pickAudioFile() async {
    try {
      _setLoading(true);
      _clearError();

      // Check and request storage permission
      final permissionsService = GetIt.instance<PermissionsService>();

      final hasPermission = await permissionsService.hasStoragePermission();

      if (!hasPermission) {
        final granted = await permissionsService.requestStoragePermission();
        if (!granted) {
          _setError('Storage permission is required to select audio files');
          return null;
        }
      }

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        _currentTrackFile = File(result.files.single.path!);
        return _currentTrackFile;
      }

      return null;
    } catch (e) {
      _setError('Error picking file: $e');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  /// Extract metadata from the current track file
  Future<TrackModel?> extractMetadata() async {
    if (_currentTrackFile == null) {
      _setError('No file selected');
      return null;
    }

    try {
      _setLoading(true);
      _clearError();

      // Extract metadata using audio_metadata_reader
      final metadata = readMetadata(_currentTrackFile!, getImage: true);

      // Create TrackModel from metadata
      _currentTrackModel = TrackModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: metadata.title ?? 'Unknown Title',
        artistName: metadata.artist ?? 'Unknown Artist',
        description: metadata.album ?? '',
        duration: metadata.duration?.inSeconds ?? 0,
        trackUrl: _currentTrackFile!.path,
        coverArtUrl: '',
        // Album art not available in this version
        releaseDate: DateTime(
          metadata.year is int ? metadata.year as int : DateTime.now().year,
        ),
        metadata: TrackMetadata(
          genre: 'Unknown',
          // Genre not available in this version
          mood: 'Unknown',
          instrumentation: [],
          sceneSuitability: [],
          build: 'Unknown',
          vocalType: 'Unknown',
          tempo: 'Unknown',
          instrumentalOnly: false,
          lyricalOnly: false,
        ),
        license: const LicenseModel(), // Use default license
      );

      return _currentTrackModel;
    } catch (e) {
      _setError('Error extracting metadata: $e');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  /// Upload the current track file to the server
  Future<bool> uploadTrackFile() async {
    if (_currentTrackFile == null) {
      _setError('No file selected');
      return false;
    }

    try {
      _setLoading(true);
      _clearError();

      // Get API service from service locator
      final apiService = GetIt.instance<ApiService>();

      // Upload the audio file
      final response = await apiService.tracks.uploadAudioFile(
        _currentTrackFile!,
      );

      if (response.success && response.data != null) {
        // Extract the uploaded file URL from the response
        // The response structure may vary, adjust based on your API response
        _uploadedTrackUrl =
            response.data!['url'] ??
            response.data!['file_url'] ??
            response.data!['track_url'];

        if (kDebugMode) {
          print('Track uploaded successfully: $_uploadedTrackUrl');
        }

        return true;
      } else {
        _setError(response.error ?? 'Failed to upload track');
        return false;
      }
    } catch (e) {
      _setError('Error uploading track: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Pick a cover art image from the device
  Future<File?> pickCoverArtImage() async {
    try {
      _setLoading(true);
      _clearError();

      // Check and request storage permission
      final permissionsService = GetIt.instance<PermissionsService>();
      final hasPermission = await permissionsService.hasStoragePermission();

      if (!hasPermission) {
        final granted = await permissionsService.requestStoragePermission();
        if (!granted) {
          _setError(
            'Storage permission is required to select cover art images',
          );
          return null;
        }
      }

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }

      return null;
    } catch (e) {
      _setError('Error picking cover art image: $e');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  /// Upload a cover art image file to the server
  Future<bool> uploadCoverArtFile(File imageFile) async {
    try {
      _setLoading(true);
      _clearError();

      // Get API service from service locator
      final apiService = GetIt.instance<ApiService>();

      // Upload the image file
      final response = await apiService.tracks.uploadImageFile(imageFile);

      if (response.success && response.data != null) {
        // Extract the uploaded file URL from the response
        _uploadedCoverArtUrl =
            response.data!['url'] ??
            response.data!['file_url'] ??
            response.data!['image_url'];

        if (kDebugMode) {
          print('Cover art uploaded successfully: $_uploadedCoverArtUrl');
        }

        return true;
      } else {
        _setError(response.error ?? 'Failed to upload cover art');
        return false;
      }
    } catch (e) {
      _setError('Error uploading cover art: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Save the current track to the API
  Future<bool> saveTrack() async {
    if (_currentTrackModel == null) {
      _setError('No track to save');
      return false;
    }

    try {
      _setLoading(true);
      _clearError();

      // Get API service from service locator
      final apiService = GetIt.instance<ApiService>();

      // Prepare the request data according to the API specification
      final response = await apiService.tracks.createTrack(
        title: _currentTrackModel!.title,
        metadata: _currentTrackModel!.metadata.toJson(),
        releaseDate: _currentTrackModel!.releaseDate.toIso8601String().split(
          'T',
        )[0],
        duration: _currentTrackModel!.duration,
        description: _currentTrackModel!.description,
        trackUrl: _uploadedTrackUrl ?? _currentTrackModel!.trackUrl,
        coverArtUrl: _uploadedCoverArtUrl ?? _currentTrackModel!.coverArtUrl,
        // license: _currentTrackModel!.license.toJson(),
        // Note: trackPublicId and coverArtPublicId are optional and not provided here
        // They would typically come from file upload services like Cloudinary
      );

      if (response.success && response.data != null) {
        // Update the current track model with the response from the server
        _currentTrackModel = response.data!;

        if (kDebugMode) {
          print('Track saved successfully: ${_currentTrackModel!.id}');
        }

        return true;
      } else {
        _setError(response.error ?? 'Failed to save track');
        return false;
      }
    } catch (e) {
      _setError('Error saving track: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Reset the service state
  void reset() {
    _currentTrackFile = null;
    _currentTrackModel = null;
    _isLoading = false;
    _errorMessage = null;
    _uploadedTrackUrl = null;
    _uploadedCoverArtUrl = null;
  }

  /// Update track metadata manually
  void updateTrackMetadata({
    String? title,
    String? artistName,
    String? description,
    String? genre,
    String? mood,
  }) {
    if (_currentTrackModel == null) return;

    _currentTrackModel = _currentTrackModel!.copyWith(
      title: title ?? _currentTrackModel!.title,
      artistName: artistName ?? _currentTrackModel!.artistName,
      description: description ?? _currentTrackModel!.description,
      metadata: _currentTrackModel!.metadata.copyWith(
        genre: genre ?? _currentTrackModel!.metadata.genre,
        mood: mood ?? _currentTrackModel!.metadata.mood,
      ),
    );
  }

  /// Get formatted duration string
  String formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  /// Get file size in human readable format
  String getFileSize() {
    if (_currentTrackFile == null) return 'Unknown';

    final bytes = _currentTrackFile!.lengthSync();
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Get file extension
  String getFileExtension() {
    if (_currentTrackFile == null) return '';
    return _currentTrackFile!.path.split('.').last.toLowerCase();
  }

  /// Check if file type is supported
  bool isSupportedFileType() {
    final extension = getFileExtension();
    const supportedTypes = ['mp3', 'wav', 'aac', 'm4a', 'flac', 'ogg'];
    return supportedTypes.contains(extension);
  }

  // Private helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
  }

  void _setError(String error) {
    _errorMessage = error;
    if (kDebugMode) {
      print('TrackCreationService Error: $error');
    }
  }

  void _clearError() {
    _errorMessage = null;
  }
}
