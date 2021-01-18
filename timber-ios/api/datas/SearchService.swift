//
//  SearchService.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/14.
//

import Moya

/*
 provider是网络请求的提供者
 */
class SearchService {
    
    /*
     这里初始化MoyaProvider，传入API做为引用
     */
    private let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    /*
     这里传入具体参数，并使用API中定义的网络请求访问，最后解析json
     网络请求有回调，为Result<Success, Failure> 类型的数据，具体为case success(Success)、case failure(Failure)方法
     Success为Moya.Respons, 里面有一些好用的方法:mapImage，mapJSON，mapString等
     */
    func getSearch(text: String, completion: @escaping (Result<MoviesArray, Error>) -> Void ){
        provider.request(.getSearch(search: text, page: 1)) { (response) in
            switch response {
            case .success(let data):
                do{
                    let movieResponse = try JSONDecoder().decode(MoviesArray.self, from: data.data)
                    completion(.success(movieResponse))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
