//
//  MovieDetailService.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/14.
//

import Moya

class MovieDetailService {
    
    private let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func getMovieDetail(id: String!, completion: @escaping (Result<MovieDetailModel, Error>) -> Void ){
        provider.request(.getMovieDetail(id: id)) { (response) in
            switch response {
            case .success(let data):
                do{
                    let movieDetailResponse = try JSONDecoder().decode(MovieDetailModel.self, from: data.data)
                    completion(.success(movieDetailResponse))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
