//
//  OnDemandResources.swift
//  OnDemand resources
//
//  Created by Thiago on 26/09/21.
//

import Foundation

class ODRManager {
    
    var currentRequest: NSBundleResourceRequest?
    
    func makeRequest(tag: String, onSuccess: @escaping () -> Void, onFailure: @escaping (NSError) -> Void) {
        
        currentRequest = NSBundleResourceRequest(tags: [tag])
        
        guard let request = currentRequest else { return }
        
        request.endAccessingResources()
        
        request.loadingPriority =
        NSBundleResourceRequestLoadingPriorityUrgent
//
//        request.addObserver(self as! NSObject, forKeyPath: "fractionCompleted", options: .new, context: nil)
        
        request.beginAccessingResources { (error: Error?) in
            if let error = error {
                onFailure(error as NSError)
                return
            }
            
            onSuccess()
//            request.removeObserver(self as! NSObject, forKeyPath: "fractionCompleted")
        }
    }
}
