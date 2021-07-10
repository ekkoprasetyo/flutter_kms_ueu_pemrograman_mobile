import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/knowledge_response.dart';
import 'package:flutter_ueu_pemrograman_mobile/utils/environtment.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class KnowledgeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<KnowledgeResponse> knowledgeResponse = KnowledgeResponse().obs;

  @override
  void onInit() async {
    super.onInit();
    getKnowledge();
  }

  void snackBarSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 5),
      icon: const Icon(Icons.doorbell_outlined),
      shouldIconPulse: false,
      barBlur: 20,
      backgroundColor: Colors.green[200],
    );
  }

  void snackBarFailed(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 5),
      icon: const Icon(Icons.doorbell_outlined),
      shouldIconPulse: false,
      barBlur: 20,
      backgroundColor: Colors.red[200],
    );
  }

  Future<KnowledgeResponse> _getKnowledge() async {
    var _getKnwoledgeResponse = await http
        .get(
          Uri.parse(Environment.getKnowledgeURL),
        )
        .timeout(const Duration(seconds: 10));

    var jsonObject = json.decode(_getKnwoledgeResponse.body);

    KnowledgeResponse _knowledgeResponse =
        KnowledgeResponse.fromJson(jsonObject);

    return _knowledgeResponse;
  }

  void getKnowledge() async {
    try {
      isLoading.value = true;
      KnowledgeResponse? _knowledgeResponse = await _getKnowledge();
      if (_knowledgeResponse.code == '00') {
        isLoading.value = false;
        knowledgeResponse.value = _knowledgeResponse;
        snackBarSuccess('Get Knowledge Success', "Success");
      } else {
        isLoading.value = false;
        snackBarFailed('Get Knowledge Failed', "Please try again");
      }
    } on TimeoutException catch (_) {
      isLoading.value = false;
      snackBarFailed('Timeout', "Please try again");
    } on Error catch (_) {
      isLoading.value = false;
      snackBarFailed('Error', "Please try again");
    }
  }
}
