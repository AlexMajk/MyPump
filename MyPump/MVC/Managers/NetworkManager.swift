//
//  NetworkManager.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import Alamofire
import Firebase
import FirebaseStorage
import Foundation
import Kingfisher
import ObjectMapper

class NetworkManager {
    // как запускать метод без создания экземпляра? т.е. сделать его static
    //
    //
    //    private let allowedDiskSize = 100 * 1024 * 1024
    //    private lazy var cache: URLCache = {
    //        return URLCache(memoryCapacity: 0, diskCapacity: allowedDiskSize, diskPath: "gifCache")
    //    }()
    //
    //    typealias DownloadCompletionHandler = (Result<[Main],Error>) -> ()
    //
    //    func createAndRetrieveURLSession() -> URLSession {
    //        let sessionConfiguration = URLSessionConfiguration.default
    //        sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
    //        sessionConfiguration.urlCache = cache
    //        return URLSession(configuration: sessionConfiguration)
    //    }
    //
    //
    //
    //
    //    func downloadContent(completionHandler: @escaping DownloadCompletionHandler) {
    //        let baseUrl = "https://mypump-c4d75-default-rtdb.firebaseio.com/.json"
    //
    //        guard let downloadUrl = URL(string: baseUrl) else { return }
    //        let urlRequest = URLRequest(url: downloadUrl)
    //
    //        // First try to fetching cached data if exist
    //        if let cachedData = self.cache.cachedResponse(for: urlRequest) {
    //            print("Cached data in bytes:", cachedData.data)
    //            guard let downloadedMarks = Mapper<Main>().mapArray(JSONString: String(data: cachedData.data, encoding: .utf8)!) else {return}
    //
    //            completionHandler(.success(downloadedMarks))
    //
    //        } else {
    //            // No cached data, download content than cache the data
    //            createAndRetrieveURLSession().dataTask(with: urlRequest) { (data, response, error) in
    //
    //                if let error = error {
    //                    completionHandler(.failure(error))
    //                } else {
    //                    guard let data = data.self else { return }
    //                    guard let downloadedMarks = Mapper<Main>().mapArray(JSONString: String(data: data, encoding: .utf8)!) else {return}
    //                    let cachedData = CachedURLResponse(response: response!, data: data)
    //                    self.cache.storeCachedResponse(cachedData, for: urlRequest)
    //
    //                    completionHandler(.success(downloadedMarks))
    //                }
    //            }.resume()
    //        }
    //    }
    //
    //    func getData(completion : @escaping(_ : [Main])->()){
    //        self.downloadContent(completionHandler: { (result) in
    //
    //            switch result {
    //
    //            case .success(let yourData):
    //                completion(yourData)
    //                print(yourData)
    //
    //            case .failure(let error):
    //                debugPrint(error.localizedDescription)
    //            }
    //        })
    //    }

    // !!!!!!!!!!!!!!!!! Работающий метод!!!!!!!!!!!!!!!

    static func FirstLaunchCataloguePartsFetchData(completion : @escaping(_ : [CatalogueParts]) -> Void) {
        let baseUrl = "https://mypump-c4d75-default-rtdb.firebaseio.com/CatalogueParts.json"
        // let baseUrl = "https://mypump-c4d75-default-rtdb.firebaseio.com/.json"
        guard let url = URL(string: baseUrl ) else { return }
        URLSession.shared.dataTask(with: url) {data, _, _ in
            guard let data = data.self else { return }
            guard let downloadedMarks = Mapper<CatalogueParts>().mapArray(JSONString: String(data: data, encoding: .utf8)!) else { return }

            completion(downloadedMarks)
        }
        .resume()
    }

    static func FirstLaunchCatalogueMachineryFetchData(completion : @escaping(_ : [CatalogueMachinery]) -> Void) {
        let baseUrl = "https://mypump-c4d75-default-rtdb.firebaseio.com/CatalogueMachinery.json"
        guard let url = URL(string: baseUrl ) else { return }
        URLSession.shared.dataTask(with: url) {data, _, _ in
            guard let data = data.self else { return }
            guard let downloadedMachines = Mapper<CatalogueMachinery>().mapArray(JSONString: String(data: data, encoding: .utf8)!) else { return }

            completion(downloadedMachines)
        }
        .resume()
    }
}

// private let allowedDiskSize = 100 * 1024 * 1024
// private lazy var cache: URLCache = {
//    return URLCache(memoryCapacity: 0, diskCapacity: allowedDiskSize, diskPath: "gifCache")
// }()
//
// typealias DownloadCompletionHandler = (Result<Data,Error>) -> ()
//
// private func createAndRetrieveURLSession() -> URLSession {
//    let sessionConfiguration = URLSessionConfiguration.default
//    sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
//    sessionConfiguration.urlCache = cache
//    return URLSession(configuration: sessionConfiguration)
// }
//
// private func downloadContent(fromUrlString: String, completionHandler: @escaping DownloadCompletionHandler) {
//
//    guard let downloadUrl = URL(string: fromUrlString) else { return }
//    let urlRequest = URLRequest(url: downloadUrl)
//    // First try to fetching cached data if exist
//    if let cachedData = self.cache.cachedResponse(for: urlRequest) {
//        print("Cached data in bytes:", cachedData.data)
//        completionHandler(.success(cachedData.data))
//
//    } else {
//        // No cached data, download content than cache the data
//        createAndRetrieveURLSession().dataTask(with: urlRequest) { (data, response, error) in
//
//            if let error = error {
//                completionHandler(.failure(error))
//            } else {
//
//                let cachedData = CachedURLResponse(response: response!, data: data!)
//                self.cache.storeCachedResponse(cachedData, for: urlRequest)
//
//                completionHandler(.success(data!))
//            }
//        }.resume()
//    }
// }

// self.downloadContent(fromUrlString: ANY_URL, completionHandler: { (result) in
//
//            switch result {
//            case .success(let yourData):
//                // handle data
//
//            case .failure(let error):
//                debugPrint(error.localizedDescription)
//            }
// })
