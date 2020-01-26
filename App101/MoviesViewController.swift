//
//  MoviesViewController.swift
//  App101
//
//  Created by Mert Tuzer on 21.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // MARK: Properties
    let cellId = "MovieCell"
    let label = CustomLabel()
    let recommendedLabel = CustomLabel()
    let popularLabel = CustomLabel()
    let expandRecommendedButton = CustomButton()
    let expandPopularButton = CustomButton()
    var safeView: UIView = {
        let theView = UIView()
        theView.translatesAutoresizingMaskIntoConstraints = false
        return theView
    }()
    var popularMovies = [Movie]()
    var recommendedMovies = [Movie]()
    let collectionViewRecommended: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height * 0.4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.scrollsToTop = false
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    let collectionViewPopular: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height * 0.3)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.scrollsToTop = false
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0.15)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchMovies()
        setupCollectionViews()         // set collectionView delegates etc.
        setupSafeViewLayout()          // to use only safe areas defined for the device
        setLayouts()                  // set layouts of all other UI elements
        setLabelandButtonProperties()  // set the properties of labels and buttons
    }
}
