import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'dart:io';

import '../../core/color.dart';
import '../../core/responsive.dart' show Responsive;
import '../../model/track_model.dart';
import '../../model/track_metadata.dart';

class CreateTrackScreen extends StatefulWidget {
  const CreateTrackScreen({super.key});

  @override
  State<CreateTrackScreen> createState() => _CreateTrackScreenState();
}

class _CreateTrackScreenState extends State<CreateTrackScreen> {
  File? trackFile;
  TrackModel? trackModel;
  bool isLoading = false;
  String? errorMessage;

  Future<void> _uploadTrack() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      // Pick audio file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);

        // Extract metadata using audio_metadata_reader
        final metadata = readMetadata(file, getImage: true);

        // Create TrackModel from metadata
        final track = TrackModel(
          id: DateTime.now().millisecondsSinceEpoch,
          // Temporary ID
          title: metadata.title ?? 'Unknown Title',
          artistName: metadata.artist ?? 'Unknown Artist',
          description: metadata.album ?? '',
          // Using album as description fallback
          duration: metadata.duration?.inSeconds ?? 0,
          trackUrl: file.path,
          // Local file path for now
          coverArtUrl: '',
          // Album art not available in this version
          releaseDate: DateTime(
            metadata.year is int ? metadata.year as int : DateTime.now().year,
          ),
          metadata: TrackMetadata(
            genre: 'Unknown',
            // Genre not available in this version
            mood: 'Unknown',
            // Not available in metadata
            instrumentation: [],
            // Not available in metadata
            sceneSuitability: [],
            // Not available in metadata
            build: 'Unknown',
            // Not available in metadata
            vocalType: 'Unknown',
            // Not available in metadata
            tempo: 'Unknown',
            // Not available in metadata
            instrumentalOnly: false,
            // Not available in metadata
            lyricalOnly: false, // Not available in metadata
          ),
        );

        setState(() {
          trackFile = file;
          trackModel = track;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'No file selected';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error uploading track: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Track'),
        backgroundColor: ModernColors.background,
        foregroundColor: ModernColors.text,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (trackFile == null) ...[
              Spacer(),
              Center(
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.double_music_note,
                      size: 64,
                      color: ModernColors.textSecondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Upload your track',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ModernColors.text,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select an audio file to extract metadata and create your track',
                      style: TextStyle(color: ModernColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: isLoading ? null : _uploadTrack,
                        style: TextButton.styleFrom(
                          padding: isMobile
                              ? const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 16,
                                )
                              : null,
                          backgroundColor: ModernColors.activeBlue,
                          foregroundColor: ModernColors.white,
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator.adaptive(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : const Text(
                                "Upload Track",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    if (errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.red.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Spacer(flex: 2),
            ] else ...[
              // Track details section
              Text(
                'Track Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ModernColors.text,
                ),
              ),
              const SizedBox(height: 20),
              if (trackModel != null) ...[
                // Show extracted metadata
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ModernColors.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: ModernColors.textSecondary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMetadataRow('Title', trackModel!.title),
                      _buildMetadataRow('Artist', trackModel!.artistName),
                      _buildMetadataRow('Genre', trackModel!.metadata.genre),
                      _buildMetadataRow(
                        'Duration',
                        _formatDuration(trackModel!.duration),
                      ),
                      _buildMetadataRow(
                        'Release Year',
                        trackModel!.releaseDate.year.toString(),
                      ),
                      if (trackModel!.description.isNotEmpty)
                        _buildMetadataRow(
                          'Description',
                          trackModel!.description,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            trackFile = null;
                            trackModel = null;
                            errorMessage = null;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: ModernColors.text,
                          side: BorderSide(color: ModernColors.textSecondary),
                        ),
                        child: const Text('Upload Another'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Save track to database/API
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Track saved successfully!'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ModernColors.primary,
                          foregroundColor: ModernColors.white,
                        ),
                        child: const Text('Save Track'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                color: ModernColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: ModernColors.text,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
