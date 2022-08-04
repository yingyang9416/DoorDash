//
//  Data.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import Foundation
import CoreLocation
import UIKit

let coords = [CLLocationCoordinate2D(latitude: 32.895406, longitude: -79.818744),
              CLLocationCoordinate2D(latitude: 32.894386, longitude: -79.813345),
              CLLocationCoordinate2D(latitude: 32.896464, longitude: -79.816784),
              CLLocationCoordinate2D(latitude: 32.896697, longitude: -79.818897),
              CLLocationCoordinate2D(latitude: 37.781221, longitude: -122.406573),
              CLLocationCoordinate2D(latitude: 37.781653, longitude: -122.400586),
              CLLocationCoordinate2D(latitude: 37.782222, longitude: -122.403333),
              CLLocationCoordinate2D(latitude: 37.787462, longitude: -122.409475),
              CLLocationCoordinate2D(latitude: 37.785659, longitude: -122.409848),
              CLLocationCoordinate2D(latitude: 37.787563, longitude: -122.400111),
              CLLocationCoordinate2D(latitude: 37.781111, longitude: -122.401111),
              CLLocationCoordinate2D(latitude: 37.784423, longitude: -122.409677)]
let titles = ["Rivertowne Pizza & Deli",
              "Blue's Local Grill",
              "Chipotle",
              "Fuji Sushi",
              "Serafina",
              "Burger King",
              "Wendy's",
              "Chipotle",
              "Fishmandu Sushi",
              "Hotpot King",
              "Sotto Mare",
              "Original Joe's"]
let icons = [UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "cafe"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant"),
             UIImage(named: "restaurant")]

let homeData: [(title: String, restaurants: [Restaurant])] =
[("Fastest Near You", [tacoBell, wendys, subway, mcDonalds]),
 ("National Favorites", [buffaloWings, wingstop, appsAllAround, tgiFridays]),
 ("Try Something New", [sevenEleven, mcDonalds, tgiFridays, tacoBell])]

let tacoBell = Restaurant(name: "Taco Bell", distance: 2.7, eta: 24, deliveryFee: 3.99, ratings: 4.4, numberOfRatings: 840, image: UIImage(named: "tacoBell")!)
let sevenEleven = Restaurant(name: "7-Eleven", distance: 2.6, eta: 23, deliveryFee: 3.99, ratings: 4.6, numberOfRatings: 230, image: UIImage(named: "sevenEleven")!)
let tgiFridays = Restaurant(name: "TGI Fridays", distance: 4.7, eta: 37, deliveryFee: 3.99, ratings: 4.4, numberOfRatings: 720, image: UIImage(named: "tgiFridays")!)
let appsAllAround = Restaurant(name: "Apps All Around", distance: 4.7, eta: 38, deliveryFee: 6.99, ratings: 4.5, numberOfRatings: 181, image: UIImage(named: "appsAllAround")!)
let wendys = Restaurant(name: "Wendy's", distance: 4.7, eta: 32, deliveryFee: 4.99, ratings: 4.4, numberOfRatings: 1900, image: UIImage(named: "wendys")!)
let mcDonalds = Restaurant(name: "McDonald's", distance: 1.1, eta: 15, deliveryFee: 3.99, ratings: 4.3, numberOfRatings: 10300, image: UIImage(named: "mcdonalds")!)
let wingstop = Restaurant(name: "Wingstop", distance: 4.7, eta: 50, deliveryFee: 5.99, ratings: 4.2, numberOfRatings: 8400, image: UIImage(named: "wingStop")!)
let buffaloWings = Restaurant(name: "Buffalo Wild Wings", distance: 1.4, eta: 35, deliveryFee: 3.99, ratings: 4.2, numberOfRatings: 16300, image: UIImage(named: "buffaloWings")!)
let subway = Restaurant(name: "Subway", distance: 0.8, eta: 18, deliveryFee: 2.99, ratings: 4.1, numberOfRatings: 1900, image: UIImage(named: "subway")!)
