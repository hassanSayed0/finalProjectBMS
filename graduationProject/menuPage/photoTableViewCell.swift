//
//  photoTableViewCell.swift
//  graduationProject
//
//  Created by hassan sayed on 8/13/22.
//

import UIKit

class photoTableViewCell: UITableViewCell {
    @IBOutlet weak var imgViewContainer: UIView!
    @IBOutlet weak var imgDesh: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgViewContainer.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupPhoto(img:String,color:UIColor){
        imgDesh.image = UIImage(named: img)
        imgViewContainer.backgroundColor = color
    }
}
