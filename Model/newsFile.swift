//
//  newsFile.swift
//  NewsApp
//
//  Created by Rajeev on 06/08/23.
//

import Foundation

struct ArticleData:Codable
{
    let author:String?
    let title:String
    let urlToImage:String?
    let content:String?
}

struct NewsData:Codable
{
    let status:String
    let articles:[ArticleData]
}
