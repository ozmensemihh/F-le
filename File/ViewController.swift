//
//  ViewController.swift
//  File
//
//  Created by Dijitalvarliklar on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtGirdi: UITextField!
    
    @IBOutlet weak var imgResim: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dosyaYaz(_ sender: Any) {
        
        let message = txtGirdi.text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
                   
            do{
                try message?.write(to: dosyaYolu, atomically: false, encoding: .utf8)
                txtGirdi.text?.removeAll()
                
            }catch{
                print("Dosya yazarken hata oldu")
            }
            
        }
        
        
    }
    @IBAction func dosyaOku(_ sender: UIButton) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                do{
                    txtGirdi.text = try String(contentsOf: dosyaYolu, encoding: .utf8)
                }catch{
                    print("Dosya okurken hata oldu")
                }
            }
            
        }
        
    }
    
    @IBAction func dosyaSil(_ sender: UIButton) {
        
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path) {
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                    txtGirdi.text?.removeAll()
                    
                }catch{
                    print("Dosya yazarken hata oldu")
                }
            }
            
                   
           
            
        }
        
    }
    
    
    @IBAction func resimKaydet(_ sender: Any) {
    }
    
    @IBAction func resimGöster(_ sender: UIButton) {
    }
    
    @IBAction func resimSil(_ sender: Any) {
    }
    
}

