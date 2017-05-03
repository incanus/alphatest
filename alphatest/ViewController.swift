import UIKit
import Mapbox

class ViewController: UIViewController, MGLMapViewDelegate {

    var map: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        map = MGLMapView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 2 * view.bounds.size.height / 3), styleURL: MGLStyle.lightStyleURL(withVersion: MGLStyleDefaultVersion))
        map.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(map)
        
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        slider.center = CGPoint(x: view.bounds.size.width / 2, y: 40)
        slider.value = 1
        view.addSubview(slider)
        
        
        map.delegate = self
        let point = MGLPointAnnotation()
        point.coordinate = map.centerCoordinate
        map.addAnnotation(point)
        
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
    }
    
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        let annotView = MGLAnnotationView(reuseIdentifier: "view")
        annotView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        annotView.backgroundColor = .blue
        return annotView
    }
    
    func sliderChanged(_ slider: UISlider) {
        map.alpha = CGFloat(slider.value)
    }

}
