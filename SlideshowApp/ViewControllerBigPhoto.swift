//
//  ViewControllerBigPhoto.swift
//  SlideshowApp
//
//  Created by 高野翔 on 2018/08/18.
//  Copyright © 2018年 高野翔. All rights reserved.
//

import UIKit

class ViewControllerBigPhoto: UIViewController {

    @IBOutlet weak var buttonToBack: UIButton!
    @IBOutlet weak var bigPhotoImage: UIImageView!
    
    var countBig: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonToBack.setTitleColor(UIColor.blue, for: UIControlState.normal)
        buttonToBack.layer.borderColor = UIColor.blue.cgColor
        buttonToBack.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonToBack.layer.borderWidth = 2.0
        buttonToBack.layer.cornerRadius = 10.0
        bigPhotoImage.image = UIImage(named:"photo\(self.countBig!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
