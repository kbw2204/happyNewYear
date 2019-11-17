//
//  ViewController.swift
//  HappyNewYear
//
//  Created by 강병우 on 17/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - var
    var mTimer : Timer?
    var mTimer1 : Timer?
    var number : float_t = 0
    var numHtml : Int = 0
    
    @IBOutlet var webview: UIWebView!
    @IBOutlet var gif: UIImageView!

    //MARK: - view
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.isHidden = true
        self.gif.image = UIImage.gif(name: "playbbx")
         mTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        mTimer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback1), userInfo: nil, repeats: true)
    }
    //MARK: - func
    @objc func timerCallback(){
        number += 0.1
        if number >= 4.8 {
            mTimer!.invalidate()
            gif.isHidden = true
            webview.isHidden = false
        }
    }
    @objc func timerCallback1(){
        numHtml += 1
        //        print(number)
        if numHtml >= 4 {
            mTimer1!.invalidate()
            loadHtmlFile()
        }
    }
    func loadHtmlFile() {
        let url = Bundle.main.url(forResource: "index", withExtension: "html")
        let request:URLRequest = URLRequest(url: url!)
        self.webview.loadRequest(request)
    }
}
