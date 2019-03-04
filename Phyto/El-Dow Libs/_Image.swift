//
//  _Img.swift
//  FirstSwiftApp
//
//  Created by Yahia on 7/30/15.
//  Copyright (c) 2015 nichepharma. All rights reserved.
//


import UIKit

class _Image: UIImageView {

    init(imgX : CGFloat = 0.0 ,  imgY : CGFloat = 0.0 ,  img_Name : String) {

        func _Image ()->UIImage{
            let _img  = UIImage(named: img_Name)
            return _img!
        }
        super.init(frame: CGRect(x:imgX, y:imgY ,width: _Image().size.width, height: _Image().size.height))
        self.image = _Image()


    }

    func setXPostion(newX : CGFloat ) {
        super.frame = CGRect(x: newX, y: super.frame.origin.y, width: super.frame.width, height: super.frame.height)
    }
    func setYPostion(newY : CGFloat ) {
        super.frame = CGRect(x: newY,
                             y: super.frame.origin.y,
                             width: super.frame.width,
                             height: super.frame.height)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    

}
