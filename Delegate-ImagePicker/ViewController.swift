//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 윤성호 on 30/01/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

// 델리게이트 패턴 1 : UIImagePickerControllerDelegate, UINavigationControllerDelegate 프로토콜 추가
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imgView: UIImageView! // 이미지뷰

    // 이미지 선택 이벤트
    @IBAction func pick(_ sender: Any) {
        
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary   // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        picker.delegate = self  // 델리게이트 패턴 2 : 이미지 피커 컨트롤러 인스턴스의 delegate 속성값에 self 대입
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
    }
    
    /**
     * 델리게이트 패턴 3 :이미지 피커의 델리게이트 패턴 메소드 구현
     */
    
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false){ () in
            
            // 이미지를 이미지 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
        
    }
    
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false){ () in
            
            // 이미지 피커 컨트롤러가 닫힌 후에 알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            
            self.present(alert, animated: false)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

