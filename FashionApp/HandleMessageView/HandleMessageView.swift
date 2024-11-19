//
//  HandleMessageView.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class HandleMessageView: UIView {

    @IBOutlet var messageImg: UIImageView!
    @IBOutlet var messageLbl: UILabel!
    @IBOutlet var massageBtn: UIButton!
    var handelAction: (()->())?
    override init(frame: CGRect) {
        super.init(frame: frame)
        commanInit()
        updateUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commanInit()
        updateUI()
    }

    func updateUI() {
        messageLbl.setCustomFont(font: .GabaritoBold, size: 24)
        massageBtn.setCustomFont(font: .CircularStdBook, size: 16)
    }

    func confige(_ item: HandleMessageModel) {
        let (title,image) = item.message.details
        messageLbl.text = title
        messageImg.image = UIImage(named: image)
        massageBtn.setTitle(item.message.actionTitle, for: .normal)
        handelAction = item.action
    }

    @IBAction func messageBtnClicked(_ sender: UIButton) {
        handelAction?()
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
