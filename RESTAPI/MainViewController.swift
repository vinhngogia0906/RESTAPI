//
//  MainViewController.swift
//  RESTAPI
//
//  Created by Ngo Gia Vinh on 8/10/18.
//  Copyright © 2018 Ngo Gia Vinh. All rights reserved.
//

import Foundation
import UIKit
class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let cellId = "cellId"
    // Array of articles to store articles data after parsing JSON
    var articles:[Article]?
    override func viewDidLoad() {
        super.viewDidLoad()
        //do any additional set up after loading the view, typically from a nib.
        navigationItem.title = "REST API"
        
        collectionView?.register(ArticleViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = .white
        
        //implement the URLSession
        let urlString = "http://swift.mrgott.pro/blog.json"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){ (data,response, error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            guard let data = data else {return}
            //Implement JSON parsing
            do {
                //Decode retrieved data with JSONDecoder and assing type of Article object
                let articleData = try JSONDecoder().decode([Article].self, from: data)
                //get back to the main queue
                DispatchQueue.main.async {
                    //print(articleData)
                    self.articles = articleData
                    self.collectionView?.reloadData()
                }
                
            }
            catch let jsonError{
                print(jsonError)
            }
        }.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ArticleViewCell
        cell.article = articles?[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 100)
    }
}
