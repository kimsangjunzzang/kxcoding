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
        
        // #3
        // 동기 메서드 안에서 async 메서드를 직접 호출 할 수 없다.
        // 호출 하고 싶다면, Task를 사용해야 해야한다.
        Task {
            do {
                let url = try await downloader.download()
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
        
        // # 2
        //        downloader.download { [weak self] result in
        //            switch result {
        //                case .success(let url):
        //                let vc = AVPlayerViewController()
        //                vc.player = AVPlayer(url: url)
        //
        //                self?.present(vc, animated: true) {
        //                    vc.player?.play()
        //                }
        //            case .failure(let error):
        //                self?.resultLabel.text = error.localizedDescription
        //            }
        //        }
        
        // #1
        //        do {
        //            let url = try downloader.download()
        //            resultLabel.text = "다운로드 성공"
        //
        //            let vc = AVPlayerViewController()
        //            vc.player = AVPlayer(url: url)
        //
        //            present(vc, animated: true) {
        //                vc.player?.play()
        //            }
        //        } catch {
        //            resultLabel.text = error.localizedDescription
        //        }
        
    }
    
}

