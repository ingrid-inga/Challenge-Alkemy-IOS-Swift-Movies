//
//  Movie.swift
//  DemoMovies
//
//  Created by Leidy Ingrid  on 10/12/2021.
//

import Foundation
import UIKit

struct Movie {
    
    let id: Int
    let name: String
    let overview: String
    private let posterPath: String
    private let releaseDate: Date?
    let voteAverage: Int
    
    var urlImage: String {
        "https://image.tmdb.org/t/p/w500" + self.posterPath
    }
    
    var releaseDateFormat: String {
        self.releaseDate?.toStringWithFormat("EEEE dd 'de' MMMM 'del' yyyy") ?? "Próximamente"
    }
    
    init(_ dto: MovieDto) {
        self.id = dto.id ?? 0
        self.name = dto.title ?? "--"
        self.overview = dto.overview ?? "Descripción no disponible"
        self.posterPath = dto.poster_path ?? ""
        self.releaseDate = dto.release_date?.toDateWithFormat("yyyy-MM-dd")
        self.voteAverage = Int(dto.vote_average ?? 0)
    }
}

