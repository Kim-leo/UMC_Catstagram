//
//  LoginViewController.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/01.
//

import UIKit

class LoginViewController: UIViewController {
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    // MARK: - UIComponent
    let catstagramImage: UIImageView = {
        let catstagramLogo = UIImage(named: "ic_catstagram_logo")
        let imageView: UIImageView = UIImageView()
        imageView.image = catstagramLogo
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let emailTF: UITextField = UITextField()
        emailTF.placeholder = "이메일"
        emailTF.font = UIFont(name: "System", size: 14)
        emailTF.borderStyle = .roundedRect
        emailTF.addTarget(self, action: #selector(emailTextFieldEditingChanged(_:)), for: .editingChanged)
        return emailTF
    }()
    
    let passwordTextField: UITextField = {
        let passwordTF: UITextField = UITextField()
        passwordTF.placeholder = "비밀번호"
        passwordTF.font = UIFont(name: "System", size: 14)
        passwordTF.borderStyle = .roundedRect
        passwordTF.addTarget(self, action: #selector(passwordTextFieldEditingChanged(_:)), for: .editingChanged)
        return passwordTF
    }()
    
    let forgetPasswordButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 11)
        //동작영역
        
        return btn
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        btn.backgroundColor = .disabledButtonColor
        btn.addTarget(self, action: #selector(loginButtonDidTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont(name: "GillSans-Italic", size: 11)
        return label
    }()
    
    let leftUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let rightUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let facebookLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("페이스북으로 로그인", for: .normal)
        btn.setTitleColor(.facebookColor, for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        btn.setImage(UIImage(systemName: "f.square.fill"), for: .normal)
        return btn
    }()
    
    let bottomUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("계정이 없으신가요?  가입하기", for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 12)
        btn.addTarget(self, action: #selector(registerButtonDidTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
     
        view.addSubview(catstagramImage)
        catstagramImageAutoLayout()
        view.addSubview(passwordTextField)
        passwordTextFieldAutoLayout()
        view.addSubview(emailTextField)
        emailTextFieldAutoLayout()
        view.addSubview(forgetPasswordButton)
        forgetPasswordButtonAutoLayout()
        view.addSubview(loginButton)
        loginButtonAutoLayout()
        view.addSubview(orLabel)
        orLabelAutoLayout()
        view.addSubview(leftUIView)
        leftUIViewAutoLayout()
        view.addSubview(rightUIView)
        rightUIViewAutoLayout()
        view.addSubview(facebookLoginButton)
        facebookLoginButtonAutoLayout()
        view.addSubview(registerButton)
        registerButtonAutoLayout()
        view.addSubview(bottomUIView)
        bottomUIViewAutoLayout()
        
        
    }
    // MARK: - Actions
    
    @objc func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        self.email = text
    }
    
    @objc func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.count > 2 ? .facebookColor : .disabledButtonColor
        self.password = text
    }
    
    @objc func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입 정보 전달받아서, 그것과 textField 데이터가 일치하면 로그인하기
        guard let userInfo = userInfo else { return }
        
        if userInfo.email == self.email && userInfo.password == self.password {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @objc func registerButtonDidTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // ARC -> 강한참조, weak self -> ARC 낮춰줌
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
    
    // MARK: - UIComponents AutoLayout()
    func catstagramImageAutoLayout() {
        catstagramImage.translatesAutoresizingMaskIntoConstraints = false
        catstagramImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        catstagramImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
        catstagramImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        catstagramImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    func emailTextFieldAutoLayout() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: 394).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20).isActive = true
    }
    
    func passwordTextFieldAutoLayout() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func forgetPasswordButtonAutoLayout() {
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        forgetPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        forgetPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func loginButtonAutoLayout() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor, constant: 40).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    func orLabelAutoLayout() {
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
    }
    
    func leftUIViewAutoLayout() {
        leftUIView.translatesAutoresizingMaskIntoConstraints = false
        leftUIView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        leftUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        leftUIView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor).isActive = true
        leftUIView.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -20).isActive = true
    }
    
    func rightUIViewAutoLayout() {
        rightUIView.translatesAutoresizingMaskIntoConstraints = false
        rightUIView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rightUIView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor).isActive = true
        rightUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rightUIView.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 20).isActive = true
    }
    
    func facebookLoginButtonAutoLayout() {
        facebookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookLoginButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 25).isActive = true
    }
    
    func bottomUIViewAutoLayout() {
        bottomUIView.translatesAutoresizingMaskIntoConstraints = false
        bottomUIView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        bottomUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        bottomUIView.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -15).isActive = true
    }
    
    func registerButtonAutoLayout() {
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    }
}
