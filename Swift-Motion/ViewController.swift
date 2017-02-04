//
//  ViewController.swift
//  Swift-Motion
//
//  Created by gyoza manner on July 20, 2014
//  Copyright (c) 2014 gyoza manner. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // Connection with interface builder
    @IBOutlet var acc_x: UILabel!
    @IBOutlet var acc_y: UILabel!
    @IBOutlet var acc_z: UILabel!
    @IBOutlet var gyro_x: UILabel!
    @IBOutlet var gyro_y: UILabel!
    @IBOutlet var gyro_z: UILabel!
    @IBOutlet var attitude_roll: UILabel!
    @IBOutlet var attitude_pitch: UILabel!
    @IBOutlet var attitude_yaw: UILabel!
    @IBOutlet var attitude_x: UILabel!
    @IBOutlet var attitude_y: UILabel!
    @IBOutlet var attitude_z: UILabel!
    @IBOutlet var attitude_w: UILabel!

    // create instance of MotionManager
    let motionManager: CMMotionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize MotionManager
        motionManager.deviceMotionUpdateInterval = 0.05 // 20Hz
        
        // Start motion data acquisition
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: { deviceManager, error in
            
            let accel: CMAcceleration = deviceManager!.userAcceleration
            self.acc_x.text = String(format: "%.1f", accel.x)
            self.acc_y.text = String(format: "%.1f", accel.y)
            self.acc_z.text = String(format: "%.1f", accel.z)
            
            let gyro: CMRotationRate = deviceManager!.rotationRate
            self.gyro_x.text = String(format: "%.1f", gyro.x)
            self.gyro_y.text = String(format: "%.1f", gyro.y)
            self.gyro_z.text = String(format: "%.1f", gyro.z)
            
            let attitude: CMAttitude = deviceManager!.attitude
            self.attitude_roll.text = String(format: "%.1f", attitude.roll)
            self.attitude_pitch.text = String(format: "%.1f", attitude.pitch)
            self.attitude_yaw.text = String(format: "%.1f", attitude.yaw)
            
            let quaternion: CMQuaternion = attitude.quaternion
            self.attitude_x.text = String(format: "%.1f", quaternion.x)
            self.attitude_y.text = String(format: "%.1f", quaternion.y)
            self.attitude_z.text = String(format: "%.1f", quaternion.z)
            self.attitude_w.text = String(format: "%.1f", quaternion.w)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

