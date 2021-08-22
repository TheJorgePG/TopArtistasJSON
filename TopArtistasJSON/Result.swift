//
//  Result.swift
//  TopArtistasJSON
//
//  Created by Usuario on 25/01/2020.
//  Copyright © 2020 net.azarquiel. All rights reserved.
//

import UIKit

class Result: Codable {
    let datos: Datos?
    private enum CodingKeys: String, CodingKey{
        case datos = "topartists"
    }
}

struct Datos: Codable {
    let artista:[Artista]?
    private enum CodingKeys: String, CodingKey{
        case artista = "artist"
    }
}

struct Artista: Codable {
    let nombre:String?
    let listeners:String?
    let sitioWeb:String?
    let imagen:[Imagen]?
    private enum CodingKeys: String, CodingKey{
        case nombre = "name"
        case listeners = "listeners"
        case sitioWeb = "url"
        case imagen = "image"
    }
}

struct Imagen: Codable{
    let foto:String?
    private enum CodingKeys: String, CodingKey{
        case foto = "#text"
    }
}

