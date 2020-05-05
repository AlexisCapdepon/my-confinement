// To parse this JSON data, do
//
//     final velovStation = velovStationFromJson(jsonString);

import 'dart:convert';

VelovStation velovStationFromJson(String str) => VelovStation.fromJson(json.decode(str));

String velovStationToJson(VelovStation data) => json.encode(data.toJson());

class VelovStation {
    int nhits;
    Parameters parameters;
    List<Record> records;

    VelovStation({
        this.nhits,
        this.parameters,
        this.records,
    });

    factory VelovStation.fromJson(Map<String, dynamic> json) => VelovStation(
        nhits: json["nhits"],
        parameters: Parameters.fromJson(json["parameters"]),
        records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nhits": nhits,
        "parameters": parameters.toJson(),
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
    };
}

class Parameters {
    String dataset;
    String timezone;
    int rows;
    String format;
    List<String> facet;

    Parameters({
        this.dataset,
        this.timezone,
        this.rows,
        this.format,
        this.facet,
    });

    factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        dataset: json["dataset"],
        timezone: json["timezone"],
        rows: json["rows"],
        format: json["format"],
        facet: List<String>.from(json["facet"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "dataset": dataset,
        "timezone": timezone,
        "rows": rows,
        "format": format,
        "facet": List<dynamic>.from(facet.map((x) => x)),
    };
}

class Record {
    String datasetid;
    String recordid;
    Fields fields;
    Geo geometry;
    DateTime recordTimestamp;

    Record({
        this.datasetid,
        this.recordid,
        this.fields,
        this.geometry,
        this.recordTimestamp,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        datasetid: json["datasetid"],
        recordid: json["recordid"],
        fields: Fields.fromJson(json["fields"]),
        geometry: Geo.fromJson(json["geometry"]),
        recordTimestamp: DateTime.parse(json["record_timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "datasetid": datasetid,
        "recordid": recordid,
        "fields": fields.toJson(),
        "geometry": geometry.toJson(),
        "record_timestamp": recordTimestamp.toIso8601String(),
    };
}

class Fields {
    String available;
    String status;
    String availabl1;
    String name;
    String commune;
    String bonus;
    DateTime lastUpdat;
    String address;
    String bikeStand;
    List<double> geoPoint2D;
    String availabili;
    String number;
    String banking;
    String gid;
    String nmarrond;
    String lat;
    Geo geoShape;
    String lng;
    String availabi1;
    DateTime lastUpd1;

    Fields({
        this.available,
        this.status,
        this.availabl1,
        this.name,
        this.commune,
        this.bonus,
        this.lastUpdat,
        this.address,
        this.bikeStand,
        this.geoPoint2D,
        this.availabili,
        this.number,
        this.banking,
        this.gid,
        this.nmarrond,
        this.lat,
        this.geoShape,
        this.lng,
        this.availabi1,
        this.lastUpd1,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        available: json["available"],
        status: json["status"],
        availabl1: json["availabl_1"],
        name: json["name"],
        commune: json["commune"],
        bonus: json["bonus"],
        lastUpdat: DateTime.parse(json["last_updat"]),
        address: json["address"],
        bikeStand: json["bike_stand"],
        geoPoint2D: List<double>.from(json["geo_point_2d"].map((x) => x.toDouble())),
        availabili: json["availabili"],
        number: json["number"],
        banking: json["banking"],
        gid: json["gid"],
        nmarrond: json["nmarrond"],
        lat: json["lat"],
        geoShape: Geo.fromJson(json["geo_shape"]),
        lng: json["lng"],
        availabi1: json["availabi_1"],
        lastUpd1: DateTime.parse(json["last_upd_1"]),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "status": status,
        "availabl_1": availabl1,
        "name": name,
        "commune": commune,
        "bonus": bonus,
        "last_updat": lastUpdat.toIso8601String(),
        "address": address,
        "bike_stand": bikeStand,
        "geo_point_2d": List<dynamic>.from(geoPoint2D.map((x) => x)),
        "availabili": availabili,
        "number": number,
        "banking": banking,
        "gid": gid,
        "nmarrond": nmarrond,
        "lat": lat,
        "geo_shape": geoShape.toJson(),
        "lng": lng,
        "availabi_1": availabi1,
        "last_upd_1": lastUpd1.toIso8601String(),
    };
}

class Geo {
    String type;
    List<double> coordinates;

    Geo({
        this.type,
        this.coordinates,
    });

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}
