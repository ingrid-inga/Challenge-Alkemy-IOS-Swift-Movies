//
//  MovieTableViewCell.swift
//  DemoMovies
//
//  Created by Leidy Ingrid  on 10/12/2021.
//

import UIKit
import Alamofire

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblReleaseDate: UILabel!
    @IBOutlet weak private var imgMovie: UIImageView!
    @IBOutlet var arrayStars: [UIImageView]!
    
    func updateData(_ movie: Movie) {
        
        self.animateAppear()
        
        self.lblName.text = movie.name
        self.lblReleaseDate.text = movie.releaseDateFormat
        
        let request = AF.request(movie.urlImage)
        request.response { dataResponse in
            guard let data = dataResponse.data else { return }
            let image = UIImage(data: data)
            self.imgMovie.image = image
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.imgMovie.layer.cornerRadius = 10
    }
    
    func animateAppear(){
        
        self.alpha = 0
        self.transform = CGAffineTransform(translationX: -100, y: 0)
        
        UIView.animate(withDuration: 0.6, delay: 0, options: [.curveEaseInOut], animations: {
            self.alpha = 1
            self.transform = .identity
        }, completion: nil)
    }
}

extension MovieTableViewCell {
    
    class func buildInTableView(_ tableView: UITableView, indexPath: IndexPath, movie: Movie) -> MovieTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        cell?.updateData(movie)
        return cell ?? MovieTableViewCell()
    }
}
