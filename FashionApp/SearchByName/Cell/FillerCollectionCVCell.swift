//
//  FillerCollectionCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/20/24.
//

import UIKit

class FillerCollectionCVCell: UICollectionViewCell {

    @IBOutlet var arrowImg: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    var buttonAction:(()->())?


    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.setCustomFont(font: .CircularStdBook, size: 12)
    }
    func config(_ item:CategoryModel) {
        arrowImg.image = UIImage(named: item.image)
        titleLbl.text = item.title

    }



    @IBAction func cellBtnClicked(_ sender: Any) {
        buttonAction?()
    }



}
