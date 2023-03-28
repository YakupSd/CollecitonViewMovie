//
//  KategoriViewController.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 25.03.2023.
//

import UIKit

class KategoriViewController: UIViewController{

    @IBOutlet weak var kategoriTableView: UITableView!
    
    var kategoriListe = [Kategoriler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veriTabaniKopyala()
        
        kategoriTableView.dataSource = self
        kategoriTableView.delegate = self
        
        kategoriListe = KategorilerDao().tumKategorilerAl()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        let gidilecekVC = segue.destination as! FilmViewController
        gidilecekVC.kategori = kategoriListe[index!]
    }
    
    func veriTabaniKopyala(){
        //kopyalacanakcak veri tabanı adı
        let bundleYolu = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        //kopyalandığı yerdeki adı
        let kopyalanacakYerler = URL(fileURLWithPath: hedefYolu).appendingPathComponent("filmler.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYerler.path){
            print("Veritabanı Zaten var. Kopyalamaya gerek yok")
        }else {
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYerler.path)
            }catch{
                print(error)
            }
        }
    }
}

extension KategoriViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //kaç veri olacak
        return kategoriListe.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {

        //kaç bölümden oluşuyor
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //satır içerikleri
        let kategori = kategoriListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre", for: indexPath) as! KategoriHucreTableCell
        cell.kategoriLabel.text = kategori.kategori_ad
        cell .kategoriResim.image = UIImage(named: kategori.kategori_resim!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toFilm", sender: indexPath.row)
    }
    
}
