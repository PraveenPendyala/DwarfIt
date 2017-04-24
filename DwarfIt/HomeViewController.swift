//
//  HomeViewController.swift
//  DwarfIt
//
//  Created by Praveen Pendyala on 4/12/17.
//  Copyright © 2017 Praveen Pendyala. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var selectedImageView: UIImageView!
    
    lazy var picker: UIImagePickerController = {
        return UIImagePickerController()
    }()

    @IBAction func loadImagePicker(_ sender: Any) {
        self.present(self.picker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: -
// MARK: Image Picker Delegate

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImageView.image = selectedImage
            var rotationAndPerspectiveTransform = CATransform3DIdentity
            rotationAndPerspectiveTransform.m34 = 1.0 / 1000
            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat( 45 * .pi/180.0), 1, 0, 0)
            self.selectedImageView.layer.transform   = rotationAndPerspectiveTransform
        }
        self.picker.dismiss(animated: true, completion: nil)
    }
}
