//
//  LGTextView.swift
//  LGTextView
//
//  Created by Linus Geffarth on 07.10.18.
//

import UIKit

@IBDesignable
class LGTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private var wasSetup: Bool = false
    
    private func setup() {
        guard !wasSetup else { return }
        
        NotificationCenter.default.addObserver(self, selector: #selector(togglePlaceholder), name: UITextView.textDidChangeNotification, object: nil)
        
        wasSetup = true
    }
    
    override var text: String! {
        didSet { togglePlaceholder() }
    }
    
    override var font: UIFont? {
        didSet {
            placeholderLabel.font = self.font
        }
    }
    
    lazy internal var placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    @IBInspectable public var placeholder: String? {
        didSet { setup(); togglePlaceholder() }
    }
    
    private func showLabel() {
        placeholderLabel.text = placeholder
        placeholderLabel.font = self.font
        
        placeholderLabel.frame.origin = CGPoint(x: 5, y: textContainerInset.top)
        placeholderLabel.frame.size.width = self.frame.width - textContainerInset.left - textContainerInset.right
        placeholderLabel.frame.size.height = self.frame.height - textContainerInset.top - textContainerInset.bottom
        placeholderLabel.sizeToFit()
        
        // show label only if placeholder is not nil
        // but the method was called anyway
        placeholderLabel.isHidden = placeholder == nil
        self.addSubview(placeholderLabel)
        self.bringSubviewToFront(placeholderLabel)
    }
    
    private func hideLabel() {
        placeholderLabel.isHidden = true
        placeholderLabel.removeFromSuperview()
    }
    
    @objc private func togglePlaceholder() {
        (placeholder != nil && text.isEmpty) ? showLabel() : hideLabel()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
