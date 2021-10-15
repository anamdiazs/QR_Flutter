import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_app/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'scansdb.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(''''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          );
        '''');
      });
  }

  Future newScan(ScanModel newScan) async {
    final db = await database;
    final resp = await db.insert('Scans', newScan.toJson());

  }

  Future getScanByID(int id) async {
    final db = await database;
    final resp = await db.query('Scans', where:'id=?' whereArgs:[id]);
    return resp.isNotEmpty
      ? ScanModel.fromJson(resp.first)
      : null;
  }
  
  Future getAllScansByID() async {
    final db = await database;
    final resp = await db.query('Scans', );
    return resp.isNotEmpty
      ? resp.map((s) => ScanModel)
      : null;
  }
}
