import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/launcher_helper.dart';
import '../../../company/presentation/controllers/company_public_controller.dart';
import '../../../cart/presentation/widgets/cart_body_widget.dart';
import '../widgets/public_menu_drawer_widget.dart';
import '../widgets/public_title_sub_pages_widget.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final _companyController = Get.find<CompanyPublicController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicMenuDrawerWidget(),
      body: CartBodyWidget(
        children: [
          const SizedBox(height: 50),
          const PublicTitleSubPagesWidget(
            title: 'FALE CONOSCO',
            description:
                'Disponibilizamos nossos canais de atendimento para que você possa enviar elogios, reclamações, dúvidas.',
          ),
          const SizedBox(height: 35),
          _ContactFormWidget(),
          const SizedBox(height: 30),
          SizedBox(
            width: 900,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                _ContactCardWidget(
                  title: 'Telefone',
                  icon: FontAwesomeIcons.phone,
                  iconColor: Colors.red,
                  iconSize: 50,
                  urlLauncher: 'tel:${_companyController.company.telefone}',
                ),
                const SizedBox(height: 8),
                _ContactCardWidget(
                  title: 'WhatsApp',
                  icon: FontAwesomeIcons.whatsapp,
                  iconColor: Colors.green,
                  urlLauncher: _companyController.company.whatsapp,
                ),
                const SizedBox(height: 8),
                _ContactCardWidget(
                  title: 'Email',
                  icon: Icons.email_outlined,
                  urlLauncher: 'mailto:${_companyController.company.email}',
                ),
                const SizedBox(height: 8),
                _ContactCardWidget(
                  title: 'Facebook',
                  icon: FontAwesomeIcons.squareFacebook,
                  iconColor: Colors.blueAccent,
                  urlLauncher: _companyController.company.facebook,
                ),
                const SizedBox(height: 8),
                _ContactCardWidget(
                  title: 'Instagram',
                  icon: FontAwesomeIcons.instagram,
                  iconColor: Colors.pinkAccent,
                  urlLauncher: _companyController.company.instagram,
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _ContactFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              SizedBox(
                width: 800,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Nome',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Telefone',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'E-mail',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Assunto', //inserir barra de rolagem com opções
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                          decoration: const InputDecoration(
                            labelText: 'Digite sua mensagem:',
                          ),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                          onPressed: () {},
                          child: const Text(
                            'ENVIAR MENSAGEM',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactCardWidget extends StatelessWidget {
  const _ContactCardWidget({
    required this.title,
    required this.icon,
    required this.urlLauncher,
    this.iconColor,
    this.iconSize,
  });

  final String title;
  final IconData icon;
  final String urlLauncher;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => LauncherHelper.url(urlLauncher),
      child: Card(
        elevation: 8,
        child: SizedBox(
          width: 100,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Icon(
                icon,
                color: iconColor ?? Colors.black,
                size: iconSize ?? 60,
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
