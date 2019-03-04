//
//  ClosingView.swift
//  Phyto
//
//  Created by Yahia El-Dow on 9/8/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit

class ClosingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        PhytoApplicatonStatus.startIntroChecker = false
        self.backgroundColor =  UIColor(patternImage: UIImage(named: "code_img_BKG.png")!)

        let shampoImg = _Image(imgX: 90, imgY: 80, img_Name: "Shampo-03.png")
        let shampoImgSize = shampoImg.frame.size
            shampoImg.bounds.size = CGSize(width: 0, height: 0)
        self.addSubview(shampoImg)

        let shampoImg_desc = _Image(imgX: 500, imgY: 100, img_Name: "desc1.png")
            shampoImg_desc.alpha = 0
        self.addSubview(shampoImg_desc)

        let shampoImg_desc2 = _Image(imgX: 500, imgY: shampoImg_desc.frame.origin.y +
                                                    shampoImg_desc.frame.height + 20 , img_Name: "desc2.png")
            shampoImg_desc2.alpha = 0
        self.addSubview(shampoImg_desc2)
        
        
        
        UIView.animate(withDuration: 1.3 , delay: 0.5 , options: .curveEaseOut, animations: {
            shampoImg.bounds.size = shampoImgSize

            }, completion: {_ in
                
        })
        UIView.animate(withDuration: 1.3 , delay: 1.5 , options: .curveEaseOut, animations: {
            shampoImg_desc.alpha = 1
            
            
            }, completion: {_ in
        })

        UIView.animate(withDuration: 1.3 , delay: 2.5 , options: .curveEaseOut, animations: {
            shampoImg_desc2.alpha = 1
            
            
            }, completion: {_ in
        })
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissShampoClosing(sender:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)


        let code_img_logo = _Image(imgX: 400, imgY: 530 , img_Name: "LOGO_PHYTO_feuille_gris_UK copy.png" )
        self.addSubview(code_img_logo)


 }
    @IBAction func dismissShampoClosing (sender : AnyObject){
        PhytoApplicatonStatus.startIntroChecker = false
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
