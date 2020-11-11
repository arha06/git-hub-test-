//
//  Response.swift
//  git hub test
//
//  Created by Пользователь on 07.11.2020.
//

import Foundation

struct Response: Decodable {
    
    var items : [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}
