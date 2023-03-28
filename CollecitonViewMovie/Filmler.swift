//
//  Filmler.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 25.03.2023.
//


import Foundation

class Filmler{
    var film_id: Int?
    var film_ad: String?
    var film_yil: Int?
    var film_resim: String?
    var film_fiyat: Double?
    var film_paun : Double?
    var kategori: Kategoriler?
    var yonetmen : Yonetmenler?
    var konu: String?
    
    init(){
        
    }
    
    init(film_id: Int? = nil, film_ad: String? = nil, film_yil: Int? = nil, film_resim: String? = nil, film_fiyat: Double? = nil, film_paun: Double? = nil, kategori: Kategoriler? = nil, yonetmen: Yonetmenler? = nil, konu: String? = nil) {
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.film_resim = film_resim
        self.film_fiyat = film_fiyat
        self.film_paun = film_paun
        self.kategori = kategori
        self.yonetmen = yonetmen
        self.konu = konu
    }
    
}
