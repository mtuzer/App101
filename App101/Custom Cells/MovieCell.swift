//
//  MovieCell.swift
//  App101
//
//  Created by Mert Tuzer on 22.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    private let movieName = CustomLabel()
    private var movieImageURLString = String()
    private let movieYear = CustomLabel()
    private let movieGenre = CustomLabel()
    private let movieImageView = CustomImageView(image: nil)
    var movie: Movie! {
        didSet {
            movieName.text = movie.movieTitle
            movieImageURLString = movie.movieImage
            movieYear.text = String(movie.movieYear)  + " - " + String(Int.random(in: 1...2)) + "h " + String(Int.random(in: 11...59)) + "m"
            movieGenre.text =  movie.movieGenre.uppercased()
            movieGenre.backgroundColor = movieGenre.text == "" ? UIColor.clear : UIColor(red: 215/255, green: 51/255, blue: 90/255, alpha: 1)
            setImage()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(movieImageView)
        contentView.addSubview(movieName)
        contentView.addSubview(movieYear)
        contentView.addSubview(movieGenre)
        NSLayoutConstraint.activate([movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     movieImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.65),
                                     movieImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     movieImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
                                     movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 5),
                                     movieName.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.13),
                                     movieName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                                     movieName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
                                     movieYear.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 5),
                                     movieYear.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
                                     movieYear.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                                     movieYear.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
                                     movieGenre.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 5),
                                     movieGenre.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.08),
                                     movieGenre.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                                     movieGenre.widthAnchor.constraint(equalToConstant: 80)])
        movieImageView.layer.cornerRadius = 10
        movieImageView.layer.masksToBounds = true
        movieName.font = UIFont.boldSystemFont(ofSize: 18)
        movieName.textAlignment = .left
        movieYear.textAlignment = .left
        movieYear.font = .systemFont(ofSize: 17)
        movieGenre.font = .systemFont(ofSize: 13)
        movieGenre.layer.cornerRadius = 5
        movieGenre.layer.masksToBounds = true
        movieGenre.textColor = .white
        movieGenre.textAlignment = .center
    }
    private func setImage() {
        movieImageView.loadImageFromURLString(urlString: movieImageURLString)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

