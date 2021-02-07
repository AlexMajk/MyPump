//
//  FireBaseDataManager.swift
//  MyPump
//
//  Created by пользователь on 2/8/21.
//

import Foundation
import FirebaseStorage

class FBDataManager {
    
    typealias Success = (_ url: URL) -> Void
    typealias Failure = (Error) -> Void
    
    static var shared = FBDataManager()
    
    func getDownload(url: String, success: @escaping Success, failure: @escaping Failure) {
        
        Storage.storage().reference(forURL: url).downloadURL {(url, error) in
            if let error = error {
                failure(error)
            }
            if let url = url {
                success(url)
            }
        }
    }
    
    private init() { }
}
