import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../utils/app_const/icon_const.dart';
import 'model/treatment_item_model.dart';

class AyurvedaInvoiceGenerator {
  static Future<void> generateInvoice({
    required String patientName,
    required String address,
    required String whatsappNumber,
    required String bookedOn,
    required String treatmentDate,
    required String treatmentTime,
    required List<TreatmentItem> treatments,
    required double discount,
    required double advance,
  }) async {
    final pdf = pw.Document();

    // Load image data before building PDF
    final ByteData bytes1 = await rootBundle.load(appIcon);
    final Uint8List imageData1 = bytes1.buffer.asUint8List();
    final ByteData bytes2 = await rootBundle.load(sigingture);
    final Uint8List imageData2 = bytes2.buffer.asUint8List();

    // Calculate totals
    double totalAmount = treatments.fold(0, (sum, item) => sum + item.total);
    double balance = totalAmount - discount - advance;

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(40),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(imageData1),
              pw.SizedBox(height: 30),

              // Patient Details Section
              _buildPatientDetails(
                patientName,
                address,
                whatsappNumber,
                bookedOn,
                treatmentDate,
                treatmentTime,
              ),
              pw.SizedBox(height: 30),

              // Treatment Table
              _buildTreatmentTable(treatments),
              pw.SizedBox(height: 20),

              // Summary Section
              _buildSummary(totalAmount, discount, advance, balance),
              pw.SizedBox(height: 40),

              // Thank You Message
              _buildThankYouMessage(imageData2),

              pw.Spacer(),

              // Footer Note
              _buildFooterNote(),
            ],
          );
        },
      ),
    );

    // Save or print the PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  static pw.Widget _buildHeader(Uint8List imageData) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Logo placeholder (you can add your logo here)
        pw.Container(
          width: 80,
          height: 80,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.green, width: 2),
            borderRadius: pw.BorderRadius.circular(40),
          ),
          child: pw.ClipRRect(
            horizontalRadius: 40,
            verticalRadius: 40,
            child: pw.Image(pw.MemoryImage(imageData), fit: pw.BoxFit.cover),
          ),
        ),
        // Address Section
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(
              'KUMARAKOM',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              'Cheepunkal P.O, Kumarakom, kottayam, Kerala - 686563',
              style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
            ),
            pw.SizedBox(height: 3),
            pw.Text(
              'e-mail: unknown@gmail.com',
              style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
            ),
            pw.SizedBox(height: 3),
            pw.Text(
              'Mob: +91 9876543210 | +91 9876543210',
              style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
            ),
            pw.SizedBox(height: 3),
            pw.Text(
              'GST No: 32AABCU9603R1ZW',
              style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
            ),
          ],
        ),
      ],
    );
  }

  static pw.Widget _buildPatientDetails(
    String name,
    String address,
    String whatsappNumber,
    String bookedOn,
    String treatmentDate,
    String treatmentTime,
  ) {
    return pw.Container(
      padding: pw.EdgeInsets.all(15),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300),
        borderRadius: pw.BorderRadius.circular(5),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Patient Details',
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.green,
            ),
          ),
          pw.SizedBox(height: 15),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Name', name),
                    pw.SizedBox(height: 10),
                    _buildDetailRow('Address', address),
                    pw.SizedBox(height: 10),
                    _buildDetailRow('WhatsApp Number', whatsappNumber),
                  ],
                ),
              ),
              pw.SizedBox(width: 40),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Booked On', bookedOn),
                    pw.SizedBox(height: 10),
                    _buildDetailRow('Treatment Date', treatmentDate),
                    pw.SizedBox(height: 10),
                    _buildDetailRow('Treatment Time', treatmentTime),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildDetailRow(String label, String value) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 120,
          child: pw.Text(
            label,
            style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.Expanded(
          child: pw.Text(
            value,
            style: pw.TextStyle(fontSize: 11, color: PdfColors.grey700),
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildTreatmentTable(List<TreatmentItem> treatments) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey300),
      children: [
        // Header Row
        pw.TableRow(
          decoration: pw.BoxDecoration(color: PdfColors.grey200),
          children: [
            _buildTableCell('Treatment', isHeader: true),
            _buildTableCell('Price', isHeader: true),
            _buildTableCell('Male', isHeader: true),
            _buildTableCell('Female', isHeader: true),
            _buildTableCell('Total', isHeader: true),
          ],
        ),
        // Data Rows
        ...treatments.map(
          (item) => pw.TableRow(
            children: [
              _buildTableCell(item.name),
              _buildTableCell('₹${item.price}'),
              _buildTableCell('${item.maleCount}'),
              _buildTableCell('${item.femaleCount}'),
              _buildTableCell('₹${item.total.toStringAsFixed(0)}'),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildTableCell(String text, {bool isHeader = false}) {
    return pw.Container(
      padding: pw.EdgeInsets.all(10),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: isHeader ? 12 : 11,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: isHeader ? PdfColors.green : PdfColors.grey800,
        ),
      ),
    );
  }

  static pw.Widget _buildSummary(
    double totalAmount,
    double discount,
    double advance,
    double balance,
  ) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Container(
        width: 300,
        child: pw.Column(
          children: [
            _buildSummaryRow(
              'Total Amount',
              '₹${totalAmount.toStringAsFixed(0)}',
            ),
            pw.Divider(color: PdfColors.grey300),
            _buildSummaryRow('Discount', '₹${discount.toStringAsFixed(0)}'),
            pw.Divider(color: PdfColors.grey300),
            _buildSummaryRow('Advance', '₹${advance.toStringAsFixed(0)}'),
            pw.Divider(color: PdfColors.grey300),
            _buildSummaryRow(
              'Balance',
              '₹${balance.toStringAsFixed(0)}',
              isBold: true,
            ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _buildSummaryRow(
    String label,
    String value, {
    bool isBold = false,
  }) {
    return pw.Padding(
      padding: pw.EdgeInsets.symmetric(vertical: 5),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            label,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildThankYouMessage(Uint8List imageData) {
    return pw.Padding(padding: pw.EdgeInsets.only(left: 150),
   child:
     pw.Column(
      children: [
        pw.Text(
          'Thank you for choosing us',
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.green,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          "Your well-being is our commitment, and we're honored\nyou've entrusted us with your health journey",
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(fontSize: 11, color: PdfColors.grey600),
        ),
        pw.SizedBox(height: 20),
        // Signature
        pw.Container(
          alignment: pw.Alignment.centerRight,
          padding: pw.EdgeInsets.only(right: 140),
          child: pw.ClipRRect(
            horizontalRadius: 40,
            verticalRadius: 40,
            child: pw.Image(
              pw.MemoryImage(imageData),
              width: 80, // Set your desired width
              height: 80, // Set your desired height
              // fit: pw.BoxFit.cover,
            ),
          ),
        ),
      ],
    )
    );
   
  }

  static pw.Widget _buildFooterNote() {
    return pw.Container(
      padding: pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300),
        borderRadius: pw.BorderRadius.circular(5),
      ),
      child: pw.Text(
        '"Booking amount is non-refundable, and it\'s important to arrive on the allotted time for your treatment"',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          fontSize: 9,
          color: PdfColors.grey600,
          fontStyle: pw.FontStyle.italic,
        ),
      ),
    );
  }
}
