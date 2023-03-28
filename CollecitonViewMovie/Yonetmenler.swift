//
//  Yonetmenler.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 27.03.2023.
//

import Foundation

class Yonetmenler {
    var yonetmen_id: Int?
    var yonetmen_ad: String?
    
    init(){
        
    }
    
    init(yonetmen_id: Int? = nil, yonetmen_ad: String? = nil) {
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
    
}
