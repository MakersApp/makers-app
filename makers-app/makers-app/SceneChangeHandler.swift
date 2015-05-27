//
//  SceneChangeHandler.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 27/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class SceneChangeHandler: UIViewController {

    func ChangeScene(){

        let vc = WelcomeScreen(nibName: "WelcomeScreen", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
