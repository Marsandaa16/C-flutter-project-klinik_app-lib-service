// TODO Implement this library.import 'package:dio/dio.dart'; 
import 'package:dio/dio.dart';

import '../helpers/api_client.dart'; 
import '../model/poli.dart'; 

class PoliService { 
  Future<List<Poli>> listData() async { 
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Response response = await ApiClient().get('poli'); 
    final List data = response.data as List; 
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList(); 
    return result; 
  } 

  Future<Poli> simpan(Poli poli) async { 
    var data = poli.toJson(); 
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Response response = await ApiClient().post('poli', data); 
    Poli result = Poli.fromJson(response.data); 
    return result; 
  } 

  Future<Poli> ubah(Poli poli, String id) async { 
    var data = poli.toJson(); 
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Response response = await ApiClient().put('poli/$id', data); 
    print(response); 
    Poli result = Poli.fromJson(response.data); 
    return result; 
  } 

  Future<Poli> getById(String id) async { 
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Response response = await ApiClient().get('poli/$id'); 
    Poli result = Poli.fromJson(response.data); 
    return result; 
  } 

  Future<Poli> hapus(Poli poli) async { 
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Response response = await ApiClient().delete('poli/${poli.id}'); 
    Poli result = Poli.fromJson(response.data); 
    return result; 
  } 
}
