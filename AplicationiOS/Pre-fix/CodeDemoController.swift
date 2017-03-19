//
//  CodeDemoController.swift
//  Restaurant
//
//  Created by TVT25 on 8/3/16.
//  Copyright © 2016 TVT25. All rights reserved.
//

import UIKit

//MARK: - DELEGATE DEMO

//1. Khai báo protocol ABBDelegate
//2. Var delegate:ABBDelegate
//3. delegate?.getSortValue(row)

//4. import ABBDelegate
//5. Sử dụng hàm getSortValue(row)


protocol ABDelegate {
    
    func getSortValue(_ index:Int)
}

class CodeDemoController: UIViewController ,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    var delegate: ABDelegate?

    
    
    //MARK: - SELF

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        setupVar()
        callAPI()
    }
    
    
    //MARK: - SETUP UI & VAR

    func setupVar() {
        
        
    }
    
    func setupUI() {
        
//        let viewLeftName: UIView = UIView (frame: CGRectMake(0, 0, 10, self.tfName.frame.size.height))
//        self.tfName.leftView = viewLeftName
//        self.tfName.leftViewMode = UITextFieldViewMode.Always;
        
        
    }
    
    func createBarButtonItem()  {
        
        let image = UIImage(named: "slide_menu.png")
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
        button.addTarget(self, action: Selector(("slideMenuAction:")), for: UIControlEvents.touchUpInside)
        button .setTitle("", for: UIControlState())
        button.titleLabel?.font = UIFont.init(name: FONT_DEFAULT, size: 12)
        button .titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        let barButtonItem = UIBarButtonItem()
        barButtonItem.customView = button;
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        
    }
    
    func setupValidateTexField() {
        
//        self.tfName.validateOnCharacterChanged = false
//        
//        self.tfEmail .addRegx(REGEX_EMAIL, withMsg: "Email is invalid")
//        self.tfEmail.validateOnCharacterChanged = false
//        
//        self.tfPassword.addRegx(REGEX_PASSWORD_LIMIT, withMsg:"Password characters limit should be come between 6 - 20")
//        self.tfPassword.validateOnCharacterChanged = false
//        
//        self.tfPhoneNumber.addRegx(REGEX_PHONE_US, withMsg:"Phone number must be in proper format (eg. (###) ###-####)")
//        self.tfPhoneNumber.validateOnCharacterChanged = false
        
//       self.tfPhoneNumber.addTarget(self, action: #selector(YourViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)


    }
//    func validateData() -> Bool {
//        
//        // include show message if data invalid
//        var isValid:Bool = false
//        var activeView:UIView = UIView()
//        
//        if (self.tfName.text?.characters.count == 0) {
//            if (isValid == false) {
//                activeView = self.tfName;
//                isValid = false;
//            }
//        }
//            
//        else  if (self.tfPhoneNumber.text?.characters.count == 0) {
//            if (isValid == true) {
//                activeView = self.tfPhoneNumber;
//                isValid = false;
//            }
//        }
//        else if (!NSString .isValidPhoneUS(self.tfPhoneNumber.text)) {
//            if (isValid == true) {
//                activeView = self.tfPhoneNumber;
//                isValid = false;
//            }
//        }
//        else  if (self.tfEmail.text?.characters.count == 0) {
//            if (isValid == true) {
//                activeView = self.tfEmail;
//                isValid = false;
//            }
//        }
//        else if (!NSString .isValidEmail(self.tfEmail.text)) {
//            if (isValid == true) {
//                activeView = self.tfEmail;
//                isValid = false;
//            }
//        }
//        else if (self.tfName.text?.characters.count == 0) {
//            if (isValid == false) {
//                activeView = self.tfName;
//                isValid = false;
//            }
//        }
//        
//        
//        
//        let isFormValid:Bool = self.tfEmail.validate() && self.tfPhoneNumber.validate() && self.tfPassword.validate() && self.tfName.validate()
//        if (isValid == true) {
//            isValid = isFormValid;
//        }
//        
//        return isValid;
//    }
    //MARK - CALL API
    
    func callAPI() {
        
        
    }
    
    
    //MARK: - FILL DATA
    
    func fillData() {
        
        
    }
    
    
    //MARK: - TEXFIELD DELEGATE
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        
        // return NO to not change text
        
        
        return true
        
    }
    func textFieldDidChange(_ textField: UITextField) {
        //your code
        
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {

    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore. {

        return true
    }
    //MARK: - CALL API
    
    
    
    
    //MARK: - BUTTON ACTION

    
    
    //MARK: - COLLECTIONVIEW DELEGATE
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell
    {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale;
        
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        
        
    }
    
    
    //MARK: - TABLE DELEGATE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Title Header"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale;
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 0
        
    }
    
   
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    //MARK: - TABLEVIEW ACTION CLICK

    
    //MARK: - PICKER VIEW DELEGATE
    
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "Title"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        delegate?.getSortValue(row)

    }

    //MARK: - WEBVIEW DELEGATE
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        //RappleActivityIndicatorView.startAnimating()

    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        //RappleActivityIndicatorView.stopAnimating()
        
        
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        //RappleActivityIndicatorView.stopAnimating()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "TODETAIL") {
            // pass data to next view
            
        }
    }

}
