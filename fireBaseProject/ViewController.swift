//
//  ViewController.swift
//  fireBaseProject
//
//  Created by r85 on 17/07/23.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAuth
import FirebaseCore

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
        //        setData()
        AllData()
    }
    
    func AddData() {
        self.ref.child("student").childByAutoId().setValue(["id":t1.text!,"name": t2.text!,"E-Mail":t3.text!])
    }
    func setData(){
        
        //refa.collection("iOS").document(t1.text!).setData(["name":t2.text])
        //refa.collection("iOS").addDocument(data:["name":t1.text])
        //        refa.collection("iOS").document("Time 8 AM").updateData(["name":t1.text])
        //        refa.collection("users").document(uid).setData(["E-mail":t1.text,"Password":t2.text]) { error in
        //            if let error = error {
        //                // Handle the write error
        //                print("Write error: \(error.localizedDescription)")
        //            } else {
        //                // Data written successfully
        //            }
        //        }
    }
    
    func AllData(){
        
        Auth.auth().createUser(withEmail: t1.text!, password: t2.text!) { [self] authResult, error in
            if error == nil {
                let uid = authResult?.user.uid
                self.refa.collection("user").document(uid!).setData(["E-mail":t1.text!,"Password":self.t2.text!]){ error in
                    if let error = error {
                        // Handle write error
                        print("Write error: \(error.localizedDescription)")
                    } else {
                        // Data written successfully
                        print("Data written successfully")
                        // Perform any additional actions after successful authentication and data write
                    }
                print("done")
            }
            }
            
            
            
            
        }
        
    }
    
}
