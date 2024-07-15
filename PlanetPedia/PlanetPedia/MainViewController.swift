//
//  ViewController.swift
//  PlanetPedia
//
//  Created by 김상준 on 7/9/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var planetCollectionView: UICollectionView!
    
    @IBSegueAction func makeDetailVC(_ coder: NSCoder, sender: Any?
    ) -> PlanetDetailViewController? {
        guard let cell = sender as? UICollectionViewCell, let indexPath = planetCollectionView.indexPath(for: cell) else { return nil }
        let selected = solarSystemPlanets[indexPath.item]
        return PlanetDetailViewController(planet: selected, coder: coder)
    }
    
    /*
     의존성 주입 Dependency Injection : ID
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let cell = sender as? UICollectionViewCell, let indexPath = planetCollectionView.indexPath(for: cell) {
     let selected = solarSystemPlanets[indexPath.item]
     
     if let vc = segue.destination as? PlanetDetailViewController {
     vc.planet = selected // 프로퍼티 인젝션, 세터 인젝션
     }
     }
     }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        return solarSystemPlanets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlanetCollectionViewCell
        
        let target = solarSystemPlanets[indexPath.item]
        cell.planetImageView.image = UIImage(named: "\(target.englishName.lowercased())-icon")
        cell.planetNameLabel.text = target.englishName
        
        return cell
    }
    
    
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        let width = Int((collectionView.bounds.width - (flowlayout.minimumInteritemSpacing + flowlayout.sectionInset.left + flowlayout.sectionInset.right)) / 2)
        
        
        return CGSize(width: width, height: width)
    }
}
