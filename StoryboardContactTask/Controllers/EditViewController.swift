//
//  EditViewController.swift
//  StoryboardContactTask
//
//  Created by Muhammadjon Mamarasulov on 1/27/22.
//

import UIKit

class EditViewController: BaseViewController {

    @IBOutlet weak var editingTitle: UITextField!
    @IBOutlet weak var editingBody: UITextField!
    @IBOutlet weak var editingId: UITextField!
    
    var home = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func apiPostUptade(post: Contact) {
                  showProgress()
                  AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: {response in
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
    
    @IBAction func editingButton(_ sender: Any) {
        
             let nameTitle = editingTitle.text
             let nameBody = editingBody.text
             let nameId = editingId.text
             self.apiPostUptade(post: Contact(title: nameTitle!, body: nameTitle!, id: nameId!))
                             
             let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
             self.navigationController?.pushViewController(homeView, animated: true)
                             
             if nameTitle != nil && nameBody != nil {
                  editingTitle.text = nil
                  editingBody.text = nil
             }
        
    }
    

}
