//
//  MovieModel.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/14.
//

import Foundation

/*
 电影列表
 Codable 其实是一个组合协议，由 Decodable 和 Encodable两个协议组成，常用于接口 JSON 数据解析和模型创建
 解析json：try JSONDecoder().decode(Student.self, from: jsonString.data(using: .utf8)!)
 */
struct MoviesArray: Codable {
    /*
     {
         "Search": [{
             "Title": "The Longest Yard",
             "Year": "2005",
             "imdbID": "tt0398165",
             "Type": "movie",
             "Poster": "https://m.media-amazon.com/images/M/MV5BMTc1NTQyNDk2NV5BMl5BanBnXkFtZTcwOTE2OTQzMw@@._V1_SX300.jpg"
         }, {
             "Title": "The Longest Ride",
             "Year": "2015",
             "imdbID": "tt2726560",
             "Type": "movie",
             "Poster": "https://m.media-amazon.com/images/M/MV5BMzIzMjg0NjQwNF5BMl5BanBnXkFtZTgwODAwOTE4MzE@._V1_SX300.jpg"
         }],
        "totalResults": "125",
        "Response": "True"
     }
     */
    var search: [MovieModel]!
    var totalResults: String!
    var response: String!
    
    /*
     更改structs的properties键的名称，如 "search" 改为 "Search"，json中一部分为大写开头
     说明：
     CodingKeys必须是嵌套在声明的struct中的
     CodingKeys必须遵守CodingKey协议
     因为键都是String类型，所以需要在CodingKeys上声明为String enum CodingKeys: String, CodingKey
     即使不打算重新命名所有的键也要在CodingKeys中列出所有的键

     */
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response = "Response"
        case totalResults
    }

}

struct MovieModel: Codable {
    
    var title: String!
    var year: String!
    var imdbID: String!
    var type: String!
    var poster: String!
    
    enum CodingKeys: String, CodingKey {
        case title    = "Title"
        case year     = "Year"
        case imdbID   = "imdbID"
        case type     = "Type"
        case poster   = "Poster"
    }
    
}
