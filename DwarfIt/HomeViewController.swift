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
    
    lazy var picker: UIImagePickerController = {
        return UIImagePickerController()
    }()

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
    
}
