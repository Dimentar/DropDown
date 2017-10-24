//
//  DropDownCellTableViewCell.swift
//  DropDown
//
//  Created by Kevin Hirsch on 28/07/15.
//  Copyright (c) 2015 Kevin Hirsch. All rights reserved.
//

import UIKit

open class DropDownCell: UITableViewCell {

    // UI
    @IBOutlet open weak var optionLabel: UILabel!

    var selectedBackgroundColor: UIColor?
}

// MARK: - UI

extension DropDownCell {

    open override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
    }

    open override var isSelected: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }

    open override var isHighlighted: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }

    open override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        setSelected(highlighted, animated: animated)
    }

    open override func setSelected(_ selected: Bool, animated: Bool) {
        let executeSelection: () -> Void = { [unowned self] in
            if let selectedBackgroundColor = self.selectedBackgroundColor {
                if selected {
                    self.backgroundColor = selectedBackgroundColor
                } else {
                    self.backgroundColor = .clear
                }
            }
        }

        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                executeSelection()
            })
        } else {
            executeSelection()
        }
    }
}
