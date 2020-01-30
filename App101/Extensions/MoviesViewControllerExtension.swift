//
//  MoviesViewControllerExtension.swift
//  App101
//
//  Created by Mert Tuzer on 26.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit
extension MoviesViewController {
    // MARK: Set Layout for the Safe Area
    func setupSafeViewLayout() {
        view.addSubview(safeView)
        NSLayoutConstraint.activate([safeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     safeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     safeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     safeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    // MARK: Set Layout for Other UI Elements
    func setLayouts() {
        safeView.addSubview(label)
        safeView.addSubview(recommendedLabel)
        safeView.addSubview(popularLabel)
        safeView.addSubview(expandRecommendedButton)
        safeView.addSubview(expandPopularButton)
        safeView.addSubview(collectionViewRecommended)
        safeView.addSubview(collectionViewPopular)
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: safeView.topAnchor),
                                     label.heightAnchor.constraint(equalTo: safeView.heightAnchor, multiplier: 0.05),
                                     label.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
                                     label.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 20),
                                     recommendedLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
                                     recommendedLabel.heightAnchor.constraint(equalTo: safeView.heightAnchor, multiplier: 0.05),
                                     recommendedLabel.widthAnchor.constraint(equalToConstant: 250),
                                     recommendedLabel.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 20),
                                     expandRecommendedButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
                                     expandRecommendedButton.heightAnchor.constraint(equalTo: safeView.heightAnchor, multiplier: 0.05),
                                     expandRecommendedButton.widthAnchor.constraint(equalToConstant: 80),
                                     expandRecommendedButton.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: -20),
                                     collectionViewRecommended.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: -5),
                                     collectionViewRecommended.heightAnchor.constraint(equalTo: safeView.heightAnchor, multiplier: 0.5),
                                     collectionViewRecommended.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
                                     collectionViewRecommended.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 5),
                                     popularLabel.topAnchor.constraint(equalTo: collectionViewRecommended.bottomAnchor, constant: 5),
                                     popularLabel.heightAnchor.constraint(equalTo: safeView.heightAnchor, multiplier: 0.05),
                                     popularLabel.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
                                     popularLabel.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 20),
                                     expandPopularButton.topAnchor.constraint(equalTo: collectionViewRecommended.bottomAnchor, constant: 5),
                                     expandPopularButton.heightAnchor.constraint(equalTo: safeView.heightAnchor, multiplier: 0.05),
                                     expandPopularButton.widthAnchor.constraint(equalToConstant: 80),
                                     expandPopularButton.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: -20),
                                     collectionViewPopular.topAnchor.constraint(equalTo: popularLabel.bottomAnchor),
                                     collectionViewPopular.heightAnchor.constraint(equalTo: safeView.heightAnchor, multiplier: 0.35),
                                     collectionViewPopular.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
                                     collectionViewPopular.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 5)])
    }
    // MARK: Set UI Properties for Labels&Buttons
    func setLabelandButtonProperties() {
        label.text = "Movies"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30)
        recommendedLabel.text = "Recommended For You"
        recommendedLabel.textAlignment = .left
        recommendedLabel.font = UIFont.boldSystemFont(ofSize: 16)
        popularLabel.text = "Popular"
        popularLabel.textAlignment = .left
        popularLabel.font = UIFont.boldSystemFont(ofSize: 16)
        expandRecommendedButton.setTitle("View All", for: .normal)
        expandRecommendedButton.setTitleColor(UIColor(red: 215/255, green: 51/255, blue: 90/255, alpha: 1), for: .normal)
        expandRecommendedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        expandPopularButton.setTitle("View All", for: .normal)
        expandPopularButton.setTitleColor(UIColor(red: 215/255, green: 51/255, blue: 90/255, alpha: 1), for: .normal)
        expandPopularButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    // MARK: Fetch Movies from URL
    func fetchMovies() {
        let dataFetcher = DataFetcher()
        dataFetcher.fetchData(urlString: Constants.movieURL) { (movies: [Movie]) in
            self.popularMovies = movies.filter({$0.isPopular == true}).shuffled() // filter popular movies and shuffle
            self.recommendedMovies = movies.filter({$0.isRecommended == true}).shuffled() // filter recommended movies and shuffle
            DispatchQueue.main.async {
                self.collectionViewPopular.reloadData()
                self.collectionViewRecommended.reloadData()
            }
        }
    }
    // MARK: CollectionView Preparation for UI
    func setupCollectionViews() {
        collectionViewPopular.dataSource = self
        collectionViewPopular.delegate = self
        collectionViewRecommended.dataSource = self
        collectionViewRecommended.delegate = self
        collectionViewRecommended.register(MovieCell.self, forCellWithReuseIdentifier: cellId)
        collectionViewPopular.register(MovieCell.self, forCellWithReuseIdentifier: cellId)
    }
    // MARK: CollectionView Cell Preparation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewPopular {
            return popularMovies.count
        } else { return recommendedMovies.count }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCell // swiftlint:disable:this force_cast
        if collectionView == collectionViewPopular {
            var popularMovie = popularMovies[indexPath.row]
            popularMovie.movieGenre = ""
            cell.movie = popularMovie
        } else {
            cell.movie = recommendedMovies[indexPath.row]
        }
        return cell
    }
}
