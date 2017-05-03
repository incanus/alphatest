import UIKit
import Mapbox

class ViewController: UIViewController {

    var map: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.purple

        map = MGLMapView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 2 * view.bounds.size.height / 3), styleURL: MGLStyle.lightStyleURL(withVersion: MGLStyleDefaultVersion))
        map.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(map)

        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        slider.center = CGPoint(x: view.bounds.size.width / 2, y: 40)
        slider.value = 1
        view.addSubview(slider)

        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
    }

    func sliderChanged(_ slider: UISlider) {
        map.alpha = CGFloat(slider.value)
    }

}
