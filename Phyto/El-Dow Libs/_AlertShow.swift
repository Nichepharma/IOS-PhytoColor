//
//  _AlertShow.swift
//  PromotersApp
//
//  Created by Yahia on 4/25/16.
//  Copyright © 2016 nichepharma.com. All rights reserved.
//

import UIKit

class _AlertShow: NSObject {

//
//        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
//        self.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
//        window!.rootViewController!.presentViewController(alert, animated: true, completion: nil)

@available(iOS 8.0, *)
    func show(representOnView : AnyObject ) {
        let alert = UIAlertController(title: ">>>>", message: "Test", preferredStyle: .actionSheet )
    alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        alert.popoverPresentationController?.sourceView = representOnView.view
    
        let xPostion = representOnView.view.bounds.size.width / 2.0 - 105 ;
        let yPostion = representOnView.view.bounds.size.height / 2.0 + 70
        alert.popoverPresentationController?.sourceRect = CGRect(x: xPostion, y: yPostion, width: 1.0, height: 1.0);

    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)

    }



    init( str_title : String , str_msg : String , str_btn : String) {
        super.init()
        let _Login_alert = UIAlertView(title:str_title , message: str_msg , delegate: nil, cancelButtonTitle: str_btn  )
        _Login_alert.show()

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
