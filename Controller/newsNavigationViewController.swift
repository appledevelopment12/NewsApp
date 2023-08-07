//
//  newsNavigationViewController.swift
//  NewsApp
//
//  Created by Rajeev on 06/08/23.
//

import UIKit

class newsNavigationViewController: UIViewController {

    @IBOutlet weak var headingTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    var newsContent:ArticleData = ArticleData(author: "", title: "", urlToImage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitle.text = newsContent.title
        if newsContent.urlToImage != nil
        {
            let url = URL(string: newsContent.urlToImage!)
            newsImage.downloaded(from: url!)
            newsImage.contentMode = .scaleToFill
        }
        else
        {
            newsImage.image = UIImage(named:"empty")
        }
        headingTitle.text = newsContent.content
        
    }
}
