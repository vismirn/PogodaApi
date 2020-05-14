//
//  SearchResponse.swift
//  PogodaApi
//
//  Created by Viktor Smirnov on 13.05.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import Foundation


struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]

}

struct Track: Decodable {
    var trackName: String
    var artistName: String
    
}
