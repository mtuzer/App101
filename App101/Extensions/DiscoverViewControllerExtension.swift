//
//  DiscoverViewControllerExtension.swift
//  App101
//
//  Created by Mert Tuzer on 26.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit
extension DiscoverViewController {
    // MARK: Setup Search Button
    func setSearchButtonLayout() {
        let button: UIButton = UIButton(type: .custom)
        button.setImage(UIImage(named: "search"), for: .normal)
        button.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 21)
        let searchButton = UIBarButtonItem(customView: button)
        navigationItem.setRightBarButton(searchButton, animated: true)
    }
    @objc func searchTapped() {
    }
    // MARK: Fetch Posts from URL
    func fetchPosts() {
        let dataFetcher = DataFetcher()
        dataFetcher.fetchData(urlString: Constants.discoverURL) { (posts: [Post]) in
            self.posts = posts
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    // MARK: CollectionView Preparation for UI
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                                     collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                                     collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     collectionView.widthAnchor.constraint(equalTo: view.widthAnchor)])
    }
    // MARK: CollectionView Cell Preparation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PostCell // swiftlint:disable:this force_cast
        cell.post = posts[indexPath.row]
        return cell
    }
}
