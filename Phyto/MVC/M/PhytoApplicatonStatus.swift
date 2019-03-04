//
//  PhytoApplicatonStatus.swift
//  Phyto
//
//  Created by Yahia El-Dow on 9/8/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit

protocol PhtoModelDelegate {
   func restartApplication()
}


class PhytoApplicatonStatus: NSObject {
    static var startIntroChecker : Bool =  false
    static var delegate : PhtoModelDelegate!

    static func appStatus(){
      /*  NSTimer.scheduledTimerWithTimeInterval(10 ,
                                               target:self,
                                               selector: #selector(PhytoApplicatonStatus.appStatus),
                                               userInfo: nil, repeats: true)

        if startIntroChecker {
            // go to intro slide
            if  PhytoApplicatonStatus.delegate != nil {
                PhytoApplicatonStatus.delegate.restartApplication()

            }
        }
        
         startIntroChecker  =  true
         
         */
    }





}
