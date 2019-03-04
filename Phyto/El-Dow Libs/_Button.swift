//
//  _Button.swift
//  FirstSwiftApp
//
//  Created by Yahia on 7/29/15.
//  Copyright (c) 2015 nichepharma. All rights reserved.
//

import Foundation
import UIKit


// To Add Target To Button  ->>>>>
// button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)




class _Button : UIButton {

       // set Button with Image ..
    init( btnX : CGFloat = 0.0,btnY : CGFloat = 0.0 , btn_imgName : String) {

        func getImage () -> UIImage{
            return _Image(imgX: 0, imgY: 0, img_Name: btn_imgName).image!

        }
        
        super.init(frame: CGRect(x: btnX , y: btnY , width: getImage().size.width, height:  getImage().size.height))
           self .setImage(getImage(), for: .normal)
            self.backgroundColor = UIColor.clear
    }


    // set Button with String Titile ..
    init( btnX : CGFloat = 0.0,  btnY : CGFloat = 0.0 , btnW : CGFloat = 0.0, btnH : CGFloat = 0.0 , string_Title : String) {
        super.init(frame: CGRect(x: btnX, y: btnY, width: btnW, height: btnH))
        self.setTitle(string_Title, for: .normal)
        self.showsTouchWhenHighlighted = true;
        self.backgroundColor = UIColor.clear
    }






    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    



    
    
    
    
}

