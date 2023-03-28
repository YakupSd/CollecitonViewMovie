//
//  FilmlerDao.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 26.03.2023.
//

import Foundation

class FilmlerDao{
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        
        db = FMDatabase(path: veriTabaniURL.path)
        
    }
    
    func filmleriAl(kategori_id: Int) -> [Filmler] {
        var liste = [Filmler]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kategoriler,yonetmenler,filmler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = ?", values: [kategori_id])
            
            while rs.next(){
                let kategori = Kategoriler(kategori_id: Int(rs.string(forColumn: "kategori_id"))!, kategori_ad: rs.string(forColumn: "kategori_ad")!,kategori_resim: rs.string(forColumn: "kategori_resim") ?? "aksiyon")
                
                let yonetmen = Yonetmenler(yonetmen_id: Int(rs.string(forColumn: "yonetmen_id"))!
                                           , yonetmen_ad: rs.string(forColumn: "yonetmen_ad")!)
                
                let film = Filmler(film_id: Int(rs.string(forColumn: "film_id"))!, film_ad: rs.string(forColumn: "film_ad")!, film_yil: Int(rs.string(forColumn: "film_yil"))!,film_resim: rs.string(forColumn: "film_resim")!,film_fiyat: Double(rs.string(forColumn: "film_fiyat"))!, film_paun: Double(rs.string(forColumn: "film_puan"))!, kategori: kategori, yonetmen: yonetmen ,konu:rs.string(forColumn: "film_konu")!)
                
                liste.append(film)
                
            }
        } catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        return liste
    }
}
