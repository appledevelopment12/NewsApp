//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Rajeev on 25/07/23.
//

import UIKit



class NewsTableViewCellViewModel {
    let title:String
    let subTitle:String
    let imageURL:URL?
    let imageData:Data? = nil
    init(title:String,subtitle:String,imageURL:URL?) {
        self.title = title
        self.subTitle = subtitle
        self.imageURL = imageURL
    }
}

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25,weight: .medium)
        return label
        
    }()
    private let subtitleLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize:18, weight: .regular)
        return label
    }()
    
    private let newsImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    

    override init(style:UITableViewCell.CellStyle,reuseIdentifier:String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsImageView)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(newsImageView)
    }
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        newsTitleLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width - 120, height: contentView.frame.size.height / 2)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func configure(with viewModel:NewsTableViewCellViewModel)
    {
        newsTitleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subTitle
        
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        }
        else
        {
            
        }
    }
   
    
}
