//
//  AppConstant.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** Strings used in app */
struct AppConstant {
    static let homeTabBarTitle = "Home"
    static let favouriteTabBarTitle = "Favourites"
    static let homeViewEmptyStateTitle = "Unable to get picture!"
    static let favouriteEmptyStateTitle = "Pictures are not available. Add any to favourite"
    static let responseDateFormat = "yyyy-MM-dd"
    static let displayDateFormat = "dd MMM yyyy"
    static let loading = "Loading..."
    static let astronomyPicOfTheDay = "Astronomy Pic Of "
    static let ok = "Ok"
    static let cancel = "Cancel"
    static let invalidUrl = "Invalid request!"
    static let invalidResponse = "Something went wrong!"
    static let favourites = "Favourites"
    static let removeFavourite = "Remove from favourite?"
    static let internetNotAvailable = "Internet not available, please try again later."
}

/** System image names used in app */
struct ImageConstant {
    static let house = "house"
    static let favourite = "heart"
    static let heart = "heart"
    static let heartFill = "heart.fill"
    static let photo = "photo"
    static let calendar = "calendar"
}
