import 'package:flutter/material.dart';

import '../../core/color.dart';
import '../../core/responsive.dart' show Responsive;
import '../../controller/track/track_creation_service.dart';

class CreateTrackScreen extends StatefulWidget {
  const CreateTrackScreen({super.key});

  @override
  State<CreateTrackScreen> createState() => _CreateTrackScreenState();
}

class _CreateTrackScreenState extends State<CreateTrackScreen> {
  late final TrackCreationService _trackCreationService;

  @override
  void initState() {
    super.initState();
    _trackCreationService = TrackCreationService.fromServiceLocator;
  }

  Future<void> _uploadTrack() async {
    // Pick audio file
    final file = await _trackCreationService.pickAudioFile();
    if (file != null) {
      setState(() {});

      // Extract metadata
      await _trackCreationService.extractMetadata();
      setState(() {});
    }
  }

  Future<void> _saveTrack() async {
    final success = await _trackCreationService.saveTrack();
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Track saved successfully!')),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _trackCreationService.errorMessage ?? 'Failed to save track',
          ),
        ),
      );
    }
  }

  void _resetTrack() {
    _trackCreationService.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_trackCreationService.hasFile) ...[
              Spacer(flex: 2),
              Center(
                child: Column(
                  children: [
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
                      style: TextStyle(
                        color: ModernColors.textSecondary,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 40,
                      child: TextButton(
                        onPressed: _trackCreationService.isLoading
                            ? null
                            : _uploadTrack,
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
                        child: _trackCreationService.isLoading
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
                                "Browse files",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    if (_trackCreationService.errorMessage != null) ...[
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
                          _trackCreationService.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Spacer(flex: 3),
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
              if (_trackCreationService.hasTrack) ...[
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
                      _buildMetadataRow(
                        'Title',
                        _trackCreationService.currentTrackModel!.title,
                      ),
                      _buildMetadataRow(
                        'Artist',
                        _trackCreationService.currentTrackModel!.artistName,
                      ),
                      _buildMetadataRow(
                        'Genre',
                        _trackCreationService.currentTrackModel!.metadata.genre,
                      ),
                      _buildMetadataRow(
                        'Duration',
                        _trackCreationService.formatDuration(
                          _trackCreationService.currentTrackModel!.duration,
                        ),
                      ),
                      _buildMetadataRow(
                        'Release Year',
                        _trackCreationService
                            .currentTrackModel!
                            .releaseDate
                            .year
                            .toString(),
                      ),
                      if (_trackCreationService
                          .currentTrackModel!
                          .description
                          .isNotEmpty)
                        _buildMetadataRow(
                          'Description',
                          _trackCreationService.currentTrackModel!.description,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _resetTrack,
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
                        onPressed: _saveTrack,
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
}
