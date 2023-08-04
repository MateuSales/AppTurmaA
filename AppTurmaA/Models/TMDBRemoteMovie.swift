//
//  TMDBRemoteMovie.swift
//  AppTurmaA
//
//  Created by Yago Marques on 03/08/23.
//

import Foundation

struct TMDBRemoteMovie: Decodable {
    let results: [Movie]
}
