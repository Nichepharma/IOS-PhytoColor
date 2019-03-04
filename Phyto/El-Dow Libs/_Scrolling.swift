//
//  _Scrolling.swift
//  FirstSwiftApp
//
//  Created by Yahia on 8/3/15.
//  Copyright (c) 2015 nichepharma. All rights reserved.
//

import UIKit


@objc protocol ScrollDelegate {
     func didScroll(scrollView: UIScrollView ,  slideNumber : Int) ;
     func didEndScroll(scrollView: UIScrollView ,  slideNumber : Int) ;
     func didEndScrollWithAnimation(scrollView: UIScrollView ,  slideNumber : Int) ;
}


class _Scrolling: UIScrollView , UIScrollViewDelegate {


    var sDelegate : ScrollDelegate?


    init(frame: CGRect ,  numberOfSlides : CGFloat = 0.0 ) {

        super.init(frame: frame)

        let sizeOfWidth : CGFloat = CGFloat  (self.frame.width ) * CGFloat (numberOfSlides)
        self.contentSize    = CGSize (width: sizeOfWidth ,height: self.frame.height)
        self.contentOffset  = CGPoint(x:sizeOfWidth - (self.frame.width ) , y:0) // go to last slide
        print("sizeOfWidth" , sizeOfWidth)
        //   _scrolling__.autoresizingMask=UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        self.delegate = self
        self.bounces = false
        self.isScrollEnabled = false
        self.clipsToBounds = true
        self.isPagingEnabled = true
        self.autoresizesSubviews = false
        self.canCancelContentTouches = true
        self.showsVerticalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor=UIColor.clear
        self.indicatorStyle = UIScrollView.IndicatorStyle.default

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber :Int = Int((scrollView.contentOffset.x / scrollView.frame.width) )
        if sDelegate != nil {
            sDelegate!.didScroll(scrollView: scrollView , slideNumber: Int(pageNumber))
            
        }
    }
  
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber  = (scrollView.contentOffset.x / scrollView.frame.width);
        sDelegate!.didEndScroll(scrollView: scrollView , slideNumber: Int(pageNumber))
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let pageNumber  = Int ( (scrollView.contentOffset.x / scrollView.frame.width) )
        sDelegate!.didEndScrollWithAnimation(scrollView: scrollView , slideNumber: pageNumber)
    }


    //  var  pageNumber = (scrollView.contentOffset.x / scrollView.frame.width);

    /*

     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }

     */


    func startFromLastSlide(){
        super.contentOffset = CGPoint(x: (super.contentSize.width / super.frame.width) * super.frame.width - super.frame.width  , y:0);
    }


    func scrollToPage(page: Int)  {
        var frame: CGRect = super.frame
        frame.origin.x = frame.size.width * CGFloat(page);
        frame.origin.y = 0;
        super.scrollRectToVisible(frame, animated: true)
    }





}











