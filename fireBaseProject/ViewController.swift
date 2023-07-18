//
//  ViewController.swift
//  fireBaseProject
//
//  Created by r85 on 17/07/23.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class ViewController: UIViewController {

    var ref: DatabaseReference!
    var refa : Firestore!
    
    
    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        refa = Firestore.firestore()
    }


    @IBAction func save(_ sender: Any) {
//        AddData()
        setData()
    }
    
    func AddData() {
        self.ref.child("student").childByAutoId().setValue(["id":t1.text!,"name": t2.text!,"E-Mail":t3.text!])
    }
    func setData(){
        //refa.collection("iOS").document(t1.text!).setData(["name":t2.text])
        //refa.collection("iOS").addDocument(data:["name":t1.text])
        refa.collection("iOS").document("Time 8 AM").updateData(["name":t1.text])
    }
    
    
}

