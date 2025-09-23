import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:io';

/// Widget for displaying PDFs in a modal bottom sheet
class PdfViewerWidget extends StatefulWidget {
  final String assetPath;
  final String title;

  const PdfViewerWidget({
    super.key,
    required this.assetPath,
    this.title = 'Document',
  });

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  String? localPath;
  bool isReady = false;
  String errorMessage = '';
  int currentPage = 0;
  int totalPages = 0;
  PDFViewController? pdfController;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      // Load the asset as bytes
      final ByteData data = await rootBundle.load(widget.assetPath);
      final List<int> bytes = data.buffer.asUint8List();

      // Get the temporary directory
      final Directory tempDir = await getTemporaryDirectory();
      final String fileName = widget.assetPath.split('/').last;
      final File tempFile = File('${tempDir.path}/$fileName');

      // Write the bytes to the temporary file
      await tempFile.writeAsBytes(bytes);

      setState(() {
        localPath = tempFile.path;
        isReady = true;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error loading PDF: $e';
        isReady = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Icon(
                        CupertinoIcons.xmark_circle_fill,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              // Page indicator
              if (isReady && totalPages > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    'Page ${currentPage + 1} of $totalPages',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),

              // PDF content
              Expanded(child: _buildPdfContent()),

              // Bottom controls
              if (isReady && totalPages > 1)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          onPressed: currentPage > 0
                              ? () => pdfController?.setPage(currentPage - 1)
                              : null,
                          child: const Icon(CupertinoIcons.chevron_left),
                        ),
                      ),

                      Expanded(
                        child: CupertinoButton(
                          onPressed: currentPage < totalPages - 1
                              ? () => pdfController?.setPage(currentPage + 1)
                              : null,
                          child: const Icon(CupertinoIcons.chevron_right),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPdfContent() {
    if (!isReady) {
      return const Center(child: CupertinoActivityIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.doc_text, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (localPath == null) {
      return const Center(child: CupertinoActivityIndicator());
    }

    return PDFView(
      filePath: localPath!,
      enableSwipe: true,
      swipeHorizontal: false,
      autoSpacing: false,
      pageFling: true,
      pageSnap: true,
      onRender: (pages) {
        setState(() {
          totalPages = pages ?? 0;
        });
      },
      onViewCreated: (PDFViewController controller) {
        pdfController = controller;
      },
      onPageChanged: (int? page, int? total) {
        setState(() {
          currentPage = page ?? 0;
        });
      },
      onError: (error) {
        setState(() {
          errorMessage = 'Error loading PDF: $error';
        });
      },
    );
  }
}

/// Helper function to show PDF in a modal bottom sheet
void showPdfModal({
  required BuildContext context,
  required String assetPath,
  String title = 'Document',
}) {
  showDialog(
    context: context,
    useSafeArea: false,
    builder: (context) => PdfViewerWidget(assetPath: assetPath, title: title),
  );
}
