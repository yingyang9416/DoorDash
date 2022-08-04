//
//  PickupViewController.swift
//  DoorDash
//
//  Created by Ying Yang on 7/30/22.
//

import UIKit
import MapKit
import CoreLocation

class PickupViewController: UIViewController {
    enum CardState {
        case expanded
        case collapsed
    }

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    var locationManager = CLLocationManager()
    var cardViewController: CardViewController!
    let cardCollapsedHeight: CGFloat = 300
    let cardExpandedHeight: CGFloat = 800
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted: CGFloat = 0
    
    var dummyFilters: [Filter] =
    [Filter(title: "Open now", normalBackgroundColor: .white, selectedBackgroundColor: .black, selected: false),
     Filter(title: "DashPass", normalImage: UIImage(named: "doorDash"), selectedImage: UIImage(named: "doorDash-white"), normalBackgroundColor: .white, selectedBackgroundColor: .black, selected: false),
     Filter(title: "Ratings", normalImage: UIImage(named: "star-black"), selectedImage: UIImage(named: "star-white"), normalBackgroundColor: .white, selectedBackgroundColor: .black, selected: false),
     Filter(title: "Pickup", normalBackgroundColor: .white, selectedBackgroundColor: .black, selected: false),
     Filter(title: "Price", normalBackgroundColor: .white, selectedBackgroundColor: .black, selected: false)]


    var currentCardState: CardState = .collapsed

    var nextState: CardState {
        return currentCardState == .expanded ? .collapsed : .expanded
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupSearchView()
        setupCard()
        setupFilterCollectionView()
        placePins()
    }
    
    func setupMapView() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.mapType = .standard
        if let currentLocation = locationManager.location {
            let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
            let region = MKCoordinateRegion(center: currentLocation.coordinate, span: span)
            mapView.setCenter(currentLocation.coordinate, animated: true)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func setupSearchView() {
        searchView.layer.cornerRadius = 25
        searchView.layer.shadowColor = UIColor.black.cgColor
        searchView.layer.shadowOpacity = 0.2
        searchView.layer.shadowOffset = .zero
        searchView.layer.shadowRadius = 3
    }
    
    func setupFilterCollectionView() {
        let nib = UINib(nibName: FilterCollectionViewCell.nibName, bundle: nil)
        filterCollectionView.register(nib, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifier)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.backgroundColor = .clear
    }
    
    func setupCard() {
        cardViewController = CardViewController()
        addChild(cardViewController)
        view.addSubview(cardViewController.view)
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardCollapsedHeight, width: self.view.bounds.width, height: cardExpandedHeight)
        cardViewController.view.clipsToBounds = true
        cardViewController.view.layer.cornerRadius = 12
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(recognizer:)))

        cardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)

    }
    
    func placePins() {
        for i in coords.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coords[i]
            annotation.title = titles[i]
            mapView.addAnnotation(annotation)
        }
    }
    
    @objc func handleCardTap(recognzier: UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(toState: nextState, duration: 0.9)
        default:
            break
        }
    }

    @objc func handleCardPan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(toState: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.cardViewController.handleArea)
            var fractionComplete = translation.y / (cardExpandedHeight - cardCollapsedHeight)
            fractionComplete  = currentCardState == .expanded ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
    }

    func animateTransitionIfNeeded (toState: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch toState {
                case .expanded:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardExpandedHeight
                case .collapsed:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardCollapsedHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.currentCardState = toState
                self.runningAnimations.removeAll()
            }
                        
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }
    
    func startInteractiveTransition(toState: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(toState: toState, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }

    func updateInteractiveTransition(fractionCompleted: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }

}

extension PickupViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }

}

extension PickupViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        annotationView.markerTintColor = .white
        annotationView.glyphImage = UIImage(named: "restaurant")
        annotationView.glyphTintColor = .ddRed
//        annotationView
        return annotationView
    }
}

extension PickupViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyFilters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifier, for: indexPath) as? FilterCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = dummyFilters[indexPath.item]
        cell.configureCell(filter: data, shadowed: true)
        return cell
    }
    
}

extension PickupViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = Bundle.main.loadNibNamed(FilterCollectionViewCell.nibName, owner: self)?.first as? FilterCollectionViewCell else {
            return CGSize.zero
        }
        let data = dummyFilters[indexPath.item]
        cell.configureCell(filter: data, shadowed: true)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dummyFilters[indexPath.item].selected = !dummyFilters[indexPath.item].selected
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
