//
//  DiscoverViewController.swift
//  App101
//
//  Created by Mert Tuzer on 21.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // MARK: Properties
    let cellId = "PostCell"
    var posts = [Post]()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 360)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 248/255, alpha: 1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Discover"
        setSearchButtonLayout()   // set layout of the search button on the navigation bar
        fetchPosts()              // fetch posts from the URL
        setupCollectionView()     // set properties of collection view
    }
}
