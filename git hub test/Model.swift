//
//  Model.swift
//  git hub test
//
//  Created by Пользователь on 04.11.2020.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from URLSession object
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            
            // check if there is any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            
            catch {
                
            }
        }
        
        // kick off the task
        
        datatask.resume()
    }
}
