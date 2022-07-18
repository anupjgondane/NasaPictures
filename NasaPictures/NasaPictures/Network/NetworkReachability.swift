//
//  NetworkReachability.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation
import Reachability

/** Detect network connection */
class NetworkReachability {
    static let shared = NetworkReachability()
    private init() {}
    private var networkReachable = true
    lazy var reachability: Reachability? = {
        return try? Reachability()
    }()
}

extension NetworkReachability {
    /** start monitoring network connection */
    func start() {
        reachability?.whenReachable = { [weak self] reachability in
            self?.networkReachable = true
        }
        reachability?.whenUnreachable = { [weak self] _ in
            self?.networkReachable = false
            print("Not reachable")
        }
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    func stop() {
        self.reachability?.stopNotifier()
    }
    
    func isNetworkReachable() -> Bool {
        return self.networkReachable
    }
}
