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
    //countBigを当初: Int!にしている時にはうまくいかなかった（初期値が無いとダメ？すぐにcountで上書きされるのになぜ？）
    var countBig: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonToBack.setTitleColor(UIColor.blue, for: UIControlState.normal)
        buttonToBack.layer.borderColor = UIColor.blue.cgColor
        buttonToBack.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonToBack.layer.borderWidth = 2.0
        buttonToBack.layer.cornerRadius = 10.0 //丸みを数値で変更できる
        bigPhotoImage.image = UIImage(named:"photo\(self.countBig)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
