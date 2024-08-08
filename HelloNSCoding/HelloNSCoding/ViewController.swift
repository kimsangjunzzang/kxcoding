//
//  ViewController.swift
//  HelloNSCoding
//
//  Created by 김상준 on 8/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    let fileUrl: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("swift").appendingPathExtension("data")
        
    }()
    
    private var logoImageView: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(systemName: "star.fill")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private var versionLabel: UILabel = {
        var label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private var vstackView: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.spacing = 30
        view.alignment = .center

        return view
    }()
    
    private var encodeBtn: UIButton = {
       var btn = UIButton()
        btn.setTitle("Encode", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(encodeObject), for: .touchUpInside)
        return btn
    }()
    
    private var decodeBtn: UIButton = {
       var btn = UIButton()
        btn.setTitle("Decode", for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(decodeObject), for: .touchUpInside)
        return btn
    }()
    
    private var hstackView: UIStackView = {
        var view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 30
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setConstraint()
    }
    
    func setConstraint() {
    
        view.addSubview(vstackView)
        view.addSubview(hstackView)
        vstackView.addArrangedSubview(logoImageView)
        vstackView.addArrangedSubview(nameLabel)
        vstackView.addArrangedSubview(versionLabel)
        hstackView.addArrangedSubview(encodeBtn)
        hstackView.addArrangedSubview(decodeBtn)
        
        vstackView.translatesAutoresizingMaskIntoConstraints = false
        hstackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
        
            vstackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vstackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
       
            
            hstackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            hstackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            hstackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

   @objc private func encodeObject() {
        do {
            guard let img = UIImage(named: "swift")?.pngData() else { return }
            
            let obj = Language(name: "Swift", version: 5.9, logo: img)
            
            let archiver = NSKeyedArchiver(requiringSecureCoding: true)
            try archiver.encodeEncodable(obj, forKey: NSKeyedArchiveRootObjectKey)
            try archiver.encodedData.write(to: fileUrl, options: .atomic)
            
            archiver.finishEncoding()
            
//            let data = try NSKeyedArchiver.archivedData(withRootObject: obj, requiringSecureCoding: true)
//            
//            try data.write(to: fileUrl,options: .atomic)
            
            print("Done")
        } catch {
            print(error)
        }
    }
    
    @objc private func decodeObject() {
        
        do {
            let data = try Data(contentsOf: fileUrl)
            
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            unarchiver.requiresSecureCoding = true
            
            if let language = unarchiver.decodeDecodable(Language.self, forKey: NSKeyedArchiveRootObjectKey) {
                logoImageView.image = UIImage(data: language.logo)
                nameLabel.text = language.name
                versionLabel.text = "\(language.version)"
                
                unarchiver.finishDecoding()
                print(language)
            }
            
        } catch {
            print(error)
        }
    }
}

