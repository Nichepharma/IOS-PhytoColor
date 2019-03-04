//
//  HarmoniousColorView.swift
//  Phyto
//
//  Created by Yahia El-Dow on 8/29/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit
protocol HarmoniousColorDelegate {
   func didSelectGairl_toOpenCodeView(color_imageCode  : String )
}
class HarmoniousColorView: UIView {
    var delegate : HarmoniousColorDelegate!

    private var relateColors : NSMutableArray!
    private  var _girl_img : _Image!
    private  var strCurrent_girl_img : String! = ""
    private  let relatedColor_Button = NSMutableArray()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let slide_number : Int = Int (self.frame.origin.x / self.frame.width)
        if relateColors != nil {
            relateColors.removeAllObjects()
        }

        relateColors = PhytoColorModel.relatedColor(color_num: 8 - slide_number)

        _girl_img =  _Image(imgX: 100  ,
                            imgY: 120  ,
                            img_Name: PhytoColorModel.getGirlImage()[slide_number + 7] )
        self.addSubview(_girl_img)
        strCurrent_girl_img = PhytoColorModel.getGirlImage()[slide_number + 7]


        let img_relatedColor = _Image(imgX:550, imgY: 360, img_Name: "BG-03.png")
            img_relatedColor.alpha = 0
        img_relatedColor.transform = CGAffineTransform( scaleX: 0 , y: 0 )

        self.addSubview(img_relatedColor)

        UIView.animate(withDuration: 1.5 , delay: 0 , options: .curveEaseOut, animations: {
            img_relatedColor.alpha =  1
            img_relatedColor.transform = CGAffineTransform( scaleX: 1 ,y: 1 )

            }, completion: {_ in

        })


        var master_color_X :CGFloat = 650
        var master_color_Y :CGFloat = 240
        var master_color_Scale = CGAffineTransform( scaleX: 1.3 , y: 1.3 )

        switch slide_number {
        case 6 :
             master_color_X = 600
             master_color_Y = 230
             master_color_Scale = CGAffineTransform( scaleX: 0.9 , y: 0.9 )
            break

        case 4 :
            master_color_Y = 235
            master_color_Scale = CGAffineTransform( scaleX: 1.1 , y: 1.1)

            break
        case 3 :
            master_color_Y = 230
            master_color_Scale = CGAffineTransform( scaleX: 1.1 , y: 1.1 )

            break
        case 1 :
            master_color_Y = 230
            master_color_Scale = CGAffineTransform( scaleX: 1.1 , y: 1.1 )
            break
        case 0 :
            master_color_Y = 220
            master_color_Scale = CGAffineTransform( scaleX: 1 , y: 1 )
            break
        default:
            break
        }
        let master_image_color = _Button(btnX: master_color_X ,
                                         btnY: master_color_Y ,
                                         btn_imgName: PhytoColorModel.getAllColor()[slide_number + 7])
        master_image_color.addTarget(self , action: #selector(setDefualtGirlImage(sender:)),
                                     for: .touchUpInside)
        master_image_color.transform = master_color_Scale

        self.addSubview(master_image_color)

        var  btn_TAG : Int = 0

        if (relateColors.firstObject as! [String]).count < 10 {
            let  btn_Y_Postion : CGFloat = 500.0
            var  btn_X_Postion : CGFloat = 650.0
            var  img_Spaceing : CGFloat = 25

            if   (relateColors.firstObject as! [String]).count > 1 && (relateColors.firstObject as! [String]).count < 9{
                btn_X_Postion = 700
            }
            else if (relateColors.firstObject as! [String]).count > 9{
                btn_X_Postion = 850
                img_Spaceing = 30
            }

            var delayAnimation = 0.3
            for i  in (0..<(relateColors.firstObject as! [String]).count).reversed() {
                let img_ =  UIImage(named: (relateColors.firstObject as! [String])[i])
                let _btn_Color = UIButton(frame: CGRect(x: btn_X_Postion ,y: btn_Y_Postion ,width: img_!.size.width ,height: img_!.size.height ))
                _btn_Color.setImage(img_ , for: .normal)
//                    _btn_Color.bounds.size = CGSize(width: 100 , height: 100)
                    _btn_Color.alpha =  0
                    _btn_Color.tag = btn_TAG
                    btn_TAG += 1
                _btn_Color.addTarget(self, action: #selector(harmoniousViewButtonAction(sender:)), for: .touchUpInside)
                self.addSubview(_btn_Color)
                btn_X_Postion = btn_X_Postion - img_!.size.width - img_Spaceing
                relatedColor_Button.add(_btn_Color)
                UIView.animate(withDuration: 0.5 , delay: delayAnimation , options: .curveEaseOut, animations: {
                    _btn_Color.alpha =  1
                    }, completion: {_ in

            })
                delayAnimation = delayAnimation + 0.3

        }


   }// end if 1
        else{
            var  btn_Y_Postion : CGFloat = 430.0
            var  btn_X_Postion : CGFloat = 810
            var  img_Spaceing : CGFloat = 10
            var delayAnimation = 0.3

            for i  in (0..<(relateColors.firstObject as! [String]).count).reversed(){

                let img_ = UIImage(named: (relateColors.firstObject as! [String])[i])
                if  (relateColors.firstObject as! [String])[i] == "c_5.png" {
                    img_Spaceing = 25
                }else if (relateColors.firstObject as! [String])[i] == "c_13.png" {
                    img_Spaceing = 0
                }else{
                    img_Spaceing = 10
                }
                let _btn_Color = UIButton(frame: CGRect(x: btn_X_Postion ,y: btn_Y_Postion ,width: img_!.size.width ,height: img_!.size.height ))
                _btn_Color.setImage(img_ , for: .normal)
            //_btn_Color.bounds.size = CGSize(width: 150 , height: 130)
                    _btn_Color.alpha =  0
                    _btn_Color.tag = btn_TAG
                    btn_TAG += 1
                _btn_Color.addTarget(self, action: #selector(harmoniousViewButtonAction(sender:)), for: .touchUpInside)

                self.addSubview(_btn_Color)
                UIView.animate(withDuration: 0.5 , delay: delayAnimation , options: .curveEaseOut, animations: {
                    _btn_Color.alpha =  1
                    }, completion: {_ in

                })
                btn_X_Postion = btn_X_Postion - img_!.size.width - img_Spaceing
                delayAnimation = delayAnimation + 0.3
                if i == (relateColors.firstObject as! [String]).count - 5 {
                  btn_X_Postion = 810
                  btn_Y_Postion = 580
                  img_Spaceing  = 40
                }
                relatedColor_Button.add(_btn_Color)
            }


        }


    }
    private var btn_displyCode : _Button!
    @IBAction func harmoniousViewButtonAction(sender : AnyObject){
        PhytoApplicatonStatus.startIntroChecker = false

        if btn_displyCode != nil {
              btn_displyCode.removeFromSuperview()
        }

        for i in 0..<relatedColor_Button.count  {
            (relatedColor_Button.object(at: i) as! UIButton) .isEnabled = true
        }
        let btn : UIButton = sender as! UIButton
        btn.isEnabled = false

        let btn_img = UIImage(named:(relateColors.object(at: 2) as! [String])[sender.tag] )
        _girl_img.image = btn_img
        _girl_img.isUserInteractionEnabled = true
            btn_displyCode = _Button(btn_imgName: "Bottons-02.png")
            btn_displyCode.center.x = _girl_img.frame.width / 2
            btn_displyCode.frame.origin.y = _girl_img.frame.height - btn_displyCode.frame.height - 10
            btn_displyCode.tag = sender.tag
        btn_displyCode.addTarget(self, action: #selector(openCodeView(sender:)), for: .touchUpInside)
        _girl_img.addSubview(btn_displyCode)
    }



    @IBAction func openCodeView(sender : AnyObject){

        self.delegate.didSelectGairl_toOpenCodeView(color_imageCode: (relateColors.object(at: 1) as! [String])[sender.tag])
    }

 @IBAction func setDefualtGirlImage(sender : AnyObject) {
    PhytoApplicatonStatus.startIntroChecker = false
    if btn_displyCode != nil {
        btn_displyCode.removeFromSuperview()
    }
    for i in 0..<relatedColor_Button.count  {
        (relatedColor_Button.object(at: i) as! UIButton) .isEnabled = true
    }


    _girl_img.image = UIImage(named: strCurrent_girl_img)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
