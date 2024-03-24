//
//  UIControl+Ext..swift
//  TechHunt
//
//  Created by Anna Sumire on 24.03.24.
//

import UIKit

extension UIControl {
    func addTarget(for controlEvents: UIControl.Event = .touchUpInside, action: @escaping () -> Void) {
        let wrapper = EventWrapper(handler: action)
        addTarget(wrapper, action: #selector(EventWrapper.invoke), for: controlEvents)
        objc_setAssociatedObject(self, UUID().uuidString, wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

class EventWrapper: NSObject {
    let handler: () -> Void

    init(handler: @escaping () -> Void) {
        self.handler = handler
    }

    @objc func invoke() {
        handler()
    }
}
