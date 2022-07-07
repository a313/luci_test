import 'package:flutter/material.dart';
import 'package:luci_test/core/util/constants.dart';
import 'package:luci_test/share_widgets/optional_dropdown_widget.dart';
import 'package:luci_test/theme/app_fonts.dart';

const options = <String>[
  'Đang hoạt động',
  'Đặt lại mật khẩu',
  'Xóa nhân sự',
];

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i.vietgiaitri.com/2012/5/3/xem-nuoc-mat-va-nu-cuoi-cua-kang-min-kyung-yoon-jung-hee-5d0128.jpg'),
        ),
        SIZED_BOX_W12,
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoàng Thu Hiền',
                  style: AppFonts.size15(fontWeight: FontWeight.bold),
                ),
                SIZED_BOX_H04,
                Text(
                  'Kế toán trưởng',
                  style: AppFonts.size11(),
                ),
                SIZED_BOX_H04,
                Text(
                  'Đang hoạt động',
                  style: AppFonts.size11(),
                ),
              ],
            ),
          ),
        ),
        SIZED_BOX_W08,
        const OptionalDropDownWidget(
          titleOptional: 'Tùy chọn',
          options: options,
        )
      ],
    );
  }
}
