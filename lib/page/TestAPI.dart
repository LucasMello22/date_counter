import 'package:flutter/material.dart';
import 'package:aula_26_04/data/http/http_client.dart';
import 'package:aula_26_04/data/repositories/medico_repository.dart';
import 'package:aula_26_04/page/stores/medico_store.dart';
import 'HomePage.dart';

class TestAPI extends StatefulWidget {
  @override
  _TestAPIState createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
  late final MedicoStore store;

  @override
  void initState() {
    super.initState();
    store = MedicoStore(
      repository: MedicoRepository(
        client: HttpClient(),
      ),
    );
    store.getMedicos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB9CCF2),
      body: Stack(
        children: [
          Positioned(
            left: -60,
            top: 650,
            child: CustomPaint(
              size: Size(300, 300),
              painter: EllipsePainter(color: Color.fromRGBO(10, 72, 233, 0.42)),
            ),
          ),
          Positioned(
            left: 206.02,
            top: -116,
            child: CustomPaint(
              size: Size(300, 300),
              painter: EllipsePainter(color: Color.fromRGBO(10, 72, 233, 0.42)),
            ),
          ),
          AnimatedBuilder(
            animation: Listenable.merge([
              store.isLoading,
              store.erro,
              store.state,
            ]),
            builder: (context, child) {
              if (store.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (store.erro.value.isNotEmpty) {
                return Center(
                  child: Text(
                    store.erro.value,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                );
              }
              if (store.state.value.isEmpty) {
                return Center(
                  child: Text(
                    "Nenhum Item na lista",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 32),
                  padding: const EdgeInsets.all(16),
                  itemCount: store.state.value.length,
                  itemBuilder: (_, index) {
                    final item = store.state.value[index];
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            item.nome,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.especialidade,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item.codConselho,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
