//
//  Copyright © 2014 Yalantis
//  Licensed under the MIT license: http://opensource.org/licenses/MIT
//  Latest version can be found at http://github.com/yalantis/Side-Menu.iOS
//

import UIKit


import Foundation

enum ContentType: String {
    case Music = "content_music"
    case Films = "content_films"
}

prefix func ! (value: ContentType) -> ContentType {
    switch value {
    case .Music:
        return .Films
    case .Films:
        return .Music
    }
}


class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
