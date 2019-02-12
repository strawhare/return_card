//
//  ViewController.swift
//  return_card
//
//  Created by teppei zaima on 2019/02/12.
//  Copyright © 2019 macoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0/255, green: 150/255, blue: 50/255, alpha: 1.0)
        
        //set view
        myView.frame = CGRect(x: 0, y: 0, width: 160, height: 200)
        myView.center = view.center
        myView.image = UIImage(named: "card_back")
        view.addSubview(myView)
        
        //set button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("open", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.center = CGPoint(x: view.center.x, y: view.frame.height - 100)
        button.addTarget(self, action: #selector(rotateCard), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func rotateCard() {
        //二重タップ防止
        self.view.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.5, animations: {
            //first transform
            self.myView.transform = CGAffineTransform(scaleX: 0.01, y: 1.0)
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: 0.5, animations: {
                self.changeImge()
                //second transform
                self.myView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion:{ (finished: Bool) in
                //二重タップ防止　解除
                self.view.isUserInteractionEnabled = true
            })
        })
    }
    
    func changeImge() {
        if self.myView.image == UIImage(named: "card_back") {
            self.myView.image = UIImage(named: "card_joker")
        }else {
            self.myView.image = UIImage(named: "card_back")
        }
    }
}

