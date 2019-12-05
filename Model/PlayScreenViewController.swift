//
//  PlayScreenViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 08/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class PlayScreenViewController: UIViewController {
    
    var timeConverted: Int?
    var minute: Int = 0
    var second: Int = 0
    var time = 180 // 3 minutos
    var timeLeft: TimeInterval?
    var timer = Timer()
    var endTime: Date?
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var clockLabel: UILabel!
    
    @IBOutlet weak var exitOutlet: UIButton!
    @IBOutlet weak var playTimeOutlet: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    let timeLeftShapeLayer = CAShapeLayer()
    @IBOutlet var finishButton: UIButton!
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLeftCircle()
        circleShape()
        timeConverted = time
        timeLeft = TimeInterval(timeConverted!)
        endTime = Date().addingTimeInterval(timeLeft!)
        //exitOutlet.isHidden = true
        
        finishButton.isHidden = true
        
        timeLabel.text = "3:00"
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func timeLeftCircle(){
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
        100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
                     trackLayer.path = circularPath
                     trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.backgroundDark.cgColor
        trackLayer.lineWidth = 1.0
                     
                     trackLayer.lineCap = CAShapeLayerLineCap.round
               view.layer.addSublayer(trackLayer)
    }
    
    func circleShape(){
         let circularPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
         100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        shapeLayer.path = circularPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.pinkCircle.cgColor
        shapeLayer.lineWidth = 10
        
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
    }
    @objc func updateTime() {
        if timeLeft! > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeLeft!.time
        } else {
            timeLabel.text = "00:00"
            timer.invalidate()
            //exitOutlet.isHidden = false
            finishButton.isHidden = false
        }
    }

    @IBAction func playTime(_ sender: Any) {
        playTimeOutlet.isHidden = true
         timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        handleTap()
    }
    
    func handleTap(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = timeLeft!
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
}

extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

