//
//  ArticleViewCell.swift
//  RESTAPI
//
//  Created by Ngo Gia Vinh on 8/10/18.
//  Copyright © 2018 Ngo Gia Vinh. All rights reserved.
//

import Foundation
import UIKit

class ArticleViewCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    var article:Article?{
        didSet{
            articleTitle.text = article?.title
            articleDescription.text = article?.description
        }
    }
    let articleTitle:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let articleDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    func setupView(){
        //Allign Article
        addSubview(articleTitle)
        articleTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        articleTitle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        articleTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        articleTitle.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        //Allign Description
        addSubview(articleDescription)
        articleDescription.topAnchor.constraint(equalTo: articleTitle.bottomAnchor).isActive = true
        articleDescription.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        articleDescription.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        articleDescription.heightAnchor.constraint(equalToConstant: 50 ).isActive = true
    }
}
