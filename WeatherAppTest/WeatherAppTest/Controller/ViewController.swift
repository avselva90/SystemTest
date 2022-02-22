//
//  ViewController.swift
//  WeatherAppTest
//
//  Created by mac on 21/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var locationView: UIView!

    var weatherDetail: WetherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.locationView.layer.cornerRadius = 5
        self.tableView.register(UINib.init(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")

        self.fetchData()
    }
    
    func fetchData() {
        Service.shared.fetchWeatherDetail {[weak self] (weatherlist, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self?.weatherDetail = weatherlist
            if let _ = self?.weatherDetail{
                print(self?.weatherDetail as Any)
                self?.countryLabel.text = self?.weatherDetail?.location?.country
                self?.cityLabel.text = self?.weatherDetail?.location?.name
                self?.dateTimeLabel.text = self?.weatherDetail?.location?.localtime
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherDetail?.forecast?.forecastday?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        let weatherOfDay = self.weatherDetail?.forecast?.forecastday?[indexPath.row]
        cell.setWeatherDetail(weatherOfDay)
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}


//func setupView() {
//
//    let section1View = UIView()
//    section1View.backgroundColor = .lightGray
//    self.view.addSubview(section1View)
//
//    section1View.translatesAutoresizingMaskIntoConstraints = false
//    section1View.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//    section1View.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//    section1View.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
//    section1View.heightAnchor.constraint(equalToConstant: 400).isActive = true
//
//    let titleLabel = UILabel()
//    titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
//    titleLabel.textAlignment = .center
//    titleLabel.text = "Weather"
//    section1View.addSubview(titleLabel)
//
//    titleLabel.translatesAutoresizingMaskIntoConstraints = false
//    titleLabel.leadingAnchor.constraint(equalTo: section1View.le).isActive = true
//    titleLabel.topAnchor.constraint(equalTo: section1View.topAnchor).isActive = true
//    titleLabel.widthAnchor.constraint(equalTo: section1View.widthAnchor, multiplier: 0.3).isActive = true
//    titleLabel.heightAnchor.constraint(equalTo: section1View.heightAnchor, multiplier: 0.4).isActive = true
//}
//
