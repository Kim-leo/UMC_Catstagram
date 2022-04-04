//
//  RegisterViewController.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/01.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - UIComponents
    let catstagramImage: UIImageView = {
        let catstagramLogo = UIImage(named: "ic_catstagram_logo")
        let imageView: UIImageView = UIImageView()
        imageView.image = catstagramLogo
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    let joinLabel: UILabel = {
        let label = UILabel()
        label.text = "친구들의 사진과 동영상을 보려면 가입하세요"
        label.font = UIFont(name: "GillSans-Italic", size: 13)
        label.textAlignment = .center
        return label
    }()
    
    let facebookLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("페이스북으로 로그인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .facebookColor
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        btn.setImage(UIImage(systemName: "f.square.fill"), for: .normal)
        btn.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 13)
        
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
    
    let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    
    let emailTextField: UITextField = {
        let TF = UITextField()
        TF.placeholder = "휴대폰번호 또는 이메일주소"
        TF.font = UIFont(name: "System", size: 14)
        TF.borderStyle = .roundedRect
        return TF
    }()
    
    let nameTextField: UITextField = {
        let TF = UITextField()
        TF.placeholder = "성명"
        TF.font = UIFont(name: "System", size: 14)
        TF.borderStyle = .roundedRect
        return TF
    }()
    
    let nicknameTextField: UITextField = {
        let TF = UITextField()
        TF.placeholder = "사용자이름"
        TF.font = UIFont(name: "System", size: 14)
        TF.borderStyle = .roundedRect
        return TF
    }()
    
    let passwordTextField: UITextField = {
        let TF = UITextField()
        TF.placeholder = "비밀번호"
        TF.font = UIFont(name: "System", size: 14)
        TF.borderStyle = .roundedRect
        return TF
    }()
    
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .disabledButtonColor
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        //동작영역
        btn.addTarget(self, action: #selector(registerButtonDidTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    let bottomUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let popToLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("계정이 있으신가요?  로그인", for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 12)
        btn.addTarget(self, action: #selector(popToLoginButtonDidTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Properties
    // 유효성검사를 위한 프로퍼티
    
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
            //isValidEmail에서 값을 입력받을때마다 validateUserInfo()메소드가 호출됨. 프로퍼티 옵저버
        }
    }
    
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var textField: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBackToLoginViewController(_:)))
        navigationItem.leftBarButtonItem?.tintColor = .darkGray
        
        setupTextField()
        labelSetupAttribute()
        setupAttribute()
        addComponentsToScreen()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    
    // MARK: - Actions
    @objc func goBackToLoginViewController(_ sender: UIBarButtonItem) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registerButtonDidTap(_ sender: UIButton) {
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        self.userInfo?(userInfo)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func popToLoginButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    // MARK: - Helpers
    private func setupTextField() {
        
        textField.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI업데이트
    private func validateUserInfo() {
        
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            
            self.registerButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.registerButton.backgroundColor = UIColor.facebookColor
            }
            
        } else {
            // 유효성검사 -> 유효하지 않음
            self.registerButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.registerButton.backgroundColor = UIColor.disabledButtonColor
            }
        }
    }
    
    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }

    private func labelSetupAttribute() {
        let text1 = "친구들의 사진과 동영상을 보려면"
        let text2 = "가입하세요"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.preferredFont(forTextStyle: .subheadline, compatibleWith: nil)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.black
        
        let attributes = generateLabelAttribute(self.joinLabel, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.joinLabel.attributedText = attributes
    }
    
    // MARK: - AutoLayout()
    
    func addComponentsToScreen() {
        view.addSubview(catstagramImage)
        catstagramImageAutoLayout()
        view.addSubview(joinLabel)
        joinLabelAutoLayout()
        view.addSubview(facebookLoginButton)
        facebookLoginButtonAutoLayout()
        view.addSubview(orLabel)
        orLabelAutoLayout()
        view.addSubview(leftUIView)
        leftUIViewAutoLayout()
        view.addSubview(rightUIView)
        rightUIViewAutoLayout()
        view.addSubview(textFieldStackView)
        textFieldStackViewAutoLayout()
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(nameTextField)
        textFieldStackView.addArrangedSubview(nicknameTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        view.addSubview(registerButton)
        registerButtonAutoLayout()
        view.addSubview(popToLoginButton)
        popToLoginButtonAutoLayout()
        view.addSubview(bottomUIView)
        bottomUIViewAutoLayout()
    }
    func catstagramImageAutoLayout() {
        catstagramImage.translatesAutoresizingMaskIntoConstraints = false
        catstagramImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        catstagramImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
        catstagramImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        catstagramImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    func joinLabelAutoLayout() {
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        joinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        joinLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        joinLabel.topAnchor.constraint(equalTo: catstagramImage.bottomAnchor, constant: 25).isActive = true
    }
    
    func facebookLoginButtonAutoLayout() {
        facebookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookLoginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        facebookLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        facebookLoginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        facebookLoginButton.topAnchor.constraint(equalTo: joinLabel.bottomAnchor, constant: 25).isActive = true
    }
    
    func orLabelAutoLayout() {
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orLabel.topAnchor.constraint(equalTo: facebookLoginButton.bottomAnchor, constant: 35).isActive = true
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
    
    func textFieldStackViewAutoLayout() {
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 40).isActive = true
        textFieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    func registerButtonAutoLayout() {
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 25).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func popToLoginButtonAutoLayout() {
        popToLoginButton.translatesAutoresizingMaskIntoConstraints = false
        popToLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popToLoginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    }
    
    func bottomUIViewAutoLayout() {
        bottomUIView.translatesAutoresizingMaskIntoConstraints = false
        bottomUIView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        bottomUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        bottomUIView.bottomAnchor.constraint(equalTo: popToLoginButton.topAnchor, constant: -15).isActive = true
    }
    
    
    
}

// 유효성 검사 로직
// 정규표현식
extension String {
    
    func isValidPassword() -> Bool {
        //대문자, 소문자, 특수문자, 숫자 8자 이상일 때 -> true
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        // @, 2글자 이상일 때 -> true
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}
