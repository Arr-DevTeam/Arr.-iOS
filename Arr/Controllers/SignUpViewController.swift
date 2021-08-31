//
//  SignUpViewController.swift
//  Arr
//
//  Created by 노연주 on 2021/08/26.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController{
    //MARK: - Properties
    
    lazy var titleLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 214, blue: 214)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "Sign Up"
        $0.textColor = .rgb(red: 255, green: 135, blue: 133)
        $0.dynamicFont(fontSize: 23, currentFontName: "SeoulNamsanM")
    }
    
    lazy var idContainer = SignUpTextFieldView()
    
    lazy var duplicateBtn = UIButton().then {
        $0.setTitle("중복확인", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanL")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
    }
    
    lazy var pwContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "비밀번호"
        $0.tf.placeholder = "비밀번호"
        $0.tf.isSecureTextEntry = true
    }
    
    lazy var rePwContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "비밀번호 확인"
        $0.tf.placeholder = "비밀번호 확인"
        $0.tf.isSecureTextEntry = true
    }
    
    lazy var nameContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "이름"
        $0.tf.placeholder = "실명을 입력해주세요"
    }
    
    lazy var emailContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "이메일"
        $0.tf.placeholder = "이메일을 입력해주세요"
    }
    
    lazy var phoneNumContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "휴대폰 번호"
        $0.tf.placeholder = "숫자만 입력해주세요"
    }
    
    lazy var certificationBtn = UIButton().then {
        $0.setTitle("인증번호 전송", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanL")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
    }
    
    lazy var certificationNumContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "인증 번호"
        $0.tf.placeholder = "인증번호 입력"
    }
    
    lazy var certificationCheckBtn = UIButton().then {
        $0.setTitle("인증번호 확인", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanL")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
    }

    lazy var dateOfBirthContainer = SignUpTextFieldView().then {
        $0.tfTitle.text = "생년월일"
        $0.tf.placeholder = "8자리 입력"
    }
    
    lazy var allButton = TermsCustomButtonView().then {
        $0.addTarget(self, action: #selector(AonTapButton), for: .touchUpInside)
    }
    lazy var termButton1 = TermsCustomButtonView().then {
        $0.addTarget(self, action: #selector(onTapButton1), for: .touchUpInside)
    }
    lazy var termButton2 = TermsCustomButtonView().then {
        $0.addTarget(self, action: #selector(onTapButton2), for: .touchUpInside)
    }
    lazy var termButton3 = TermsCustomButtonView().then {
        $0.addTarget(self, action: #selector(onTapButton3), for: .touchUpInside)
    }
    
    lazy var allAgreeLabel = UILabel().then {
        $0.text = "모두 동의합니다"
        $0.textColor = .rgb(red: 255, green: 135, blue: 133)
        $0.dynamicFont(fontSize: 15, currentFontName: "SeoulNamsanM")
    }
    
    lazy var termLabel1 = UILabel().then {
        $0.text = "이용약관 동의"
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
        $0.dynamicFont(fontSize: 15, currentFontName: "SeoulNamsanM")
    }
    
    lazy var termLabel2 = UILabel().then {
        $0.text = "개인정보 취급방침 동의"
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
        $0.dynamicFont(fontSize: 15, currentFontName: "SeoulNamsanM")
    }
    
    lazy var termLabel3 = UILabel().then {
        $0.text = "마케팅 정보 수신 동의"
        $0.textColor = .rgb(red: 196, green: 196, blue: 196)
        $0.dynamicFont(fontSize: 15, currentFontName: "SeoulNamsanM")
    }
    
    lazy var termInButton1 = TermInButtonView()
    lazy var termInButton2 = TermInButtonView()
    lazy var termInButton3 = TermInButtonView()
    
    lazy var signUpBtn = UIButton().then {
        $0.setTitle("회원가입 하기", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanL")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
    }
    
    lazy var backBtn = UIButton().then {
        $0.setTitle("취소하기", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "SeoulNamsanL")
        $0.setTitleColor(.rgb(red: 255, green: 109, blue: 107), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 255, green: 109, blue: 107).cgColor
        $0.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
       
    //MARK: - Selectors
    
    lazy var flag1 = false
    lazy var flag2 = false
    lazy var flag3 = false
    lazy var AllFlag = false
    
    @objc
    func onTapButton1(){
        if flag1 == false {
            termButton1.bgColor = .TERM_CHECKED
            flag1 = true
            if flag2 == true && flag3 == true {
                allButton.bgColor = .TERM_CHECKED
                AllFlag = true
            }
        } else if flag1 == true {
            termButton1.bgColor = .TERM_UNCHECKED
            allButton.bgColor = .TERM_UNCHECKED
            AllFlag = false
            flag1 = false
        }
    }
    
    @objc
    func onTapButton2(){
        if flag2 == false {
            termButton2.bgColor = .TERM_CHECKED
            flag2 = true
            if flag1 == true && flag3 == true {
                allButton.bgColor = .TERM_CHECKED
                AllFlag = true
            }
        } else if flag2 == true {
            termButton2.bgColor = .TERM_UNCHECKED
            allButton.bgColor = .TERM_UNCHECKED
            AllFlag = false
            flag2 = false
        }
    }
        
    @objc
    func onTapButton3(){
        if flag3 == false {
            termButton3.bgColor = .TERM_CHECKED
            flag3 = true
            if flag1 == true && flag2 == true {
                allButton.bgColor = .TERM_CHECKED
                AllFlag = true
            }
        } else if flag3 == true {
            termButton3.bgColor = .TERM_UNCHECKED
            allButton.bgColor = .TERM_UNCHECKED
            AllFlag = false
            flag3 = false
        }
    }
        
    @objc
    func AonTapButton(){
        if AllFlag == false {
            allButton.bgColor = .TERM_CHECKED
            termButton1.bgColor = .TERM_CHECKED
            termButton2.bgColor = .TERM_CHECKED
            termButton3.bgColor = .TERM_CHECKED
            flag1 = true
            flag2 = true
            flag3 = true
            AllFlag = true
        } else if AllFlag == true {
            allButton.bgColor = .TERM_UNCHECKED
            termButton1.bgColor = .TERM_UNCHECKED
            termButton2.bgColor = .TERM_UNCHECKED
            termButton3.bgColor = .TERM_UNCHECKED
            flag1 = false
            flag2 = false
            flag3 = false
            AllFlag = false
        }
    }
    
    @objc
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        textFieldContainerViewSetting()       
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(titleLine)
        view.addSubview(titleLabel)
        view.addSubview(idContainer)
        view.addSubview(duplicateBtn)
        view.addSubview(pwContainer)
        view.addSubview(rePwContainer)
        view.addSubview(nameContainer)
        view.addSubview(emailContainer)
        view.addSubview(phoneNumContainer)
        view.addSubview(certificationBtn)
        view.addSubview(certificationNumContainer)
        view.addSubview(certificationCheckBtn)
        view.addSubview(dateOfBirthContainer)
        view.addSubview(allButton)
        view.addSubview(termButton1)
        view.addSubview(termButton2)
        view.addSubview(termButton3)
        view.addSubview(allAgreeLabel)
        view.addSubview(termLabel1)
        view.addSubview(termLabel2)
        view.addSubview(termLabel3)
        view.addSubview(termInButton1)
        view.addSubview(termInButton2)
        view.addSubview(termInButton3)
        view.addSubview(signUpBtn)
        view.addSubview(backBtn)
    }
    
    func cornerRadius(){
        duplicateBtn.layer.cornerRadius = self.view.frame.width/27.07
        certificationBtn.layer.cornerRadius = self.view.frame.width/27.07
        certificationCheckBtn.layer.cornerRadius = self.view.frame.width/27.07
        allButton.layer.cornerRadius = self.view.frame.width/53.57
        termButton1.layer.cornerRadius = self.view.frame.width/53.57
        termButton2.layer.cornerRadius = self.view.frame.width/53.57
        termButton3.layer.cornerRadius = self.view.frame.width/53.57
        signUpBtn.layer.cornerRadius = self.view.frame.width/27.07
        backBtn.layer.cornerRadius = self.view.frame.width/27.07
    }
    
    func location(){
        titleLine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/14.76)
            make.left.equalToSuperview().offset(self.view.frame.width/10.42)
            make.width.equalToSuperview().dividedBy(4.52)
            make.height.equalToSuperview().dividedBy(90.22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLine).offset(-self.view.frame.height/406)
            make.right.equalTo(titleLine).offset(self.view.frame.width/46.88)
        }
        
        idContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
            make.width.equalToSuperview().dividedBy(1.88)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalToSuperview().offset(self.view.frame.height/8.37)
        }
        
        idContainer.tf.snp.makeConstraints { make in
            make.left.equalTo(idContainer)
        }
        
        idContainer.divView.snp.makeConstraints { make in
            make.left.equalTo(idContainer)
        }
        
        duplicateBtn.snp.makeConstraints { make in
            make.bottom.equalTo(idContainer)
            make.left.equalTo(idContainer.snp.right)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
        
        pwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(idContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        rePwContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(pwContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        nameContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(rePwContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        emailContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(nameContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        phoneNumContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
            make.width.equalToSuperview().dividedBy(1.88)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(emailContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        phoneNumContainer.tf.snp.makeConstraints { make in
            make.left.equalTo(phoneNumContainer)
        }
        
        phoneNumContainer.divView.snp.makeConstraints { make in
            make.left.equalTo(phoneNumContainer)
        }
        
        certificationBtn.snp.makeConstraints { make in
            make.bottom.equalTo(phoneNumContainer)
            make.left.equalTo(phoneNumContainer.snp.right)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
        
        certificationNumContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.81)
            make.width.equalToSuperview().dividedBy(1.88)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(phoneNumContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        certificationNumContainer.tf.snp.makeConstraints { make in
            make.left.equalTo(certificationNumContainer)
        }
        
        certificationNumContainer.divView.snp.makeConstraints { make in
            make.left.equalTo(certificationNumContainer)
        }
        
        certificationCheckBtn.snp.makeConstraints { make in
            make.bottom.equalTo(certificationNumContainer)
            make.left.equalTo(certificationNumContainer.snp.right)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
        
        dateOfBirthContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.34)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(certificationNumContainer.snp.bottom).offset(self.view.frame.height/27.07)
        }
        
        allButton.snp.makeConstraints { make in
            make.top.equalTo(dateOfBirthContainer.snp.bottom).offset(self.view.frame.height/26.2)
            make.left.equalTo(dateOfBirthContainer)
            make.width.height.equalTo(self.view.frame.width/26.78)
        }
        
        termButton1.snp.makeConstraints { make in
            make.top.equalTo(allButton.snp.bottom).offset(self.view.frame.height/135.33)
            make.left.equalTo(dateOfBirthContainer)
            make.width.height.equalTo(self.view.frame.width/26.78)
        }
        
        termButton2.snp.makeConstraints { make in
            make.top.equalTo(termButton1.snp.bottom).offset(self.view.frame.height/135.33)
            make.left.equalTo(dateOfBirthContainer)
            make.width.height.equalTo(self.view.frame.width/26.78)
        }
        
        termButton3.snp.makeConstraints { make in
            make.top.equalTo(termButton2.snp.bottom).offset(self.view.frame.height/135.33)
            make.left.equalTo(dateOfBirthContainer)
            make.width.height.equalTo(self.view.frame.width/26.78)
        }
        
        allAgreeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(allButton)
            make.left.equalTo(allButton.snp.right).offset(self.view.frame.width/46.85)
        }
        
        termLabel1.snp.makeConstraints { make in
            make.centerY.equalTo(termButton1)
            make.left.equalTo(termButton1.snp.right).offset(self.view.frame.width/46.85)
        }
        
        termLabel2.snp.makeConstraints { make in
            make.centerY.equalTo(termButton2)
            make.left.equalTo(termButton2.snp.right).offset(self.view.frame.width/46.85)
        }
        
        termLabel3.snp.makeConstraints { make in
            make.centerY.equalTo(termButton3)
            make.left.equalTo(termButton3.snp.right).offset(self.view.frame.width/46.85)
        }
        
        termInButton1.snp.makeConstraints { make in
            make.centerY.equalTo(termLabel1)
            make.left.equalTo(termLabel1.snp.right).offset(self.view.frame.width/2.12)
            make.width.equalToSuperview().dividedBy(75)
            make.height.equalToSuperview().dividedBy(90.22)
        }
        
        termInButton2.snp.makeConstraints { make in
            make.centerY.equalTo(termLabel2)
            make.left.equalTo(termInButton1)
            make.width.height.equalTo(termInButton1)
        }
        
        termInButton3.snp.makeConstraints { make in
            make.centerY.equalTo(termLabel3)
            make.left.equalTo(termInButton1)
            make.width.height.equalTo(termInButton1)
        }
        
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(termInButton3).offset(self.view.frame.height/28)
            make.right.equalTo(termInButton3).offset(self.view.frame.width/41.67)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
        
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(signUpBtn)
            make.right.equalTo(signUpBtn.snp.left).offset(-self.view.frame.width/46.88)
            make.width.equalToSuperview().dividedBy(4.69)
            make.height.equalToSuperview().dividedBy(30.07)
        }
    }
    
    func textFieldContainerViewSetting(){
        // idContainer Settig
        idContainer.addSubview(idContainer.tfTitle)
        idContainer.addSubview(idContainer.tf)
        idContainer.addSubview(idContainer.divView)
        
        idContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // pwContainer Setting
        pwContainer.addSubview(pwContainer.tfTitle)
        pwContainer.addSubview(pwContainer.tf)
        pwContainer.addSubview(pwContainer.divView)
        
        pwContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // rePwContainer Setting
        rePwContainer.addSubview(rePwContainer.tfTitle)
        rePwContainer.addSubview(rePwContainer.tf)
        rePwContainer.addSubview(rePwContainer.divView)
        
        rePwContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // nameContainer Setting
        nameContainer.addSubview(nameContainer.tfTitle)
        nameContainer.addSubview(nameContainer.tf)
        nameContainer.addSubview(nameContainer.divView)
        
        nameContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // emailContainer Setting
        emailContainer.addSubview(emailContainer.tfTitle)
        emailContainer.addSubview(emailContainer.tf)
        emailContainer.addSubview(emailContainer.divView)
        
        emailContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // phoneNumContainer Setting
        phoneNumContainer.addSubview(phoneNumContainer.tfTitle)
        phoneNumContainer.addSubview(phoneNumContainer.tf)
        phoneNumContainer.addSubview(phoneNumContainer.divView)
        
        phoneNumContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        // phoneNumContainer Setting
        certificationNumContainer.addSubview(certificationNumContainer.tfTitle)
        certificationNumContainer.addSubview(certificationNumContainer.tf)
        certificationNumContainer.addSubview(certificationNumContainer.divView)
        
        certificationNumContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)

        // dateOfBirthContainer Setting
        dateOfBirthContainer.addSubview(dateOfBirthContainer.tfTitle)
        dateOfBirthContainer.addSubview(dateOfBirthContainer.tf)
        dateOfBirthContainer.addSubview(dateOfBirthContainer.divView)
        
        dateOfBirthContainer.signUpTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpViewController()

    }

}
@available(iOS 13.0, *)
struct SignUpViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
