//
//  ViewController.swift
//  Phyto
//
//  Created by Yahia El-Dow on 8/28/16.
//  Copyright © 2016 Yahia El-Dow. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ScrollDelegate  , HomeViewDelegate , HarmoniousColorDelegate , IntroViewDelegate  , PhtoModelDelegate{
    private var _ScrollView : _Scrolling!
    private var introView : IntroView!
    private var homeView  : HomeSlideView!
    private var harmoniousView : HarmoniousColorView!
    private var btn_Home : _Button!

    private lazy var timer = Timer()
    private lazy var timer_count = TimeInterval(60 * 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ScrollView = _Scrolling(frame: self.view.frame , numberOfSlides: 11)
        _ScrollView.backgroundColor = UIColor(patternImage: UIImage(named: "S1-01.png")!)
        _ScrollView.startFromLastSlide()
        _ScrollView.sDelegate = self
        self.view.addSubview(_ScrollView)

        btn_Home = _Button(btnX: 100, btnY: 55, btn_imgName: "home.png")
        btn_Home.addTarget(self, action: #selector(_ReturnHome(sender:)), for: .touchUpInside)
        btn_Home.isHidden =  true
        self.view.addSubview(btn_Home)

        PhytoApplicatonStatus.delegate = self
        PhytoApplicatonStatus.appStatus()


        timer = Timer.scheduledTimer(timeInterval: timer_count ,
                                                     target: self, selector: #selector(resetSlide(sender:)),
                                                     userInfo: nil, repeats: true);


    }


    override func viewDidAppear(_ animated: Bool) {
        
        let frame =  CGRect(x: self.view.frame.width * CGFloat(10) ,
                            y: 0 ,
                            width: self.view.frame.width,
                            height: self.view.frame.height)
        introView =  IntroView.init(frame:frame)
        introView.delegate = self
        item.add(introView)
        self._ScrollView.addSubview(introView)
    }
    @IBAction func resetSlide(sender : AnyObject ){
        self ._deleteMe()
        if color_CodeView != nil {
            color_CodeView.removeFromSuperview()
        }

        
        _ScrollView.contentOffset  = CGPoint(x: (self.view.frame.width * 10)  ,y: 0)
         _ScrollView.backgroundColor = UIColor(patternImage: UIImage(named: "S1-01.png")!)
        introView =  IntroView.init(frame: CGRect(x:self.view.frame.width * CGFloat(10) ,y: 0 ,width: self.view.frame.width, height:self.view.frame.height))
        introView.delegate = self
        item.add(introView)
        self._ScrollView.addSubview(introView)

    }

    func didScroll(scrollView: UIScrollView, slideNumber: Int) {
        self._deleteMe()
        if slideNumber > 8  {
            btn_Home.isHidden =  true
        }else{
            btn_Home.isHidden =  false
        }
    }

    func didEndScroll(scrollView: UIScrollView, slideNumber: Int) {
        if slideNumber == 10 {
            scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "S1-01.png")!)
            introView =  IntroView.init(frame: CGRect(x:self.view.frame.width * CGFloat(slideNumber) ,y: 0 ,width: self.view.frame.width,height: self.view.frame.height))
                introView.delegate = self
            scrollView.addSubview(introView)
            item.add(introView)
        }else if slideNumber == 9 {
            scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "S2-01.png")!)
            homeView =  HomeSlideView.init(frame: CGRect(x:self.view.frame.width * CGFloat(slideNumber) ,y: 0 ,width: self.view.frame.width, height: self.view.frame.height))
            homeView.delegate = self
            self._ScrollView.addSubview(homeView)
            item.add(homeView)
        }
        else  {
            scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "appBKG.png")!)
            let frame = CGRect(x: self.view.frame.width * CGFloat(slideNumber), y: 0, width:  self.view.frame.width, height:  self.view.frame.height)
            harmoniousView =  HarmoniousColorView.init(frame: frame)
            harmoniousView.delegate = self
            self._ScrollView.addSubview(harmoniousView)
            item.add(harmoniousView)
        }

    }
    func didEndScrollWithAnimation(scrollView: UIScrollView, slideNumber: Int) {

        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: timer_count , target: self, selector: #selector(resetSlide(sender:)), userInfo: nil, repeats: true);
        
        let frame = CGRect(x: self.view.frame.width * CGFloat(slideNumber) , y: 0 ,
                           width:  self.view.frame.width,
                           height: self.view.frame.height)
        
        if slideNumber == 10 {
            scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "S1-01.png")!)
          
            introView =  IntroView.init(frame: frame)
            scrollView.addSubview(introView)
            item.add(introView)
        }else if slideNumber == 9 {
            scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "S2-01.png")!)
            
            let frame = CGRect(x: self.view.frame.width * CGFloat(slideNumber) , y: 0 ,
                               width:  self.view.frame.width,
                               height: self.view.frame.height)
            homeView =  HomeSlideView.init(frame: frame)
            homeView.delegate = self
            self._ScrollView.addSubview(homeView)
            item.add(homeView)

        }
        else  {
            scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "appBKG.png")!)
            harmoniousView =  HarmoniousColorView.init(frame:frame)
            harmoniousView.delegate = self
            self._ScrollView.addSubview(harmoniousView)
            item.add(harmoniousView)

        }

    }

    func didScrollViewDidEndDragging() {
        print("didScrollViewDidEndDragging")
    }
    func homeViewDidSelectColor(slide_num: Int) {
        _ScrollView.scrollToPage(page: slide_num)
    }

    

    /*
     let t =  CodeImageView.init(frame: CGRectMake(0 , 0 , self.view.frame.width, self.view.frame.height))
     self.view.addSubview(t)
     */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var color_CodeView : CodeImageView! ;
    func didSelectGairl_toOpenCodeView(color_imageCode: String) {
        color_CodeView  = CodeImageView(frame: self.view.frame, colorCode_name:color_imageCode )

        self.view.addSubview(color_CodeView)
    }


    @IBAction func _ReturnHome (sender : AnyObject){
        self.goToHome()
    }
    func goToHome() {
       // _ScrollView.scrollToPage(9)

        _ScrollView.scrollRectToVisible(CGRect(x:(_ScrollView.frame.size.width * 9  ),y: 0,width: _ScrollView.frame.size.width,height: _ScrollView.frame.size.height), animated:   true)

    }

 private var item = NSMutableArray()
  private func _deleteMe (){
    PhytoApplicatonStatus.startIntroChecker = false
        if (item.count > 0) {
            for i in 0..<item.count {
                (item.object(at: i) as AnyObject).removeFromSuperview()
            }
            item.removeAllObjects()
        }

    }


    func restartApplication() {
        let xPostion = CGFloat(self._ScrollView.frame.width * 10)
        let frame = CGRect(x: xPostion ,
                           y: 0,
                           width: _ScrollView.frame.size.width,
                           height:_ScrollView.frame.size.height)
        _ScrollView.scrollRectToVisible(frame , animated: true )
    }



    
}

