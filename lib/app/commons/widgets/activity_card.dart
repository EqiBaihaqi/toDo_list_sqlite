import 'package:flutter/material.dart';
import 'package:getx_pattern_architecture/app/style/style_color.dart';
import 'package:intl/intl.dart';

enum ActivityCardType { submissionData, transactionMonitoring }

class ActivityCard extends StatelessWidget {
  final ActivityCardType type;
  final String status;
  final VoidCallback? onTapDetail;
  final String? descriptionButton;

  // Submission Data
  final DateTime? submissionDateTime;
  final String? companyNameSubmission;
  final String? pic;
  final String? businessScaleSubmission;
  final String? uploadTimeSubmission;

  // Transaction Monitoring
  final DateTime? transactionDateTime;
  final String? name;
  final String? companyNameTransaction;
  final String? businessScaleTransaction;
  final String? productType;
  final String? uploadTimeTransaction;

  const ActivityCard({
    super.key,
    required this.type,
    required this.status,
    this.submissionDateTime,
    this.companyNameSubmission,
    this.pic,
    this.businessScaleSubmission,
    this.uploadTimeSubmission,
    this.transactionDateTime,
    this.name,
    this.companyNameTransaction,
    this.businessScaleTransaction,
    this.productType,
    this.uploadTimeTransaction,
    this.onTapDetail,
    this.descriptionButton,
  });

  static final Map<ActivityCardType, Map<String, Map<String, dynamic>>>
      statusStyles = {
    ActivityCardType.submissionData: {
      'submitted': {'color': CustomColor.blue500, 'text': 'Submitted'},
      'approved': {'color': CustomColor.green500, 'text': 'Approved'},
    },
    ActivityCardType.transactionMonitoring: {
      'raw leads': {'color': CustomColor.purple500, 'text': 'Raw Leads'},
      'potential leads': {
        'color': CustomColor.cyan500,
        'text': 'Potential Leads'
      },
      'introduction': {'color': CustomColor.orange500, 'text': 'Introduction'},
    },
  };

  Map<String, dynamic> _getStatusStyle(ActivityCardType type, String status) {
    return statusStyles[type]?[status.toLowerCase()] ??
        {'color': Colors.grey, 'text': status};
  }

  @override
  Widget build(BuildContext context) {
    final style = _getStatusStyle(type, status);

    final formattedDate =
        (type == ActivityCardType.submissionData && submissionDateTime != null)
            ? DateFormat('d MMMM yyyy').format(submissionDateTime!)
            : (transactionDateTime != null)
                ? DateFormat('d MMMM yyyy').format(transactionDateTime!)
                : '-';

    final uploadTime = (type == ActivityCardType.submissionData)
        ? (uploadTimeSubmission ?? '')
        : (uploadTimeTransaction ?? '');

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (type == ActivityCardType.submissionData) ...[
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: CustomColor.netral9,
                        fontSize: 14,
                      ),
                    ),
                  ] else ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          name ?? '-',
                          style: const TextStyle(
                            color: Color(0xFF8C8C8C),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: style['color'],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: Text(
                        style['text'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (type == ActivityCardType.submissionData) ...[
                _buildInfoRow('Company Name', companyNameSubmission ?? '-'),
                _buildInfoRow('PIC', pic ?? '-'),
                _buildInfoRow('Business Scale', businessScaleSubmission ?? '-'),
              ] else ...[
                _buildInfoRow('Company Name', companyNameTransaction ?? '-'),
                _buildInfoRow(
                    'Business Scale', businessScaleTransaction ?? '-'),
                _buildInfoRow('Product Type', productType ?? '-'),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFA31AF2), Color(0xFF1874A5)]),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: InkWell(
                      onTap: onTapDetail,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        child: Text(
                          descriptionButton ?? 'Detail Information',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: CustomColor.netral1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    uploadTime,
                    style: const TextStyle(
                        color: CustomColor.netral6, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(label,
                  style:
                      const TextStyle(color: Color(0xFF8C8C8C), fontSize: 12))),
          const Text(" : "),
          const SizedBox(width: 6),
          Expanded(
              flex: 3,
              child: Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 12))),
        ],
      ),
    );
  }
}
