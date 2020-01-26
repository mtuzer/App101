//
//  PostCell.swift
//  App101
//
//  Created by Mert Tuzer on 25.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    private let userName = CustomLabel()
    private let postTime = CustomLabel()
    private let postText = CustomLabel()
    private let likes = CustomLabel()
    private let comments = CustomLabel()
    private var postImageURLString = String()
    private var userImageURLString = String()
    private let postImageView = CustomImageView(image: nil)
    private let userImageView = CustomImageView(image: nil)
    private let postSettingsButton = CustomButton()
    private let like = CustomImageView(image: nil)
    private let comment = CustomImageView(image: nil)
    private let shareButton = CustomButton()
    var post: Post! {
        didSet {
            userName.text = post.userFullName
            postTime.text = String(post.createdAt)
            postText.text = post.postMessage
            likes.text = String(post.likeCount)
            comments.text = String(post.commentCount)
            userImageURLString = post.userImageUrl
            postImageURLString = post.postImage
            setImage()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        contentView.addSubview(userImageView)
        contentView.addSubview(userName)
        contentView.addSubview(postTime)
        contentView.addSubview(postSettingsButton)
        contentView.addSubview(postText)
        contentView.addSubview(postImageView)
        contentView.addSubview(like)
        contentView.addSubview(likes)
        contentView.addSubview(comment)
        contentView.addSubview(comments)
        contentView.addSubview(shareButton)
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        NSLayoutConstraint.activate([userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                     userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     userImageView.heightAnchor.constraint(equalToConstant: 50),
                                     userImageView.widthAnchor.constraint(equalToConstant: 50),
                                     userName.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 5),
                                     userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                                     userName.heightAnchor.constraint(equalToConstant: 20),
                                     userName.widthAnchor.constraint(equalToConstant: 160),
                                     postTime.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 5),
                                     postTime.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
                                     postTime.heightAnchor.constraint(equalToConstant: 20),
                                     postTime.widthAnchor.constraint(equalToConstant: 160),
                                     postSettingsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                                     postSettingsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                                     postSettingsButton.heightAnchor.constraint(equalToConstant: 40),
                                     postSettingsButton.widthAnchor.constraint(equalToConstant: 40),
                                     postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
                                     postText.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
                                     postText.heightAnchor.constraint(equalToConstant: 50),
                                     postText.widthAnchor.constraint(equalToConstant: 300),
                                     postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                                     postImageView.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 10),
                                     postImageView.heightAnchor.constraint(equalToConstant: 150),
                                     postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([like.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                                     like.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
                                     like.widthAnchor.constraint(equalToConstant: 30),
                                     like.heightAnchor.constraint(equalToConstant: 30),
                                     likes.leadingAnchor.constraint(equalTo: like.trailingAnchor, constant: 5),
                                     likes.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
                                     likes.widthAnchor.constraint(equalToConstant: 70),
                                     likes.heightAnchor.constraint(equalToConstant: 30),
                                     comment.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15),
                                     comment.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
                                     comment.widthAnchor.constraint(equalToConstant: 30),
                                     comment.heightAnchor.constraint(equalToConstant: 30),
                                     comments.leadingAnchor.constraint(equalTo: comment.trailingAnchor, constant: 5),
                                     comments.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
                                     comments.widthAnchor.constraint(equalToConstant: 70),
                                     comments.heightAnchor.constraint(equalToConstant: 30),
                                     shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                                     shareButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
                                     shareButton.widthAnchor.constraint(equalToConstant: 30),
                                     shareButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        like.image = UIImage(named: "like")
        postSettingsButton.setImage(UIImage(named: "more"), for: .normal)
        comment.image = UIImage(named: "comment")
        userImageView.layer.cornerRadius = 25
        userImageView.layer.masksToBounds = true
        userImageView.backgroundColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 16)
        postTime.font = UIFont.systemFont(ofSize: 16)
        postTime.textColor = .darkGray
        postText.textColor = .lightGray
    }
    private func setImage() {
        userImageView.loadImageFromURLString(urlString: userImageURLString)
        postImageView.loadImageFromURLString(urlString: postImageURLString)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
