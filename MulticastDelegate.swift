//
//  MulticastDelegate.swift

import Foundation

class MulticastDelegate<T> {
    
    private class DelegateWrapper {
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    private var wrappers: [DelegateWrapper] = []
    private var delegates: [T]? {
        return wrappers.compactMap{ $0.delegate } as? [T]
    }
    
    func add(_ delegate: T) {
        let wrapper = DelegateWrapper(delegate as AnyObject)
        wrappers.append(wrapper)
    }
    
    func remove(_ delegate: T) {
        guard let index = wrappers.firstIndex(where: {
            $0.delegate === (delegate as AnyObject)
        }) else { return }
        wrappers.remove(at: index)
    }
    
    func invoke(_ handler: (T) -> ()) {
        delegates?.forEach { handler($0) }
    }
    
}
