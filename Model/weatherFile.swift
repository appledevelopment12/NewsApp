//
//  weatherFile.swift
//  NewsApp
//
//  Created by Rajeev on 06/08/23.
//

import Foundation

struct currentData:Codable
{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int

}

struct locationdata:Codable
{
    let region:String
    let country:String
}

struct WeatherData:Codable
{
    let location:locationdata
    let current:currentData
}
