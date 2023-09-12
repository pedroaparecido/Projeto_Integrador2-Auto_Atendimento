import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../company/presentation/controllers/company_public_controller.dart';
import '../../../cart/presentation/widgets/cart_body_widget.dart';
import '../widgets/public_menu_drawer_widget.dart';
import '../widgets/public_title_sub_pages_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const PublicMenuDrawerWidget(),
      body: CartBodyWidget(
        children: [
          const SizedBox(height: 50),
          const PublicTitleSubPagesWidget(
            title: 'QUEM SOMOS',
            description: 'Conheça mais sobre o Kako Serv Festas, nossa história, visão, missão e valores.',
          ),
          const SizedBox(height: 35),
          _AboutDescriptionAndImageWidget(screenWidth: screenWidth),
          const SizedBox(height: 60),
          _AboutMissionVisionValueWidget(screenWidth: screenWidth),
        ],
      ),
    );
  }
}

class _AboutMissionVisionValueWidget extends StatelessWidget {
  _AboutMissionVisionValueWidget({required double screenWidth}) : _screenWidth = screenWidth;

  final _companyController = Get.find<CompanyPublicController>();

  final double _screenWidth;

  @override
  Widget build(BuildContext context) {
    return _companyController.isLoading.value
        ? Container()
        : _screenWidth > 750
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/missao1.png',
                          height: 100,
                          width: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text('NOSSA MISSÃO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 50, left: 16, right: 16),
                          child: Text(_companyController.company.missao,
                              textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/visao.png',
                          height: 100,
                          width: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text('NOSSA VISÃO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 50, left: 16, right: 16),
                          child: Text(_companyController.company.visao,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/value.png',
                          height: 100,
                          width: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text('NOSSOS VALORES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 50, left: 16, right: 16),
                          child: Text(_companyController.company.valores,
                              textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/missao1.png',
                        height: 100,
                        width: 100,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text('NOSSA MISSÃO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 50, left: 16, right: 16),
                        child: Text(_companyController.company.missao,
                            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/visao.png',
                        height: 100,
                        width: 100,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text('NOSSA VISÃO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 50, left: 16, right: 16),
                        child: Text(_companyController.company.visao,
                            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/value.png',
                        height: 100,
                        width: 100,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text('NOSSOS VALORES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 50, left: 16, right: 16),
                        child: Text(_companyController.company.valores,
                            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              );
  }
}

class _AboutDescriptionAndImageWidget extends StatelessWidget {
  const _AboutDescriptionAndImageWidget({required double screenWidth}) : _screenWidth = screenWidth;

  final double _screenWidth;

  @override
  Widget build(BuildContext context) {
    return _screenWidth > 750
        ? Container(
            color: Colors.black45,
            child: Row(
              children: [
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80, right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Kako Serv Festas',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 28, color: Colors.white),
                              ),
                            ),
                            Text(
                              'Somos uma empresa familiar, fundada há 1 ano em 09/05/2022. Visamos oferecer variedade e '
                              'qualidade a nossos clientes, e sempre com o melhor preço da região. Oferecemos uma variedade '
                              'de produtos, locação de utensílios para festa (mesas, cadeiras). Nosso foco sempre foi no '
                              'cliente, e nossa proposta é chegar cada vez mais completo em suas festas, seja festas de família, '
                              'empresarial, entre outros. Estamos sempre a disposição, entre em contato conosco.',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  flex: 6,
                  child: Image.asset(
                    'assets/images/fachada1.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          )
        : Container(
            color: Colors.black45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Kako Serv Festas',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ),
                      Text(
                        'Somos uma empresa familiar, fundada há 1 ano em 09/05/2022. Visamos oferecer variedade e '
                        'qualidade a nossos clientes, e sempre com o melhor preço da região. Oferecemos uma variedade '
                        'de produtos, locação de utensílios para festa (mesas, cadeiras). Nosso foco sempre foi no '
                        'cliente, e nossa proposta é chegar cada vez mais completo em suas festas, seja festas de família, '
                        'empresarial, entre outros. Estamos sempre a disposição, entre em contato conosco.',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/fachada1.jpg',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          );
  }
}
