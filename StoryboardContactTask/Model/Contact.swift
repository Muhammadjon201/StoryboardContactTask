//
//  Contact.swift
//  StoryboardContactTask
//
//  Created by Muhammadjon Mamarasulov on 1/27/22.
//

import Foundation

struct Contact: Decodable{
    var id: String? = ""
    var title: String? = ""
    var body: String? = ""
    
    init(title: String, body: String){
        self.title = title
        self.body = body
    }
}
