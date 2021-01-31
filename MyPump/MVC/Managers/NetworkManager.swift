//
//  NetworkManager.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import Foundation
import Firebase
import ObjectMapper
import Alamofire
import FirebaseStorage

class NetworkManager {

//    static func sendRequest(url: String, completion : @escaping(_ courses1: [Course])->()) {
//        guard let url = URL(string: url) else { return }
//        AF.request(url, method: .get).validate().responseJSON { (response) in //встроеный метод request отправояет запрос, а responseJSON говорит о том, что ответ нам нужен в формате JSON, validate говорит о том, что свойство success будет срабатывать только при условии получения кода от 200 до 299
//
//            switch response.result {
//
//            case .success(let value):
//                var courses = [Course]()
//                courses = Course.getArray(from: value)!
//                completion(courses)//вызываем клоужер, чтобы в него передать значение массива полученных данных, чтобы далее в классе coursesVC вызвать этот метод и переданный массив применить к тэйбл вью
//            print(courses)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    static func FetchData(url: String, completion : @escaping(_ : [Main])->()) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data.self else { return }
            guard let downloadedMarks = Mapper<Main>().mapArray(JSONString: String(data: data, encoding: .utf8)!) else {return}
            
            completion(downloadedMarks)
        }
        task.resume()
    }
  static  func fetchDataWithAlamofire(url: String,  completion: @escaping (_ image: UIImage)->()){
        
        AF.request(url).responseData { (responseData) in
            switch responseData.result {
            
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
                
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    static func downloadImage(url: String, completion: @escaping (_ image: UIImage)->()) {
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
    

                }
            }
        } .resume()
    }
    
    
//    static func FetchMarks(completion : @escaping(_ array: [String]) -> Void) {
//        let ref = Database.database().reference()
//        ref.child("Marks").observeSingleEvent(of: .value) { (snapshot) in
//            var key: [String] = []
//            for child in snapshot.children {
//                let data = child as! DataSnapshot
//                key.append(data.key)
//            }
//            completion(key)
//                        guard let data = snapshot.value  else {return}
//                        if let data = data as? [String:Any] {
//                            if let marksJSON = Mapper<Mark>().map(JSONObject: data) {
//                                print(marksJSON.headerTitle ?? "")
//                            }
//                        }
//        }
//    }
//    static func FetchModels(ref: DatabaseReference, completion : @escaping(_ array: [String]) -> Void) {
//
//        ref.observeSingleEvent(of: .value) { (snapshot) in
//            var key: [String] = []
//            for child in snapshot.children {
//                let data = child as! DataSnapshot
//                key.append(data.key)
//            }
//            completion(key)
//            //            guard let data = snapshot.value  else {return}
//            //            if let data = data as? [String:Any] {
//            //                if let marksJSON = Mapper<Mark>().map(JSONObject: data) {
//            //                    print(marksJSON.headerTitle ?? "")
//            //                    completion(marksJSON)
//            //                }
//            //            }
//        }
//    }
//
//    static func FetchBrinkmanModelsTest(completion : @escaping(_ photoOfUnit: Model) -> Void) {
//        let ref = Database.database().reference()
//        ref.child("Model").observeSingleEvent(of: .value) { (snapshot) in
//            guard let data = snapshot.value  else {return}
//            if let data = data as? [String: Any] {
//                if let modelJSON = Mapper<Model>().map(JSONObject: data) {
//                    print(modelJSON.headerTitle ?? "")
//                    completion(modelJSON)
//                }
//            }
//        }
//    }
}
