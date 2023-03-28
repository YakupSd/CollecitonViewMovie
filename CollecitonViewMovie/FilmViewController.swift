//
//  ViewController.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 25.03.2023.
//

import UIKit

class FilmViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var filmlerListe = [Filmler]()
    
    var kategori:Kategoriler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kategori {
            navigationItem.title = k.kategori_ad
            
            filmlerListe = FilmlerDao().filmleriAl(kategori_id: k.kategori_id!)
        }
        
        //Tasaeım işlemleri
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.mainCollectionView.frame.size.width
        let yukseklik = self.mainCollectionView.frame.size.height
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)//KENAR BOŞLUKLARI
        
        //aralarındaki boşluk ve aşşağıdaki boşluk
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        //
        let hucreGenislik = (genislik-30)
        let hucreYukseklik = (yukseklik-200)
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreYukseklik)
        tasarim.scrollDirection = .vertical
        
        mainCollectionView!.collectionViewLayout = tasarim
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        /*
         let movie1 = Filmler(film_id: 1, film_ad: "DJango", film_yil: 2012, film_resim: "django", film_fiyat: 15.5, film_paun: 4.5, kategori: nil, yonetmen: nil, konu: "Amerikan İç Savaşı'ndan iki yıl önce başlayan hikaye geçmişinde eziyet çekmiş bir köle ile Alman avcı Dr. King Schultz'un yüzleşmesini merkezine alıyor. Brittle kardeşlerin cinayetiyle suçlanan Schultz'u özgürlüğüne kavuşturmak Django'ya bağlıdır.")
         let movie2 = Filmler(film_id: 2, film_ad: "Inception", film_yil: 2015, film_resim: "inception", film_fiyat: 16.5, film_paun: 4.5, kategori: nil, yonetmen: nil, konu: "Dom Cobb çok yetenekli bir hırsızdır. Uzmanlık alanı, zihnin en savunmasız olduğu rüya görme anında, bilinçaltının derinliklerindeki değerli sırları çekip çıkarmak ve onları çalmaktır.")
         let movie3 = Filmler(film_id: 3, film_ad: "Intersteller", film_yil: 2013, film_resim: "interstellar", film_fiyat: 11.5, film_paun: 4.5, kategori: nil, yonetmen: nil, konu: "Filmde bir grup astronotun bir solucan deliğinden geçerek insanların yaşayabileceği yeni bir yer arayışı konu edilmektedir.")
        
         filmlerListe.append(movie1); filmlerListe.append(movie2); filmlerListe.append(movie3)
     
         */
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        let gidilecekVC = segue.destination as! DetayViewController
        gidilecekVC.film = filmlerListe[index!]
    }
}

extension FilmViewController: UICollectionViewDataSource,UICollectionViewDelegate, FilmHucreProtocol{
    func sepeteEkle(indexPath: IndexPath) {
        let film = filmlerListe[indexPath.row]
        print("\(String(describing: film.film_ad!)) İsimli film \(String(describing: film.film_fiyat!)) TL fiyat etiketi ile başarı satın alındı")
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListe.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListe[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucre
        
        cell.nameLabel.text = film.film_ad!
        cell.priceLabel.text = "\(film.film_fiyat!) TL"
        cell.filmImageView.image = UIImage(named: film.film_resim!)
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //basıldığında olması gereken
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
}
