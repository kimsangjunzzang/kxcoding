//
//  ViewController.swift
//  HelloSwiftConcurrency
//
//  Created by 김상준 on 10/3/24.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let downloader = VideoDownloader()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func download(_ sender: Any) {
        resultLabel.text = "다운로드 중..."
        
        do {
            let url = try downloader.download()
            resultLabel.text = "다운로드 성공"
            
            let vc = AVPlayerViewController()
            vc.player = AVPlayer(url: url)
            
            present(vc, animated: true) {
                vc.player?.play()
            }
        } catch {
            resultLabel.text = error.localizedDescription
        }
        
    }
    
}

