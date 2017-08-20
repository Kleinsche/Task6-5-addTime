//
//  TableViewController.swift
//  Task6-5
//
//  Created by 🍋 on 16/7/23.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    fileprivate var dateSource = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.leftBarButtonItem = self.editButtonItem

    }
    
    //构造添加时间方法
    func addDateList(){
        let nowDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: nowDate)
        dateSource.add(dateString)
    }
    
    /*
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     */
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateSource.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let dictionary = dateSource.object(at: (indexPath as NSIndexPath).row)
        let day = cell.viewWithTag(1) as! UILabel
        day.text = dictionary as? String
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictionary = dateSource.object(at: (indexPath as NSIndexPath).row)
        let contentVc = storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ViewController
        contentVc.setContent(dictionary as! String)
        navigationController?.pushViewController(contentVc, animated: true)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
                if editingStyle == .delete {
        dateSource.removeObject(at: (indexPath as NSIndexPath).row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        
                } else if editingStyle == .insert {
                    
                }
    }
    
    @IBAction func addDate(_ sender: AnyObject) {
        addDateList()
//        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: dateSource.count - 1, section: 0)], with: .none)
        tableView.endUpdates()
        tableView.scrollToRow(at: IndexPath(row: dateSource.count - 1, section: 0), at: .top, animated: true)
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
