import 'package:get/get.dart';

import '../../../../core/widgets/dialog_widget.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/company_entity.dart';
import '../../domain/repositories/company_repostory.dart';

class CompanyPublicController extends GetxController {
  final _companyRepository = sl<CompanyRepository>();

  final isLoading = false.obs;

  late CompanyEntity company;

  @override
  void onInit() async {
    await getCompany();
    super.onInit();
  }

  Future<void> getCompany() async {
    isLoading.value = true;
    final res = await _companyRepository.get();
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => company = r,
    );
    isLoading.value = false;
  }
}
