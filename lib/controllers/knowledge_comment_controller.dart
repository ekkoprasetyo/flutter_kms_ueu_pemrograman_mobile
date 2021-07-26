import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/knowledge_comment_request.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/knowledge_comment_response.dart';
import 'package:flutter_ueu_pemrograman_mobile/utils/environtment.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class KnowledgeCommentController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<KnowledgeCommentResponse> knowledgeCommentResponse =
      KnowledgeCommentResponse().obs;
  TextEditingController commentController = TextEditingController();

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

  Future<KnowledgeCommentResponse> _getKnowledgeComment(
      {required int id}) async {
    var _getKnwoledgeCommentResponse = await http
        .get(
          Uri.parse(
              Environment.getKnowledgeURL + '/' + id.toString() + '/comment'),
        )
        .timeout(const Duration(seconds: 10));

    var jsonObject = json.decode(_getKnwoledgeCommentResponse.body);

    KnowledgeCommentResponse _knowledgeCommentResponse =
        KnowledgeCommentResponse.fromJson(jsonObject);

    return _knowledgeCommentResponse;
  }

  Future<KnowledgeCommentResponse> _postKnowledgeComment(
      {required int id,
      required KnowledgeCommentRequest knowledgeCommentRequest}) async {
    final body = jsonEncode(knowledgeCommentRequest);

    var _getKnwoledgeCommentResponse = await http
        .post(
            Uri.parse(
                Environment.getKnowledgeURL + '/' + id.toString() + '/comment'),
            body: body)
        .timeout(const Duration(seconds: 10));

    var jsonObject = jsonDecode(_getKnwoledgeCommentResponse.body);

    KnowledgeCommentResponse _knowledgeCommentResponse =
        KnowledgeCommentResponse.fromJson(jsonObject);

    log(_knowledgeCommentResponse.toJson().toString());

    return _knowledgeCommentResponse;
  }

  void getKnowledgeComment({required int id}) async {
    try {
      isLoading.value = true;
      KnowledgeCommentResponse? _knowledgeCommentResponse =
          await _getKnowledgeComment(id: id);
      if (_knowledgeCommentResponse.code == '00') {
        isLoading.value = false;
        knowledgeCommentResponse.value = _knowledgeCommentResponse;
        snackBarSuccess('Get Knowledge Comment Success', "Success");
      } else {
        isLoading.value = false;
        snackBarFailed('Get Knowledge Comment Failed', "Please try again");
      }
    } on TimeoutException catch (_) {
      isLoading.value = false;
      snackBarFailed('Timeout', "Please try again");
    } on Error catch (_) {
      isLoading.value = false;
      snackBarFailed('Error', "Please try again");
    }
  }

  void postKnowledgeComment(
      {required int id,
      required KnowledgeCommentRequest knowledgeCommentRequest}) async {
    try {
      isLoading.value = true;
      KnowledgeCommentResponse? _knowledgeCommentResponse =
          await _postKnowledgeComment(
              id: id, knowledgeCommentRequest: knowledgeCommentRequest);
      if (_knowledgeCommentResponse.code == '00') {
        isLoading.value = false;
        commentController.text = '';
        knowledgeCommentResponse.value = _knowledgeCommentResponse;
        snackBarSuccess('Post Knowledge Comment Success', "Success");
        getKnowledgeComment(id: id);
      } else {
        isLoading.value = false;
        snackBarFailed('Post Knowledge Comment Failed', "Please try again");
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
