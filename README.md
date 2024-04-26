# Rahber App
## Expand Your Skills, Explore New Paths
Welcome to Rahber, a comprehensive learning platform dedicated to empowering you to achieve personal and professional growth. Explore courses in categories, from programming and web development to personal development and art.

## Getting Started
### Environment Dependencies
- Xcode 15+
- iOS 17+
- SwiftUI
- Swift Package Manager(SPM) Dependencies
	- [Relam](https://github.com/realm/realm-swift)
	- [Nuke](https://github.com/kean/Nuke)
	- [SwiftInj](https://github.com/Swinject/Swinject)
	- [Swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing)

  
### Project Setup
1. Clone the repository.
2. Finally, navigate to the root folder run Xcode
<br><br>

## Important Note on Unit test

**Please Note:** To execute unit tests, ensure that you run them twice to ensure all tests are accurately executed. I've employed the snapshot testing framework. We should only automatically record if no screenshot exists for this test. When running unit tests for the first time, ensure that you run them twice to generate the appropriate screens for UI testing.  **Test coverage: 82%** 


## How to use app
Launch the app to discover a diverse array of courses across multiple disciplines. Each course offers detailed information to help you make informed decisions about your learning journey. Simply tap on any course to learn more about its content, instructor, and duration, and enrol with just one click. Once enrolled, your course feed will automatically prioritise and sort courses based on the categories you're actively exploring, enhancing your personalised learning experience. Additionally, the app features a user profile screen where you can view your personal details and a list of all the courses you've enrolled in, keeping your educational goals organised and accessible.

### App Video
![Alt text](README_FILES/App.gif?raw=true "Ping Master")

## Project Structure
iOS Project implemented with Clean Layered Architecture and MVVM-Coordinator pattern. 

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network)
* **Presentation Layer (MVVM)** = ViewModels + Views

### Dependency Direction
![Alt text](README_FILES/CleanArchitectureDependencies.png?raw=true "Modules Dependencies")



* **Rahber App**(iOS Project): This folder contains the resources, source files and all other miscellaneous files to build the iOS project. This folder is further branched into:
	 The app is completely written in SwiftUI/Combine.
	 
	 
### Folder Structure

```markdown
📦RahberApp
┣ 📂Application
┃ ┗ 📂DependencyInjection
┣ 📂Data
┃ ┣ 📂Mapper
┃ ┣ 📂Network
┃ ┣ 📂Persistence
┃ ┗ 📂Repositories
┣ 📂Domain
┃ ┣ 📂Interfaces
┃ ┣ 📂Entities
┃ ┗ 📂UseCase
┣ 📂Presentation
┃ ┣ 📂ReusableViews
┃ ┣ 📂AppCoordinator
┃ ┣ 📂Screens
┃ ┃ ┣ 📂Home
┃ ┃ ┃ ┣ 📂Coordinator
┃ ┃ ┃ ┣ 📂ViewModels
┃ ┃ ┃ ┗ 📂Views
┗ 📜RahberApp.swift => The app entry point.

```

## Includes
* Course list screen
* Course Detail Screen
* Profile Detail Screen

## Strings
*  Strings are added into catalog


## What needs to be improved ##
### Required
1. Add UI test.

### Tools have the capacity to be incorporated.
 1. - [Arkana](https://github.com/rogerluan/arkana) is used to handle/manage/store project keys secretely.
Arkana requires the declaration of a YAML config file, named e.g. `.arkana.yml` that lists the keys (names) and an `.env` (e.g. `.env.arkana`) file that stores the values for the keys stored in the YAML file. Since the `.env.arkana` file contains the actual values of the secrets, it should be stored locally and never be checked-in to the repository (It has already been added to `.gitignore`).
2. - [SwiftGen](https://github.com/SwiftGen/SwiftGen) is a tool allowing to parse the app's various assets (including but not limited to xibs, storyboards, fonts, assets library, strings file, etc). This app is built to use SwiftGen to generate 3 kinds of compile-time constants related to:
3. - [SwiftLint](https://github.com/realm/SwiftLint/) is a tool that parses `swift` files, and output warnings when a code-smell is identified. Sometimes, SwiftLint outputs warnings for desired code, and in these cases the warnings may be disabled in code.  
