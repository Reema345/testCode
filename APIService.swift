//
//  APIResponse.swift
//  Phunware_CodeChallenge
//
//  Created by Reema Rachel Varghese on 12/13/21.
//

import Foundation

/*protocol APIServiceProtocol {
    func downloadResponseData(completionBlock : @escaping(Result<[Response],Error>) -> Void)
 APIServiceProtocol
}*/
class APIService  {
    
    func downloadResponseData(completionBlock: @escaping(Result<[Response], Error>) -> Void) {
            
    let  jsonUrl = "https://raw.githubusercontent.com/phunware-services/dev-interview-homework/master/feed.json"
        
        guard let url = URL(string: jsonUrl) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            guard let data = data, error == nil, response != nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Response].self, from: data)
                print(result)
                completionBlock(.success(result))
                
            } catch {
                completionBlock(.failure(error))
            }

        })
        task.resume()
    }

}

