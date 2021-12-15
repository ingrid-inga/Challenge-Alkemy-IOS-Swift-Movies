//
//  MovieDetailViewController.swift
//  DemoMovies
//
//  Created by Leidy Ingrid  on 10/12/2021.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblReleaseDate: UILabel!
    @IBOutlet weak private var lblOverview: UILabel!
    @IBOutlet weak private var imgMovie: UIImageView!
    @IBOutlet weak private var imgMovieBackground: UIImageView!
    @IBOutlet var arrayStars: [UIImageView]!
    
    var objMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgMovie.layer.cornerRadius = 10
        
        guard let objMovie = self.objMovie else { return }
        self.updateData(objMovie)
    }
    
    func updateData(_ movie: Movie) {
        
        self.lblName.text = movie.name
        self.lblReleaseDate.text = movie.releaseDateFormat
        self.lblOverview.text = movie.overview
        
        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.isHidden = !(index < movie.voteAverage)
        }
        
        let request = AF.request(movie.urlImage)
        request.response { dataResponse in
            guard let data = dataResponse.data else { return }
            let image = UIImage(data: data)
            self.imgMovie.image = image
            self.imgMovieBackground.image = image
        }
    }
}
