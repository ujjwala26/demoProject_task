import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  bool _isLoading = true;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          SfPdfViewer.network(
            'https://arxiv.org/pdf/quant-ph/0410100.pdf',
            enableDocumentLinkAnnotation: false,
            enableDoubleTapZooming: false,
            enableHyperlinkNavigation: false,
            enableTextSelection: false,
            onDocumentLoaded: (_) {
              setState(() => _isLoading = false);
            },
            // onDocumentLoadFailed: (details) {
            //   setState(() {
            //     _isLoading = false;
               
            //   });
            // },
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
          
           
        ],
      ),
    );
  }
}
