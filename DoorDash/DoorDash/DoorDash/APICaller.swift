//
//  APICaller.swift
//  DoorDash
//
//  Created by Ying Yang on 8/4/22.
//

import Foundation

enum HttpMethod: String {
    case GET = "GET"
    case POST = "POST"
}

class APICaller {
    var url: String
    var httpMethod: HttpMethod
    
    init(url: String, httpMethod: HttpMethod) {
        self.url = url
        self.httpMethod = httpMethod
    }
    
    func fetchData() {
        
        let session = URLSession.shared.dataTask(with: URL(string: "https://www.swapi.co/api/films")!) { data, urlResponse, error in
            if let error = error {
                print("Error with fetching")
                return
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error with the response, unexpected status code: \(urlResponse)")
                return
            }
            if let data = data {
                print("got data")
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // try to read out a string array
                        print(json)
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }

            }
        }
        session.resume()
    }
}
