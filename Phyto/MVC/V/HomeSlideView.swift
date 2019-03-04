//
//  HomeSlide.swift
//  Phyto
//
//  Created by Yahia El-Dow on 8/29/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit
protocol HomeViewDelegate {
    func homeViewDidSelectColor(slide_num :  Int)
}


class HomeSlideView: UIView {
    private let arr_colors = PhytoColorModel.getMasterColors()
    var delegate  : HomeViewDelegate!
    override init(frame: CGRect) {
        super.init(frame: frame)
        let btn_Y_Postion : CGFloat = 550.0
        var btn_X_Postion : CGFloat = 850
        let delay_array = [ 2.4 , 2.1 , 1.8 , 1.5 , 1.2 , 0.9 , 0.6 , 0.3 , 0 ]

//        var newNames = [String]()
//        for i  in (0..<img_array_names.count).reverse(){
//            newNames.append(img_array_names[i])
//        }
//        img_array_names = newNames

        for i  in (0..<arr_colors.count).reversed() {
            let img_ =  UIImage(named: arr_colors[i] )
            
            let btn_frame = CGRect(x: btn_X_Postion, y: btn_Y_Postion, width: img_!.size.width, height: img_!.size.height)
            let home_btn_hairColor = UIButton(frame: btn_frame)
            if i == 6  {
                home_btn_hairColor.frame.size = CGSize(width: 120, height: 105)
                 btn_X_Postion = btn_X_Postion - home_btn_hairColor.frame.size.width + 40
            }else if i == 7{
                btn_X_Postion = btn_X_Postion - home_btn_hairColor.frame.size.width - 50

            }else{
                 btn_X_Postion = btn_X_Postion - home_btn_hairColor.frame.size.width - 20
            }
            home_btn_hairColor.setImage(img_ , for: .normal)
                home_btn_hairColor.alpha =  0
                home_btn_hairColor.tag = i
            home_btn_hairColor.addTarget(self, action: #selector(homeViewHairColorAction(sender:)), for: .touchUpInside)

            self.addSubview(home_btn_hairColor)

            UIView.animate(withDuration: 0.5 , delay: delay_array[i] , options: .curveEaseOut, animations: {
                 home_btn_hairColor.alpha =  1
                }, completion: {_ in
                    
            })



        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   @IBAction func homeViewHairColorAction (sender : AnyObject) {
    
    self.delegate.homeViewDidSelectColor(slide_num: sender.tag)
    }
}

/*
 UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
 }, completion: {_ in

 })
 */
