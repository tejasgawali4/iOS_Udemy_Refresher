import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManger, weather : WeatherModel)
    func didFailWithError(error : Error)
}

struct WeatherManger {
    
    //&units=metric   -- tempreature in celsius
    let apiURL="https://samples.openweathermap.org/data/2.5/weather?appid=439d4b804bc8187953eb36d2a8c26a02"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName : String) {
        let urlString = "\(apiURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func fetchWeatherByLocation(lat: CLLocationDegrees, long: CLLocationDegrees){
        let urlString = "\(apiURL)&lat=\(lat)&lon=\(long)"
        performRequest(urlString: urlString) 
        print(urlString)
    }
    
    
    func performRequest(urlString: String){
        
        print(urlString)
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            //used closures
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        print(weather)
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeddata = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeddata.weather[0].id
            let temp = decodeddata.main.temp
            let name = decodeddata.name
                            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
}
