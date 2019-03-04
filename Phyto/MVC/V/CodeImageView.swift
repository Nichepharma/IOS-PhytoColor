//
//  CodeImageView.swift
//  Phyto
//
//  Created by Yahia El-Dow on 8/29/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit

class CodeImageView: UIView {

    init(frame: CGRect , colorCode_name : String = "") {
        super.init(frame: frame)
        PhytoApplicatonStatus.startIntroChecker = false

        self.backgroundColor = UIColor(patternImage: UIImage(named: "code_img_BKG.png")!)


        let right_img1 = _Image(imgX: 400, imgY: -500 , img_Name: "code_img_title1.png" )
        self.addSubview(right_img1)

        let right_img2 = _Image(imgX: 400, imgY: 1500 , img_Name: "code_img_title2.png" )
        self.addSubview(right_img2)

        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            right_img1.frame.origin = CGPoint(x: right_img1.frame.origin.x, y: 100)
            right_img2.frame.origin = CGPoint(x: right_img2.frame.origin.x, y:  right_img1.frame.origin.y +  right_img1.frame.height + 50)
            }, completion: {_ in

        })

        let boxImageColorCode = _Image(imgX: 90, imgY: 100 , img_Name: colorCode_name )
        let currentW = boxImageColorCode.frame.width
        let currentH = boxImageColorCode.frame.height
            boxImageColorCode.bounds.size = CGSize(width: 0, height: 0)
            boxImageColorCode.alpha = 0
            self.addSubview(boxImageColorCode)


        let btn_displayShampoView = _Button(btnX: 150, btnY: 550, btn_imgName: "Bottons-03.png")
            btn_displayShampoView.alpha = 0
        btn_displayShampoView.addTarget(self, action: #selector(openShampoView(sender:)), for: .touchUpInside)
        self.addSubview(btn_displayShampoView)



        UIView.animate(withDuration: 1.3 , delay: 0.5 , options: .curveEaseOut, animations: {
            boxImageColorCode.alpha = CGFloat(1.0)
            boxImageColorCode.bounds.size = CGSize(width: currentW, height: currentH)
              btn_displayShampoView.alpha = 1
            }, completion: {_ in })

            boxImageColorCode.frame.origin.y = 90
            boxImageColorCode.frame.origin.x = 100
        
        let dismissMy =  _Button(btnX: 900, btnY: 20, btn_imgName: "ic_close_white")
        dismissMy.addTarget(self, action: #selector(removeMe(sender:)), for: .touchUpInside)
        self.addSubview(dismissMy)



        let code_img_logo = _Image(imgX: 400, imgY: 530 , img_Name: "LOGO_PHYTO_feuille_gris_UK copy.png" )
        self.addSubview(code_img_logo)






    }


required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}


 @IBAction  func removeMe(sender : AnyObject) {
    PhytoApplicatonStatus.startIntroChecker = false
    UIView.animate(withDuration: 0.3 , delay: 0.0, options: .curveEaseOut, animations: {
            self.frame.origin.y = CGFloat(900)
        }, completion: {_ in
            self.removeFromSuperview()
        })
    }


    @IBAction  func openShampoView(sender : AnyObject) {
        PhytoApplicatonStatus.startIntroChecker = false
        super.addSubview(ClosingView(frame: self.frame))
    }



}
