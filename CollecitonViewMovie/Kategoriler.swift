//
//  Kategoriler.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 25.03.2023.
//

import Foundation

class Kategoriler {
    var kategori_id: Int?
    var kategori_ad: String?
    var kategori_resim: String?
    
    init(){
        
    }
    
    init(kategori_id: Int? = nil, kategori_ad: String? = nil, kategori_resim: String? = nil) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
        self.kategori_resim = kategori_resim
    }
}
