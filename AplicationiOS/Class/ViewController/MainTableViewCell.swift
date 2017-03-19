//
//  MainTableViewCell.swift
//  AplicationiOS
//
//  Created by Dong Nguyen on 3/19/17.
//  Copyright © 2017 TVT25. All rights reserved.
//

import UIKit
import SDWebImage
class MainTableViewCell: UITableViewCell {

    //MARK: - VAR
    
   
    @IBOutlet weak var imgTrack: UIImageView!
    
    @IBOutlet weak var lbName: UILabel!
    
    var didTouchBtnPlay :(() -> ())?
    //MARK: - SELF
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - SETUP UI & VAR
    
    func setUIWithModel(model : Result){
        lbName.text = model.trackCensoredName
        imgTrack.sd_setImage(with: NSURL.init(string: model.artworkUrl100) as URL?, placeholderImage: nil)
    }
    //MARK: - BUTTON ACTION
    
    @IBAction func didTouchBtnPlay(_ sender: Any) {
        if self.didTouchBtnPlay != nil {
            self.didTouchBtnPlay!()
        }
    }
    
}
