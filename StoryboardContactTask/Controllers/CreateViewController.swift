//
//  CreateViewController.swift
//  StoryboardContactTask
//
//  Created by Muhammadjon Mamarasulov on 1/27/22.
//

import UIKit

class CreateViewController: BaseViewController {

    @IBOutlet weak var bodyText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    var home = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func apiPostCreate(post: Contact) {
              showProgress()
              AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
                  self.hideProgress()
                  switch response.result {
                  case .success:
                      print(response.result)
                      self.home.self.apiPostList()
                  case let .failure(error):
                      print(error)
                  }
              })
    }


    @IBAction func addButton(_ sender: Any) {
             let nameTitle = titleText.text
             let nameBody = bodyText.text
             self.apiPostCreate(post: Contact(title: nameTitle!, body: nameBody!))
                     
             let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
             self.navigationController?.pushViewController(homeView, animated: true)
                     
             if nameTitle != nil && nameBody != nil {
                  titleText.text = nil
                  bodyText.text = nil
            }
    }
    

}
