//
//  WeatherTableViewCell.swift
//  WeatherAppTest
//
//  Created by mac on 21/02/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherStatusImageView: UIImageView!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var weatherDateTimeLabel: UILabel!
    @IBOutlet weak var weatherMinLabel: UILabel!
    @IBOutlet weak var weatherMaxLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setWeatherDetail(_ foreCastData: ForecastdaytModel?) {
        self.weatherMaxLabel.text = "Max: " + "\(foreCastData?.day?.maxtemp_c ?? 0.0)"
        self.weatherMinLabel.text = "Min: " + "\(foreCastData?.day?.mintemp_c ?? 0.0)"
        self.weatherDateTimeLabel.text = "Date: " + (foreCastData?.date ?? "")
        self.weatherStatusLabel.text = foreCastData?.day?.condition?.text
        
        let url = URL(string: foreCastData?.day?.condition?.icon ?? "")!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.weatherStatusImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
