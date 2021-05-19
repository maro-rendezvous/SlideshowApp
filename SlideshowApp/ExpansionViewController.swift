//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 落合克彦 on 2021/05/19.
//

import UIKit

class ExpansionViewController: UIViewController {

    var image:UIImage!
    
    @IBOutlet weak var imageViewExpansiion2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewExpansiion2.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
