//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 윤성호 on 30/01/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView! // 이미지뷰

    // 이미지 선택 이벤트
    @IBAction func pick(_ sender: Any) {
        
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary   // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

