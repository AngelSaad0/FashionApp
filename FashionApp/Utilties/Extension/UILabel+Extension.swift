//
//  LabelCircularFont.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//


import UIKit

extension UILabel {
    func setCustomFont(font: Fonts = .CircularStdBook, size: Size) {
        self.font = UIFont(name: font.rawValue, size: size.rawValue)
    }
    func customLbl(txtColor: Colors = .C707070, size: Size = .medium, font: Fonts = .regular, text:Lbls, direction: Direction = .normal, nOlines: Int = 1) {

        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        self.font = UIFont(name: font.font, size: size)

        switch direction {
        case .left: self.textAlignment = ((isEnglish()) ? .left : .left)
        case .right: self.textAlignment = ((isEnglish()) ? .right : .right)
        case .normal: self.textAlignment = ((isEnglish()) ? .left : .right)
        case .center: self.textAlignment = .center

        }
        self.textColor = UIColor(named: txtColor.rawValue)
        //self.textColor = UIColor(hexString: txtColor.rawValue)
       // self.textColor = txtColor.hex
        self.text = text.rawValue.localized
    }


//MARK: - change text color in case arabic
    func LblTxtColorInArbaic(txtColorAR: Colors, txtColorEn: Colors){
     self.textColor = UIColor(named: (isEnglish()) ?  (txtColorEn.rawValue):(txtColorAR.rawValue))

    }

}
