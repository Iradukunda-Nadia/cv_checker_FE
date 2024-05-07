
import 'package:cv_checker/JobSeeker/createPDF.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class CvPDF extends StatefulWidget {
  const CvPDF({Key? key}) : super(key: key);

  @override
  State<CvPDF> createState() => _CvPDFState();
}

class _CvPDFState extends State<CvPDF> {

  void _showPrintedToast(BuildContext context) {
    CommonService().showSnack(context, 'Document printed successfully');
  }

  void _showSharedToast(BuildContext context) {
    CommonService().showSnack(context, 'Document shared successfully');
  }


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF CV'),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => generateResume(format, user.cv),
        onPrinted: _showPrintedToast,
        onShared: _showSharedToast,
      ),
    );
  }
}
