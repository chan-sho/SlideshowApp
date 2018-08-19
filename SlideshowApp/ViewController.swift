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
    
    @IBOutlet weak var toNext: UIButton!
    @IBOutlet weak var toBack: UIButton!
    @IBOutlet weak var StartAndStopShow: UIButton!
    
    var timer: Timer?
    
    var count: Int = 1
    
    @IBAction func tapAction(_ sender: Any) {
        self.timer?.invalidate()
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
        photoImage.image = UIImage(named:"photo\(count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    @objc func onTimer(_ timer: Timer) {
        self.count += 1
        self.photoImage.image = UIImage(named:"photo\(count)")
        if count > 6 {
            self.count = 1
            self.photoImage.image = UIImage(named:"photo\(count)")
        }
    }
    
    @IBAction func StartAndStopShow(_ sender: Any) {
        switch timer {
        case nil:
        self.photoImage.image = UIImage(named:"photo\(count)")
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
        toNext.isEnabled = false
        toBack.isEnabled = false
        
        default:
        self.timer?.invalidate()
        self.timer = nil
        toNext.isEnabled = true
        toBack.isEnabled = true
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        self.timer?.invalidate()
        self.timer = nil
        toNext.isEnabled = true
        toBack.isEnabled = true
    }
    
}

