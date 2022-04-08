//
//  HomeViewController.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UIComponents
    let navigationUIView: UIView = {
        let view = UIView()
        return view
    }()
    
    let catstagramImage: UIImageView = {
        let catstagramLogo = UIImage(named: "ic_catstagram_logo")
        let imageView: UIImageView = UIImageView()
        imageView.image = catstagramLogo
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    let sendButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(named: "ic_home_send"), for: .normal)
        return btn
    }()
    
    let heartButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_heart"), for: .normal)
        return btn
    }()
    
    let uploadButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_upload"), for: .normal)
        return btn
    }()
    
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponentsToScreen()
        
    }
    
    // MARK: - AutoLayout()
    func addComponentsToScreen() {
        view.addSubview(navigationUIView)
        navigationUIViewAutoLayout()
        navigationUIView.addSubview(catstagramImage)
        catstagramImageAutoLayout()
        navigationUIView.addSubview(sendButton)
        sendButtonAutoLayout()
        navigationUIView.addSubview(heartButton)
        heartButtonAutoLayout()
        navigationUIView.addSubview(uploadButton)
        uploadButtonAutoLayout()
    }
    
    func navigationUIViewAutoLayout() {
        navigationUIView.translatesAutoresizingMaskIntoConstraints = false
        navigationUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationUIView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func catstagramImageAutoLayout() {
        catstagramImage.translatesAutoresizingMaskIntoConstraints = false
        catstagramImage.leadingAnchor.constraint(equalTo: navigationUIView.leadingAnchor, constant: 15).isActive = true
        catstagramImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        catstagramImage.topAnchor.constraint(equalTo: navigationUIView.topAnchor, constant: 5).isActive = true
        catstagramImage.bottomAnchor.constraint(equalTo: navigationUIView.bottomAnchor, constant: 5).isActive = true
    }
    
    func sendButtonAutoLayout() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.centerYAnchor.constraint(equalTo: navigationUIView.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: navigationUIView.trailingAnchor, constant: -15).isActive = true
    }
    
    func heartButtonAutoLayout() {
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        heartButton.centerYAnchor.constraint(equalTo: navigationUIView.centerYAnchor).isActive = true
        heartButton.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -15).isActive = true
    }
    
    func uploadButtonAutoLayout() {
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        uploadButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        uploadButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        uploadButton.centerYAnchor.constraint(equalTo: navigationUIView.centerYAnchor).isActive = true
        uploadButton.trailingAnchor.constraint(equalTo: heartButton.leadingAnchor, constant: -15).isActive = true
    }

}
