//
//  Colors.swift
//  ColorsTask
//
//  Created by Foothill on 31/08/2023.
//


import UIKit

struct ColorModel: Codable {
    let colorName: String
    let name: String
    let description: String
    let id: String
    
    
}

class ColorsStruct {
    
    static let allColors: [ColorModel] = [
        ColorModel(colorName: "Red", name: "Red", description: "The color Red belongs to the color family of warm hues. It is of high brightness and saturation. The color red corresponds to the hex code #FF0000 in the additive color space RGB (red, green, blue). Specifically, it corresponds to 100% red, 0% green, and 0% blue.", id: "Red"),
    
        ColorModel(colorName: "Green", name: "Green", description: "The color Green belongs to the color family of cool hues. It is of medium brightness and high saturation. The color green corresponds to the hex code #00FF00 in the additive color space RGB (red, green, blue). More precisely, it corresponds to 0% red, 100% green, and 0% blue.", id: "Green"),
        
        ColorModel(colorName: "Blue", name: "Blue", description: "The color Blue belongs to the color family of cool hues. It is of medium brightness and high saturation. The color blue corresponds to the hex code #0000FF in the additive color space RGB (red, green, blue). To be specific, it corresponds to 0% red, 0% green, and 100% blue", id: "Blue"),
    
        ColorModel(colorName: "Purple", name: "Purple", description: "The color Purple belongs to the color family of cool hues. It is a medium-dark color with a high level of saturation. Purple corresponds to the hex code #800080 in the additive color space RGB (red, green, blue). Specifically, it consists of 50% red, 0% green, and 50% blue.", id: "Purple"),
    
        ColorModel(colorName: "Yellow", name: "Yellow", description: "The color Yellow belongs to the color family of warm hues. It is a bright and vibrant color with high brightness and saturation. Yellow corresponds to the hex code #FFFF00 in the additive color space RGB (red, green, blue). Specifically, it consists of 100% red, 100% green, and 0% blue.", id: "Yellow"),
        
        ColorModel(colorName: "Orange", name: "Orange", description: "The color Orange is a warm and energetic hue. It exhibits medium to high brightness and saturation. In the RGB color space, Orange corresponds to the hex code #FFA500, which translates to approximately 100% red, 65% green, and 0% blue.", id:"Orange"),
        
        ColorModel(colorName: "Pink", name: "Pink", description: "The color Pink is a light and delicate hue that falls into the cool color family. It has low to medium brightness and high saturation. Pink is represented by the hex code #FFC0CB in the RGB color space, which equates to roughly 100% red, 75% green, and 80% blue.", id: "Pink"),
        
        ColorModel(colorName: "Cyan", name: "Cyan", description: "The color Cyan is a cool and refreshing hue with medium to high brightness and saturation. Its hex code in the RGB color space is #00FFFF, corresponding to 0% red, 100% green, and 100% blue.", id: "Cyan"),

        ColorModel(colorName: "Gold", name: "Gold", description: "The color Gold is a warm and luxurious hue with medium to high brightness and saturation. In the RGB color space, Gold is represented by the hex code #FFD700, which equates to approximately 100% red, 84% green, and 0% blue.", id: "Gold"),
    
        ColorModel(colorName: "Lavender", name: "Lavender", description: "The color Lavender belongs to the cool hues and is known for its light and soothing appearance. It exhibits low to medium brightness and high saturation. Lavender is represented by the hex code #E6E6FA in the RGB color space, consisting of approximately 90% red, 90% green, and 98% blue.", id: "Lavender"),
    
        ColorModel(colorName: "Brown", name: "Brown", description: "The color Brown belongs to the color family of warm hues. It is a medium-dark color with a moderate level of saturation. Brown corresponds to the hex code #A52A2A in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 65% red, 16% green, and 16% blue.", id: "Brown"),

        ColorModel(colorName: "Maroon", name: "Maroon", description: "The color Maroon belongs to the color family of warm hues. It is a dark and rich color with low to medium saturation. Maroon corresponds to the hex code #800000 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 50% red, 0% green, and 0% blue.", id: "Maroon"),
        
        ColorModel(colorName: "Teal", name: "Teal", description: "The color Teal belongs to the color family of cool hues. It is a medium-bright color with a moderate level of saturation. Teal corresponds to the hex code #008080 in the additive color space RGB (red, green, blue). Specifically, it consists of 0% red, 50% green, and 50% blue.", id: "Teal"),

        ColorModel(colorName: "Indigo", name: "Indigo", description: "The color Indigo belongs to the color family of cool hues. It is a medium-dark color with a high level of saturation. Indigo corresponds to the hex code #4B0082 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 29% red, 0% green, and 51% blue.", id: "Indigo"),
        
        ColorModel(colorName: "Magenta", name: "Magenta", description: "The color Magenta belongs to the cool color family. It is a vibrant and saturated hue with medium to high brightness. Magenta corresponds to the hex code #FF00FF in the additive color space RGB (red, green, blue). Specifically, it consists of 100% red, 0% green, and 100% blue.", id: "Magenta"),

        ColorModel(colorName: "Turquoise", name: "Turquoise", description: "The color Turquoise is a cool and refreshing hue with medium brightness and high saturation. It belongs to the cool color family. Turquoise corresponds to the hex code #40E0D0 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 25% red, 88% green, and 82% blue.", id: "Turquoise"),

        
        ColorModel(colorName: "Olive", name: "Olive", description: "The color Olive belongs to the warm color family. It is a medium-dark color with moderate saturation. Olive corresponds to the hex code #808000 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 50% red, 50% green, and 0% blue.", id: "Olive"),

        ColorModel(colorName: "Slate Gray", name: "Slate Gray", description: "The color Slate Gray belongs to the cool color family. It is a medium-dark color with moderate saturation. Slate Gray corresponds to the hex code #708090 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 44% red, 50% green, and 56% blue.", id: "Slate Gray"),

        ColorModel(colorName: "Coral", name: "Coral", description: "The color Coral is a warm and vibrant hue. It has medium to high brightness and saturation. Coral corresponds to the hex code #FF6F61 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 100% red, 44% green, and 38% blue.", id: "Coral"),
    
        ColorModel(colorName: "Baby Blue", name: "Baby Blue", description: "Baby Blue is a soft and soothing pastel color. It belongs to the cool color family. This pastel shade has low to medium brightness and saturation. Baby Blue corresponds to the hex code #89CFF0 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 53% red, 81% green, and 94% blue.", id: "Baby Blue"),

        ColorModel(colorName: "Peach", name: "Peach", description: "Peach is a gentle and warm pastel hue. It has low to medium brightness and saturation. Peach corresponds to the hex code #FFDAB9 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 100% red, 85% green, and 73% blue.", id: "Peach"),
        
        ColorModel(colorName: "Mint Green", name: "Mint Green", description: "Mint Green is a fresh and soothing pastel color. It belongs to the cool color family. This pastel shade has medium brightness and saturation. Mint Green corresponds to the hex code #98FB98 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 60% red, 98% green, and 60% blue.", id: "Mint Green"),

        ColorModel(colorName: "Lavender Blush", name: "Lavender Blush", description: "Lavender Blush is a delicate and light pastel hue. It belongs to the cool color family. This pastel shade has low to medium brightness and high saturation. Lavender Blush corresponds to the hex code #FFF0F5 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 100% red, 94% green, and 96% blue.", id: "Lavender Blush"),

        ColorModel(colorName: "Lemon Chiffon" , name: "Lemon Chiffon", description: "Lemon Chiffon is a soft and bright pastel color. It belongs to the warm color family. This pastel shade has medium to high brightness and saturation. Lemon Chiffon corresponds to the hex code #FFFACD in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 100% red, 98% green, and 80% blue.", id: "Lemon Chiffon"),
    
        ColorModel(colorName: "Sky Blue", name: "Sky Blue", description: "Sky Blue is a serene and light pastel hue. It belongs to the cool color family. This pastel shade has medium brightness and saturation. Sky Blue corresponds to the hex code #87CEEB in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 53% red, 81% green, and 92% blue.", id: "Sky Blue"),

        ColorModel(colorName: "Lavender Mist", name: "Lavender Mist", description: "Lavender Mist is a delicate and pale pastel color. It belongs to the cool color family. This pastel shade has low to medium brightness and low saturation. Lavender Mist corresponds to the hex code #E6E6E6 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 90% red, 90% green, and 90% blue.", id: "Lavender Mist"),

        ColorModel(colorName: "Pale Yellow", name: "Pale Yellow", description: "Pale Yellow is a soft and sunny pastel hue. It belongs to the warm color family. This pastel shade has medium brightness and saturation. Pale Yellow corresponds to the hex code #FFFF99 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 100% red, 100% green, and 60% blue.", id: "Pale Yellow"),

        ColorModel(colorName: "Seafoam Green", name: "Seafoam Green", description: "Seafoam Green is a calming and fresh pastel color. It belongs to the cool color family. This pastel shade has medium brightness and saturation. Seafoam Green corresponds to the hex code #98FB98 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 60% red, 98% green, and 60% blue.", id: "Seafoam Green"),
 
        ColorModel(colorName: "Powder Pink", name: "Powder Pink", description: "Powder Pink is a gentle and soothing pastel hue. It belongs to the cool color family. This pastel shade has low to medium brightness and moderate saturation. Powder Pink corresponds to the hex code #FFB6C1 in the additive color space RGB (red, green, blue). Specifically, it consists of approximately 100% red, 71% green, and 76% blue.", id: "Powder Pink")
        
   ] 
    
    

}
