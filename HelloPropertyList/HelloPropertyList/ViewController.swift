//
//  ViewController.swift
//  HelloPropertyList
//
//  Created by 김상준 on 8/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var languageTitle: UILabel = {
        var languageTitle = UILabel()
        languageTitle.text = "Language"
        return languageTitle
        
    }()
    
    private var languageLabel: UILabel = {
        var label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private var osTitle: UILabel = {
        var osTitle = UILabel()
        osTitle.text = "OS"
        return osTitle
    }()
    
    private var osLabel: UILabel = {
        var label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private var labelVstack: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 30
        return view
    }()
    
    private var loadBundleBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Load From Bundle", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(loadFromBundle), for: .touchUpInside)
        return btn
    }()
    
    private var loadDocumentBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Load From Documents", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(loadFromDocuments), for: .touchUpInside)
        return btn
    }()
    
    private var saveDocumentBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Save To Documents", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(saveToDocuments), for: .touchUpInside)
        return btn
    }()
    
    private var btnVstack: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 30
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraint()
    }
    
    private func setConstraint() {
        view.addSubview(labelVstack)
        view.addSubview(btnVstack)
        labelVstack.translatesAutoresizingMaskIntoConstraints = false
        btnVstack.translatesAutoresizingMaskIntoConstraints = false
        
        labelVstack.addArrangedSubview(languageTitle)
        labelVstack.addArrangedSubview(languageLabel)
        labelVstack.addArrangedSubview(osTitle)
        labelVstack.addArrangedSubview(osLabel)
        
        btnVstack.addArrangedSubview(loadBundleBtn)
        btnVstack.addArrangedSubview(loadDocumentBtn)
        btnVstack.addArrangedSubview(saveDocumentBtn)
        
        NSLayoutConstraint.activate([
            labelVstack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelVstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            
            btnVstack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            btnVstack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            btnVstack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    let fileUrl: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("data").appendingPathExtension("plist")
    }()
    
    @objc func loadFromBundle() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "plist") else { fatalError() }
        
        guard let arr = try? NSArray(contentsOf: url, error: ()) as? [String] else { fatalError() }
        
        languageLabel.text = arr.first
        osLabel.text = arr.last
    }
    
    @objc func loadFromDocuments() {
        do {
            let data = try Data(contentsOf: fileUrl)
            let decoder = PropertyListDecoder()
            let dev = try decoder.decode(Development.self, from: data)
            print(dev)
            
            languageLabel.text = dev.language
            osLabel.text = dev.os
        } catch {
            print(error)
        }
        
        
    }
    
    @objc func saveToDocuments() {
        
        let dev = Development(language: "Swift", os: "macOS")
        
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(dev)
        try? data?.write(to: fileUrl)
        print("Done")
    }
}

