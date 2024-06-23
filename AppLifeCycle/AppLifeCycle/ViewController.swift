//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by 김상준 on 6/23/24.
//

import UIKit

class ViewController: UIViewController {
    
   
    // 바로 설정 창으로 들어가는 로직
    @IBAction func openBrowser(_ sender: Any) {
        
        guard let url = URL(string: UIApplication.openSettingsURLString) else {return}
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.sharedData
        }
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.sharedData
        }
        
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.sharedData
        }
        
        UIApplication.shared.registerForRemoteNotifications()
        
        UIApplication.shared.isIdleTimerDisabled = false
        
    }


}

