//
//  DetayViewController.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 25.03.2023.
//

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var detayKonu: UITextView!
    @IBOutlet weak var detayYil: UILabel!
    //@IBOutlet weak var detayKonu: UILabel!
    @IBOutlet weak var detayYonetmen: UILabel!
    @IBOutlet weak var detayPuan: UILabel!
    @IBOutlet weak var detayName: UILabel!
    @IBOutlet weak var detayImageView: UIImageView!
    
    var film: Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let f = film {
            detayImageView.image = UIImage(named: f.film_resim!)
            detayName.text = f.film_ad!
            detayKonu.text = f.konu!
            detayPuan.text = String(f.film_paun!)
            detayYil.text = String(f.film_yil!)
            detayYonetmen.text = f.yonetmen?.yonetmen_ad
            
        }
    }
    

}
