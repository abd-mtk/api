import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
  Future<Unit> deleteCachedPosts();
  Future<PostModel> getCachedPost(int id);
  Future<Unit> addCachedPost(PostModel postModels);
  Future<Unit> deleteCachedPost(int id);
  Future<Unit> updateCachedPost(PostModel postModel);
}

const String CACHED_POSTS = "CACHED_POSTS";

class LocalDataSourceImplement implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  const LocalDataSourceImplement({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelsToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString) as List;
      if (decodedJson.isEmpty) {
        throw EmptyCacheException();
      }
      final List<PostModel> posts =
          decodedJson.map((e) => PostModel.fromJson(e)).toList();
      return Future.value(posts);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> deleteCachedPosts() {
    sharedPreferences.remove(CACHED_POSTS);
    return Future.value(unit);
  }

  @override
  Future<PostModel> getCachedPost(int id) {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString) as List;
      if (decodedJson.isEmpty) {
        throw EmptyCacheException();
      }
      final PostModel post = decodedJson
          .map((e) => PostModel.fromJson(e))
          .toList()
          .firstWhere((element) => element.id == id);
      if (post.id == null) {
        throw EmptyCacheException();
      } else {
        return Future.value(post);
      }
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> addCachedPost(PostModel postModel) {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString) as List;
      if (decodedJson.isEmpty) {
        sharedPreferences.setString(
            CACHED_POSTS, json.encode([postModel.toJson()]));
      }
      final List<PostModel> posts =
          decodedJson.map((e) => PostModel.fromJson(e)).toList();
      // check if post already exist in cache if yes update it else add it
      if (posts.any((element) => element.id == postModel.id)) {
        posts.removeWhere((element) => element.id == postModel.id);
        posts.add(postModel);
        sharedPreferences.setString(CACHED_POSTS, json.encode(posts));
      } else {
        posts.add(postModel);
        sharedPreferences.setString(CACHED_POSTS, json.encode(posts));
      }

      return Future.value(unit);
    } else {
      sharedPreferences.setString(
          CACHED_POSTS, json.encode([postModel.toJson()]));
      return Future.value(unit);
    }
  }

  @override
  Future<Unit> deleteCachedPost(int id) {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString) as List;
      if (decodedJson.isEmpty) {
        throw EmptyCacheException();
      }
      final List<PostModel> posts =
          decodedJson.map((e) => PostModel.fromJson(e)).toList();
      posts.removeWhere((element) => element.id == id);
      return Future.value(unit);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> updateCachedPost(PostModel postModel) {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString) as List;
      if (decodedJson.isEmpty) {
        throw EmptyCacheException();
      }
      final List<PostModel> posts =
          decodedJson.map((e) => PostModel.fromJson(e)).toList();
      posts.removeWhere((element) => element.id == postModel.id);
      posts.add(postModel);
      sharedPreferences.setString(CACHED_POSTS, json.encode(posts));
      return Future.value(unit);
    } else {
      throw EmptyCacheException();
    }
  }
}
