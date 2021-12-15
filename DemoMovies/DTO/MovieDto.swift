//
//  MovieDto.swift
//  DemoMovies
//
//  Created by Leidy Ingrid  on 10/12/2021.
//

import Foundation

struct PageMovieDto: Decodable {
    
    let page: Int?
    let results: [MovieDto]
}

struct MovieDto: Decodable {
    
    let id: Int?
    let title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Double?
}

extension MovieDto {
    var toMovie: Movie {
        Movie(self)
    }
}

extension Array where Element == MovieDto {
    var toMovies: [Movie] {
        self.map({ $0.toMovie })
    }
}
