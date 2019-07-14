import UIKit

typealias Filter = (CIImage) -> CIImage?

enum FilterType {
    
    case guassianBlur(_ image: CIImage, radius: Double)
    case colorGenerator(_ color: CIColor)
    case compositeSourceOver(_ overlay: CIImage, image: CIImage)
    
    var filter: CIFilter? {
        
        switch self {
        case .guassianBlur(let image, let radius):
            let parameters: [String : Any] = [
                kCIInputRadiusKey: radius,
                kCIInputRadiusKey: image
            ]
            return CIFilter(name: "CIGaussianBlur", parameters: parameters)
            
        case .colorGenerator(let color):
            let parametes: [String : Any] = [
                kCIInputColorKey: color
            ]
            return CIFilter(name: "CIConstantColorGenerator", parameters: parametes)
            
        case .compositeSourceOver(let overlay, image: let image):
            let parameters: [String: Any] = [
                kCIInputBackgroundImageKey : image,
                kCIInputImageKey : overlay
            ]
            return CIFilter(name: "CISourceOverCompositing", parameters: parameters)
        }
    }
}
