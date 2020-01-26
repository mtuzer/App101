//
//  structs.swift
//  App101
//
//  Created by Mert Tuzer on 23.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

struct Movie: Codable {
    var id: Int
    var movieImage: String
    var movieTitle: String
    var movieYear: Int
    var movieGenre: String
    var isPopular: Bool
    var isRecommended: Bool
}

struct Post: Codable {
    var id: Int
    var userFullName: String
    var userImageUrl: String
    var createdAt: String
    var likeCount: Int
    var commentCount: Int
    var postImage: String
    var postMessage: String
}

struct Constants {
    static let movieURL = "http://www.mocky.io/v2/5dea8d843000001d442b09da"
    static let discoverURL = "http://www.mocky.io/v2/5dea8bf6300000d23f2b09d0"
}

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override init(image: UIImage?) {
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
