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
            let filter = CIFilter(name: "CIPerspectiveTransform", withInputParameters: ["inputImage" : CIImage(cgImage: selectedImage.cgImage!) ])
            filter?.setDefaults()
            filter?.setValue(CIVector(x:180, y:600) , forKey: "inputTopLeft")
            filter?.setValue(CIVector(x:102, y:20) , forKey: "inputBottomLeft")
            let ciImage = filter?.value(forKey: kCIOutputImageKey)
            self.selectedImageView.image = UIImage(ciImage: ciImage as! CIImage)
        }
        self.picker.dismiss(animated: true, completion: nil)
    }
}
