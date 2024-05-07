/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:cv_checker/Classes/cvClass.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const PdfColor green = PdfColor.fromInt(0xffFF5454);
const PdfColor lightGreen = PdfColor.fromInt(0xffFFEBE2,);
const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format, CV  data) async {
  final doc = pw.Document(title: 'My Résumé', author: data.jobSeekerName);

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/avatar5.png')).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisSize: pw.MainAxisSize.min,
                children: <pw.Widget>[
                  pw.Container(
                    padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Text(data.jobSeekerName!,
                            textScaleFactor: 2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: pw.FontWeight.bold)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                        pw.Text("${data.jobSector?? "Rocket scientist"} "
                            "Specialist",
                            textScaleFactor: 1.2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: green)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                      ],
                    ),
                  ),

                  _Category(title: 'Work Experience'),
                  data.experience != [] && data.experience != null ?
                  pw.ListView.builder(
                    padding: const pw.EdgeInsets.all(0),
                    itemCount: data.experience!.length,
                    itemBuilder: (context, int index) {
                      var experience = data.experience![index];
                      return pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          _Block(
                              title: '${experience['jobRole']??''} - '
                                  '${experience['company']??""}',
                              description: '${experience['description']??''}',
                              dates: '${experience['startDate']??''} - '
                                  '${experience['endDate']??''}'
                          ),
                        ],
                      );
                    },
                  ): pw.Container(),

                  pw.SizedBox(height: 20),
                  _Category(title: 'Education'),
                  data.education != [] && data.education != null ?
                  pw.ListView.builder(
                    padding: const pw.EdgeInsets.all(0),
                    itemCount: data.education!.length,
                    itemBuilder: (context, int index) {
                      var education = data.education![index];
                      return pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          _Block(
                              title: '( '
                                  '${education['qualification']??''})',
                              description: '${education['title']??''}',
                              dates: '${education['startDate']??''} - '
                                  '${education['endDate']??''}'
                          ),
                        ],
                      );
                    },
                  ): pw.Container(),

                  pw.SizedBox(height: 20),
                  _Category(title: 'Special skills'),
                  data.skills != [] && data.skills != null ?
                  pw.ListView.builder(
                    padding: const pw.EdgeInsets.all(0),
                    itemCount: data.skills!.length,
                    itemBuilder: (context, int index) {
                      var skill = data.skills![index];
                      return pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          _Block(
                              title: '${skill??''}',
                              description: '',
                              dates: ''
                          ),
                        ],
                      );
                    },
                  ): pw.Container(),
                ],
              ),
            ),
            pw.Partition(
              width: sep,
              child: pw.Column(
                children: [
                  pw.Container(
                    height: pageTheme.pageFormat.availableHeight,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.ClipOval(
                          child: pw.Container(
                            width: 100,
                            height: 100,
                            color: lightGreen,
                            child: pw.Image(profileImage),
                          ),
                        ),
                        pw.Column(children: <pw.Widget>[
                          _Percent(size: 60, value: .7, title: pw.Text('Word')),
                          _Percent(
                              size: 60, value: .4, title: pw.Text('Excel')),
                        ]),
                        pw.BarcodeWidget(
                          data: data.email!,
                          width: 60,
                          height: 60,
                          barcode: pw.Barcode.qrCode(),
                          drawText: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.Container(
                width: 10,
                height: 100,
                color:  lightGreen
              ),
              left: 0,
              top: 0,
            ),

            pw.Positioned(
              child: pw.Container(
                  width: 10,
                  height: 70,
                  color:  lightGreen
              ),
              left: 25,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Container(
                  width: 10,
                  height: 70,
                  color:  lightGreen
              ),
              right: 25,
              bottom: 0,
            ),
            pw.Positioned(
              child: pw.Container(
                  width: 10,
                  height: 100,
                  color:  lightGreen
              ),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    this.icon,
    this.description,
    this.dates
  });

  final String title;

  final String? description;
  final String? dates;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  if (dates != null && dates != '') pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5, bottom: 5),
                    child: pw.Text(dates!)),
                  if (description != null && description != '') pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 5, bottom: 5),
                      child: pw.Text(description!)),

                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}