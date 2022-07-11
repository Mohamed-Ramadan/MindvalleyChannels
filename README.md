# MindvalleyChannels

## Application Preview
- Fetch channels, new episodes, categories
- Set background color for media image.
- Cache All loaded data
- Cache images to Application Directory


## Applied Development 
- MVVM Design Patter
- Clean Architecture Design (Uncle Bob) 
- Repository Design Pattern
- Xibs with AutoLayout
- Solid Principles
- Data Binding
- Image Caching using Document Directory ( Native )
- Cache Channels, New Episodes, Categories Using Core Data
- Unit Test
- Native Network Service Using URLSession ( Native )
- Swift

## How to run this project:
 * 1- clone the repository
 * 2- go to project directory
 * 3- open .xcodeproj file using XCode 


## - What parts of the test did you find challenging and why?
    * Every part of the test was challenging, starting from establishing the project architecture with clean code, creating the 'Data layer' that responsible for fetching remote data and storing this data to local storage using 'Core Data', then applying the 'Repository Pattern' to be responsible for providing the data to the 'Domain layer'
    * the Design was exciting and challenging also, I used to draw the similar design using the traditional collection view component, but I decided to do this test with a new way by applying the 'Compositional layout' with 'Diffable Data Source', It was challenging the first time I used it to draw the new episodes section, but the rest of work went as a piece of cake.
    
## - What feature would you like to add in the future to improve the project?
    * I have many things to add to this project but due to the lake of time and being so busy this days I didn't have the time to apply them but I'll do if i have a free time later, ex:
        - Add more animation to channels screen and scroll effect to the horizontal part
        - Add show more list item to all horizontal lists to show all section items not only the fist 6 items
        - Add Media Details screen so when clicking any media item it shows more info about it.
        - Add more test coverage
        - maybe enhance the presentation layer so it can be more easier to maintain and test 
