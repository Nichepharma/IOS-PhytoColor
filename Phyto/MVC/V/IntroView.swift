//
//  IntroView.swift
//  Phyto
//
//  Created by Yahia El-Dow on 8/29/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit
protocol IntroViewDelegate {
    func goToHome()
}

class IntroView: UIView {
   private  var btn_nextSlide : _Button!
    var delegate : IntroViewDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let left_img1 = _Image(imgX: 100, imgY: -500 , img_Name: "S1-02.png" )
        self.addSubview(left_img1)

        let left_img2 = _Image(imgX: 50, imgY: 1000 , img_Name: "S1-05.png" )
        self.addSubview(left_img2)

        let right_img1 = _Image(imgX: 650   , imgY: 120  , img_Name: "S1-03.png" )
            right_img1.alpha = 0
        self.addSubview(right_img1)

        let right_box = _Image(imgX: right_img1.frame.origin.x ,
                               imgY: right_img1.frame.height + right_img1.frame.origin.y + 50 ,
                               img_Name: "S1-04.png" )
            right_box.alpha = 0
        self.addSubview(right_box)

        let left_logo = _Image(imgX: -200, imgY: 630 , img_Name: "S1-07.png" )
        self.addSubview(left_logo)

        let facebook_like = _Button(btnX: 600, btnY: 660  , btn_imgName: "S1-06.png" )
        facebook_like.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.addSubview(facebook_like)

        btn_nextSlide = _Button (btn_imgName: "Bottons-01.png")
        btn_nextSlide.center = CGPoint(x: self.frame.width / 2  - 100 , y: self.frame.height / 2)
        btn_nextSlide.alpha = 0
        btn_nextSlide.transform = CGAffineTransform(scaleX: 0, y: 0)
        btn_nextSlide.isHidden = false
        btn_nextSlide.addTarget(self, action: #selector(intro_goTo_home(sender: )), for: .touchUpInside)
        self.addSubview(btn_nextSlide)






        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            left_img1.frame.origin = CGPoint(x: left_img1.frame.origin.x, y: 50)
            left_img2.frame.origin = CGPoint(x: left_img2.frame.origin.x, y: 500)
            }, completion: {_ in

        })

        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {
            right_img1.alpha = 1
            }, completion: {_ in })

        UIView.animate(withDuration: 1, delay: 1.5, options: .curveEaseOut, animations: {
            right_box.alpha = 1
            }, completion: {_ in })

        UIView.animate(withDuration: 0.4, delay: 2, options: .curveEaseOut, animations: {
            left_logo.frame.origin = CGPoint(x: 200 , y: 620)
            facebook_like.transform = CGAffineTransform(scaleX: 2, y: 2)

            }, completion: {_ in
                UIView.animate(withDuration: 0.5 , delay: 0.0, options: .curveEaseOut, animations: {
                    facebook_like.transform = CGAffineTransform(scaleX: 1, y: 1)

                    }, completion: {_ in

                })
        })


        UIView.animate(withDuration: 0.5 , delay: 2, options: [.curveEaseOut], animations: {
            self.btn_nextSlide.alpha = 1
            self.btn_nextSlide.isHidden = false
            self.btn_nextSlide.transform = CGAffineTransform(scaleX: 2, y: 2)
            }, completion: {_ in
                UIView.animate(withDuration: 0.5 , delay: 0.0, options: .curveEaseOut, animations: {
                    self.btn_nextSlide.transform = CGAffineTransform(scaleX: 1, y: 1)

                    }, completion: {_ in
                        
                })
        })

        _ = Timer.scheduledTimer(timeInterval: 5 , target: self, selector: #selector(repeateButtonTransformMaskeScale(sender: )), userInfo: nil, repeats: true);

    }

    @IBAction func repeateButtonTransformMaskeScale (sender : AnyObject)  {
        btn_nextSlide.transform = CGAffineTransform(scaleX: 0, y: 0)

        UIView.animate(withDuration: 0.5 , delay: 0 , options: [.curveEaseOut], animations: {
             self.btn_nextSlide.alpha = 1
            self.btn_nextSlide.isHidden = false
            self.btn_nextSlide.transform = CGAffineTransform(scaleX: 2, y: 2)
            }, completion: {_ in
                UIView.animate(withDuration: 0.5 , delay: 0.0, options: .curveEaseOut, animations: {
                    self.btn_nextSlide.transform = CGAffineTransform(scaleX: 1, y: 1)

                    }, completion: {_ in

                })
        })

        
    }
    @IBAction func intro_goTo_home (sender : AnyObject){
        self.delegate.goToHome()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




}
/*
 UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
 }, completion: {_ in

 })
 */
