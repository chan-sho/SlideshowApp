//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 高野翔 on 2018/08/18.
//  Copyright © 2018年 高野翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    //以下のphoto1~6は本当はいらない？？　→そもそもphotoを同じファイル名でアップしている為（先生に確認！）
    var photo1: UIImage!
    var photo2: UIImage!
    var photo3: UIImage!
    var photo4: UIImage!
    var photo5: UIImage!
    var photo6: UIImage!
    var count: Int = 1
    
    @IBAction func tapAction(_ sender: Any) {
        performSegue(withIdentifier: "GoToBigPhoto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToBigPhoto" {
            let viewControllerBigPhoto : ViewControllerBigPhoto = segue.destination as! ViewControllerBigPhoto
            viewControllerBigPhoto.countBig = self.count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //以下のphoto1~6は本当はいらない？？
        photo1 = UIImage(named:"photo1")
        photo2 = UIImage(named:"photo2")
        photo3 = UIImage(named:"photo3")
        photo4 = UIImage(named:"photo4")
        photo5 = UIImage(named:"photo5")
        photo6 = UIImage(named:"photo6")
        photoImage.image = UIImage(named:"photo\(count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toNext(_ sender: Any) {
        self.count += 1
        self.photoImage.image = UIImage(named:"photo\(count)")
        if count > 6 {
            self.count = 1
            self.photoImage.image = UIImage(named:"photo\(count)")
        }
    }
    
    @IBAction func toBack(_ sender: Any) {
        self.count -= 1
        self.photoImage.image = UIImage(named:"photo\(count)")
        if count < 1 {
            self.count = 6
            self.photoImage.image = UIImage(named:"photo\(count)")
        }
    }
    
    @IBAction func StartAndStopShow(_ sender: Any) {
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

