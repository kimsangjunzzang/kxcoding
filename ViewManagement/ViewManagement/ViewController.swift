//
//  ViewController.swift
//  ViewManagement
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let r = CGFloat.random(in: 0..<256) / 255
        let g = CGFloat.random(in: 0..<256) / 255
        let b = CGFloat.random(in: 0..<256) / 255
        
        return UIColor(displayP3Red: r, green: g, blue: b, alpha: 1.0)
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var greenView: UIView!
    
    
    @IBOutlet weak var blueView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMenu(_ sender: Any) {
        
        let menu = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        
        let addRandomViewAction = UIAlertAction(title: "Add Random View", style: .default) { _ in
            self.addRandomView()
        }
        menu.addAction(addRandomViewAction)
        
        let insertRandomViewToBackAction = UIAlertAction(title: "Insert Random View to Back", style: .default) { _ in
            self.insertRandomViewToBack()
        }
        menu.addAction(insertRandomViewToBackAction)
        
        let removeTopmostRandomViewAction = UIAlertAction(title: "Remove Topmost Random View", style: .default) { _ in
            self.removeTopmostRandomView()
        }
        menu.addAction(removeTopmostRandomViewAction)
        
        let bringRedViewToFrontAction = UIAlertAction(title: "Bring Red View to Front", style: .default) { _ in
            self.bringRedViewToFront()
        }
        menu.addAction(bringRedViewToFrontAction)
        
        let sendRedViewToBackAction = UIAlertAction(title: "Send Red View to Back", style: .default) { _ in
            self.sendRedViewToBack()
        }
        menu.addAction(sendRedViewToBackAction)
        
        let switchGreenViewWithBlueViewAction = UIAlertAction(title: "Switch Green View with Blue View", style: .default) { _ in
            self.switchGreenViewWithBlueView()
        }
        menu.addAction(switchGreenViewWithBlueViewAction)
        
        let addGrayViewtoRedViewAction = UIAlertAction(title: "Add Gray View to Red View", style: .default) { _ in
            self.addGrayViewtoRedView()
        }
        menu.addAction(addGrayViewtoRedViewAction)
        
        let moveGrayViewToRootViewAction = UIAlertAction(title: "Move Gray View to Root view", style: .default) { _ in
            self.moveGrayViewToRootView()
        }
        menu.addAction(moveGrayViewToRootViewAction)
      
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        menu.addAction(cancelAction)
        
        present(menu,animated: true)
    }
    
    func moveGrayViewToRootView(){
        if let grayView {
            view.addSubview(grayView)
        }
        
    }
    func addGrayViewtoRedView() {
        grayView = generateGrayView()
        
        if let grayView {
            redView.addSubview(grayView)
        }
        
    }
    
    func switchGreenViewWithBlueView() {
        
        guard let greenViewIndex = view.subviews.firstIndex(of: greenView) else {return}
        guard let blueViewIndex = view.subviews.firstIndex(of: blueView) else {return}
        
        view.exchangeSubview(at: greenViewIndex, withSubviewAt: blueViewIndex)
    }
    func sendRedViewToBack() {
        view.sendSubviewToBack(redView)
        
    }
    func bringRedViewToFront(){
        view.bringSubviewToFront(redView)
        
    }
    
    func removeTopmostRandomView() {
        let topmostRandomView = view.subviews.reversed().first{ $0.tag > 0}
        topmostRandomView?.removeFromSuperview()
    }
    
    func addRandomView() {
        let v = generateRandomView()
        view.addSubview(v)
        
    }
    
    func insertRandomViewToBack() {
        let v = generateRandomView()
        view.insertSubview(v, at: 0)
        
    }
    
    func generateRandomView() -> UIView {
        let frame = CGRect(x:0, y: 0, width: 200, height: 200)
        let v = UIView(frame: frame)
        v.center = view.center
        v.backgroundColor = UIColor.random
        v.tag = Int.random(in: 0..<Int(Int16.max)) + 1
        
        return v
        
    }
    func generateGrayView() -> UIView {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let v = UIView(frame: frame)
        v.backgroundColor = .systemGray
        
        return v
    }
    var grayView: UIView?
    
}

