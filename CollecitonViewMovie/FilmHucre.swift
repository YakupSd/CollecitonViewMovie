//
//  FilmHucre.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 25.03.2023.
//

import UIKit

protocol FilmHucreProtocol {
    func sepeteEkle(indexPath: IndexPath)
}
class FilmHucre: UICollectionViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    
    var hucreProtocol: FilmHucreProtocol?
    var indexPath: IndexPath?
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
    }
    
    

}
