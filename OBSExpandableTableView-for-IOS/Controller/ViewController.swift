//
//  ViewController.swift
//  OBSExpandableTableView-for-IOS
//
//  Created by MAC-OBS- on 23/09/20.
//  Copyright © 2020 MAC-OBS-. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate{
    //Views
    //Header view
    lazy var headerView : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    
    //TopLabel
    lazy var headerLabel : UILabel = {
        let header = UILabel()
        header.text = Constant().Title
        header.textAlignment = .center
        header.font = UIFont.boldSystemFont(ofSize: 18)
        header.textColor = .systemBlue
        return header
    }()
    
    //TableView
    lazy var expandableTblView : UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.allowsSelection = true
        table.bounces = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandableTblView.delegate = self
        expandableTblView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configuringViews()
    }
    
    //Local Variables
    var tableData = [TableDataModel]()
    var selectedHeader = Int()
    var selectedRow = Int()
    
    //Configure the Views
    func configuringViews(){
        
        //Adding values
        tableData.append(TableDataModel(topic: "Section 0", subOptions: ["One","Two","Three"], isExpanded: false))
        tableData.append(TableDataModel(topic: "Section 1", subOptions: ["Eleven","Twelve"], isExpanded: false))
        tableData.append(TableDataModel(topic: "Section 2", subOptions: ["TwentyOne","TwentyTwo","TwentyThree"], isExpanded: false))
        print(tableData)
        
        //Setting Constraints to headerView
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints { (view) in
            view.leading.equalTo(self.view.snp.leading).offset(10)
            view.trailing.equalTo(self.view.snp.trailing).offset(-10)
            view.top.equalTo(self.view.snp.top).offset(20)
            view.height.equalTo(80)
        }
        
        //Setting Constraints to headerLabel
        self.headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { (label) in
            label.centerY.equalTo(self.headerView.snp.centerY)
            label.centerX.equalTo(self.view.snp.centerX)
        }
        
        //Setting Constraints to tableView
        self.view.addSubview(expandableTblView)
        expandableTblView.snp.makeConstraints { (table) in
            table.top.equalTo(self.headerView.snp.bottom).offset(20)
            table.leading.equalTo(self.view.snp.leading)
            table.trailing.equalTo(self.view.snp.trailing)
            table.bottom.equalTo(self.view.snp.bottom)
        }
        
        //Registering xib Cells
        self.expandableTblView.register(UINib.init(nibName: Constant().HeaderTableViewCell, bundle: nil), forCellReuseIdentifier: Constant().HeaderTableViewCell)
        self.expandableTblView.register(UINib.init(nibName: Constant().ContentTableViewCell, bundle: nil), forCellReuseIdentifier: Constant().ContentTableViewCell)
    }
}

//MARK: UITableView dataSource and delegate
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    //UITableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData[section].isExpanded == false {
            return 0
        }else{
            return tableData[section].subOptions.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: Constant().HeaderTableViewCell) as! HeaderTableViewCell
        header.headerDescription.text =  tableData[section].topic
        if self.tableData[section].isExpanded == false{
            header.dropDown.image = UIImage(systemName: "chevron.down")
        }else{
            header.dropDown.image = UIImage(systemName: "chevron.up")
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addButtonTapAction(_:)))
        header.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        header.tag = section
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant().ContentTableViewCell, for: indexPath) as! ContentTableViewCell
        cell.contentDescriptionLabel.text = tableData[indexPath.section].subOptions[indexPath.row]
        return cell
    }
    
    //UITableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

//MARK: Local Methods
extension ViewController {
    //Objc Methods
    @objc func addButtonTapAction(_ gesture : UITapGestureRecognizer){
        if let viewTag = gesture.view?.tag {
            selectedHeader = viewTag
            if tableData[selectedHeader].isExpanded == false{
                tableData[selectedHeader].isExpanded = true
            }else{
                tableData[selectedHeader].isExpanded = false
            }
        }
        print("Data========>", tableData)
        print("SelectedHeader=====>",selectedHeader)
        expandableTblView.reloadData()
    }
}

