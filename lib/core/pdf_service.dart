import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:afrosync/view/widget/pdf_viewer_widget.dart';

/// Service for handling PDF operations
///
/// This service manages PDF file operations including copying assets to
/// temporary directories and opening PDFs in external viewers.
class PdfService {
  static final PdfService _instance = PdfService._();

  static PdfService get instance => _instance;

  /// Get the instance from service locator (preferred method)
  static PdfService get fromServiceLocator => GetIt.instance<PdfService>();

  PdfService._();

  /// Copy an asset PDF to a temporary directory and return the file path
  Future<String?> copyAssetToTemp(String assetPath) async {
    try {
      // Load the asset as bytes
      final ByteData data = await rootBundle.load(assetPath);
      final List<int> bytes = data.buffer.asUint8List();

      // Get the temporary directory
      final Directory tempDir = await getTemporaryDirectory();
      final String fileName = assetPath.split('/').last;
      final File tempFile = File('${tempDir.path}/$fileName');

      // Write the bytes to the temporary file
      await tempFile.writeAsBytes(bytes);

      if (kDebugMode) {
        print('PDF copied to: ${tempFile.path}');
      }

      return tempFile.path;
    } catch (e) {
      if (kDebugMode) {
        print('Error copying PDF asset: $e');
      }
      return null;
    }
  }

  /// Open a PDF file from assets in a modal bottom sheet
  Future<bool> openAssetPdf(
    String assetPath, {
    BuildContext? context,
    String title = 'Document',
  }) async {
    try {
      if (context == null) {
        if (kDebugMode) {
          print('Context is required to show PDF modal');
        }
        return false;
      }

      // Show PDF in modal bottom sheet
      showPdfModal(context: context, assetPath: assetPath, title: title);

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error opening asset PDF: $e');
      }
      return false;
    }
  }

  /// Open a PDF file from file path
  Future<bool> openPdfFile(String filePath) async {
    try {
      if (kIsWeb) {
        // For web, we'll use a different approach
        return await _openPdfOnWeb(filePath);
      } else {
        // For mobile/desktop, use the platform's default PDF viewer
        return await _openPdfOnNative(filePath);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error opening PDF file: $e');
      }
      return false;
    }
  }

  /// Open PDF on web platform (not used in modal approach)
  Future<bool> _openPdfOnWeb(String filePath) async {
    // This method is not used when showing PDFs in modal bottom sheets
    return false;
  }

  /// Open PDF on native platforms (not used in modal approach)
  Future<bool> _openPdfOnNative(String filePath) async {
    // This method is not used when showing PDFs in modal bottom sheets
    return false;
  }

  /// Get the license agreement PDF path
  String get licenseAgreementPath => 'assets/license.pdf';

  /// Open the license agreement PDF in a modal bottom sheet
  Future<bool> openLicenseAgreement({BuildContext? context}) async {
    if (context == null) {
      if (kDebugMode) {
        print('Context is required to show license agreement');
      }
      return false;
    }

    return await openAssetPdf(
      licenseAgreementPath,
      context: context,
      title: 'License Agreement',
    );
  }
}
