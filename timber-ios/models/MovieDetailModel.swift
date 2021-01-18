//
//  MovieDetail.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/14.
//

import Foundation

/*
 电影详情
 */
struct MovieDetailModel: Codable {
    
    /*
     {
         "Title": "The Longest Ride",
         "Year": "2015",
         "Rated": "PG-13",
         "Released": "10 Apr 2015",
         "Runtime": "123 min",
         "Genre": "Drama, Romance",
         "Director": "George Tillman Jr.",
         "Writer": "Nicholas Sparks (novel), Craig Bolotin (screenplay)",
         "Actors": "Britt Robertson, Scott Eastwood, Alan Alda, Jack Huston",
         "Plot": "The lives of a young couple intertwine with a much older man, as he reflects back on a past love.",
         "Language": "English",
         "Country": "USA",
         "Awards": "1 win & 5 nominations.",
         "Poster": "https://m.media-amazon.com/images/M/MV5BMzIzMjg0NjQwNF5BMl5BanBnXkFtZTgwODAwOTE4MzE@._V1_SX300.jpg",
         "Ratings": [{
             "Source": "Internet Movie Database",
             "Value": "7.1/10"
         }, {
             "Source": "Rotten Tomatoes",
             "Value": "31%"
         }, {
             "Source": "Metacritic",
             "Value": "33/100"
         }],
         "Metascore": "33",
         "imdbRating": "7.1",
         "imdbVotes": "76,126",
         "imdbID": "tt2726560",
         "Type": "movie",
         "DVD": "N/A",
         "BoxOffice": "$37,446,117",
         "Production": "Temple Hill, Nicholas Sparks Productions",
         "Website": "N/A",
         "Response": "True"
     }
     */
    var title: String!
    var releaseData: String!
    var runTime: String!
    var genre: String!
    var plot: String!
    var poster: String!
    var imdbRating: String!
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case releaseData = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case plot = "Plot"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        
    }
}
