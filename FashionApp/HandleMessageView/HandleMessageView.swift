//
//  HandleMessageView.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class HandleMessageView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //for take instance
        commanInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commanInit()
    }

    func commanInit() {

        self.layer.cornerRadius = 10
        self.clipsToBounds =  true
        let bundle = Bundle.init(for: HandleMessageView.self)
        if let ViewToAdd = bundle.loadNibNamed("HandleMessageView", owner: self,options: nil), let contentView = ViewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]

        }


    }
}
