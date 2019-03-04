//
//  PhytoColorModel.swift
//  Phyto
//
//  Created by Yahia El-Dow on 8/28/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit

class PhytoColorModel: NSObject {

    static func getMasterColors() -> [String] {
        var masterColor = [String]()
        for g in (1...9).reversed() {
            masterColor.append("c_\(g)")
        }
        return masterColor
    }
    static func getAllColor()-> [String]{
        var c_image = [String]()
        for g in (1...16).reversed() {
        c_image.append("c_\(g)")

    }
        return c_image
    }
    static func getGirlImage() ->  [String]{
        var girl_image = [String]()
        for g in (1...16).reversed() {
            girl_image.append("g_\(g)")
        }
        return girl_image

    }
    static func getColor_code () ->  [String]{
        var girl_image = [String]()
        for code_number in (1...16).reversed() {
            girl_image.append("code_\(code_number)")
        }
        print(girl_image)
        return girl_image
        
    }
    static func relatedColor(color_num : Int) -> NSMutableArray{
        let relatedDataArray = NSMutableArray()
        var temp_arr_color : [String] = [String]()
        var temp_arr_code  : [String] = [String]()
        var temp_arr_girl  : [String] = [String]()

        switch color_num {
        case 0:
             temp_arr_color = ["c_1.png"].reversed()
             temp_arr_code  =  ["code_1.png"]
             temp_arr_girl = ["g_1.png"];
        case 1:
             temp_arr_color = ["c_1.png", "c_2.png"].reversed()
             temp_arr_code = ["code_1.png", "code_2.png"]
             temp_arr_girl = ["g_1.png" , "g_2.png"]
        case 2:
             temp_arr_color = ["c_1.png", "c_2.png" , "c_4.png", "c_10.png" , "c_11.png", "c_12.png"].reversed()
             temp_arr_code  = ["code_1.png", "code_2.png" , "code_3.png", "code_4.png" , "code_5.png", "code_6.png"]
             temp_arr_girl = ["g_1.png", "g_2.png" , "g_4.png", "g_10.png" , "g_11.png", "g_12.png"]

        case 3:
              temp_arr_color = ["c_1.png", "c_2.png" , "c_4.png", "c_10.png" , "c_11.png", "c_12.png" , "c_5.png","c_13.png","c_14.png","c_6.png"].reversed()
              temp_arr_code  = ["code_1.png", "code_2.png" , "code_3.png", "code_4.png" , "code_5.png", "code_6.png" , "code_7.png", "code_8.png" , "code_9.png", "code_10.png"]
              temp_arr_girl = ["g_1.png", "g_2.png" , "g_4.png", "g_10.png" , "g_11.png", "g_12.png" , "g_5.png","g_13.png","g_14.png","g_6.png"]
        case 4:
             temp_arr_color = ["c_1.png", "c_2.png" , "c_4.png", "c_10.png" , "c_11.png", "c_12.png" , "c_5.png","c_13.png","c_14.png","c_6.png" , "c_15.png" , "c_7.png"].reversed()
             temp_arr_code  = ["code_1.png", "code_2.png" , "code_3.png", "code_4.png" , "code_5.png", "code_6.png" , "code_7.png", "code_8.png" , "code_9.png", "code_10.png" ,"code_11.png","code_12.png"]

             temp_arr_girl  = ["g_1.png", "g_2.png" , "g_4.png", "g_10.png" , "g_11.png", "g_12.png" , "g_5.png","g_13.png","g_14.png","g_6.png" , "g_15.png" , "g_7.png"]

        case 5:
             temp_arr_color = ["c_4.png","c_10.png","c_11.png","c_12.png","c_5.png","c_13.png","c_14.png","c_6.png","c_15.png","c_7.png","c_16.png","c_8.png"].reversed()
             temp_arr_code  = [ "code_3.png", "code_4.png" , "code_5.png", "code_6.png" , "code_7.png", "code_8.png" , "code_9.png", "code_10.png" ,"code_11.png","code_12.png","code_13.png", "code_14.png"]
             temp_arr_girl  = ["g_4.png","g_10.png","g_11.png","g_12.png","g_5.png","g_13.png","g_14.png","g_6.png","g_15.png","g_7.png","g_16.png","g_8.png"]

        case 6:
             temp_arr_color = ["c_12.png","c_5.png","c_13.png","c_14.png","c_6.png","c_15.png","c_7.png","c_16.png","c_8.png","c_17.png","c_9.png"].reversed()
             temp_arr_code  = ["code_6.png" , "code_7.png", "code_8.png" , "code_9.png", "code_10.png" ,"code_11.png","code_12.png","code_13.png", "code_14.png","code_15.png", "code_16.png"]
             temp_arr_girl  = ["g_12.png","g_5.png","g_13.png","g_14.png","g_6.png","g_15.png","g_7.png","g_16.png","g_8.png","g_17.png","g_9.png"]
        case 7:
             temp_arr_color = ["c_6.png","c_15.png","c_7.png","c_16.png","c_8.png","c_17.png","c_9.png"].reversed()
             temp_arr_code  = ["code_10.png" ,"code_11.png","code_12.png","code_13.png", "code_14.png","code_15.png", "code_16.png"]
             temp_arr_girl  = ["g_6.png","g_15.png","g_7.png","g_16.png","g_8.png","g_17.png","g_9.png"]

        case 8:
             temp_arr_color = ["c_15.png" , "c_7.png","c_16.png","c_8.png","c_17.png","c_9.png"].reversed()
             temp_arr_code  = ["code_11.png","code_12.png","code_13.png", "code_14.png","code_15.png", "code_16.png"]
             temp_arr_girl  = ["g_15.png" , "g_7.png","g_16.png","g_8.png","g_17.png","g_9.png"]

        default:
             temp_arr_color = [""]
             temp_arr_code   = [""]
             temp_arr_girl = [""]

        }
        relatedDataArray.add(temp_arr_color)
        relatedDataArray.add(temp_arr_code)
        relatedDataArray.add(temp_arr_girl)

        return relatedDataArray
    }









}
