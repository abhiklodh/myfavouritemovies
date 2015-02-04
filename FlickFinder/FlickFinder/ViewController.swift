//
//  ViewController.swift
//  FlickFinder
//
//  Created by Jarrod Parkes on 1/29/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!

    @IBAction func searchPhotosByPhraseButtonTouchUp(sender: AnyObject) {
        println("Implement this function...")
    }
    
    @IBAction func searchPhotosByLatLonButtonTouchUp(sender: AnyObject) {
        println("Will implement this function in a later step...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

