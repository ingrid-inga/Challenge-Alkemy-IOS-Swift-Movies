//
//  ModelsViewModel.swift
//  DemoMovies
//
//  Created by Leidy Ingrid  on 11/12/2021.
//

import Foundation

struct MoviesViewModel {
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void in }
    var bindMovies = { (_ arrayMovies: [Movie]) -> Void in }
    var bindError = { (_ errorMessage: String) -> Void in }
    
    private let model = MovieWS()
    
    func getAllMovies() {
        
        self.bindInitRequest()
        self.model.getAllMovies { arrayMoviesDto in
            if arrayMoviesDto.isEmpty {
                self.bindError("No se encontraron resultados")
                self.bindMovies([])
            } else {
                self.bindMovies(arrayMoviesDto.toMovies)
            }
            self.bindEndRequest()
        }
    }
    
    func getAllFavoritesMovies() {
        self.bindInitRequest()
        self.model.getAllFavoritesMovies { arrayMoviesDto in
            self.bindEndRequest()
            
            if arrayMoviesDto.isEmpty {
                self.bindError("No se encontraron resultados")
            } else {
                self.bindMovies(arrayMoviesDto.toMovies)
            }
        }
    }
}
    
 
