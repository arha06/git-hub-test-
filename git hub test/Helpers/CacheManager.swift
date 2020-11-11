//
//  CacheManager.swift
//  git hub test
//
//  Created by Пользователь on 11.11.2020.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data? ) {
        
        // Store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String ) -> Data? {
        
        // Try to get the data for the specific url
        return cache[url]
    }
}
