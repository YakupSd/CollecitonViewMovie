//
//  KategoriHucreTableCell.swift
//  CollecitonViewMovie
//
//  Created by Yakup Suda on 25.03.2023.
//

import UIKit

class KategoriHucreTableCell: UITableViewCell {

    @IBOutlet weak var kategoriLabel: UILabel!
    @IBOutlet weak var kategoriResim: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
