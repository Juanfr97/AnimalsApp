# AnimalsApp

This project is a SwiftUI app that displays a list of animals and their details. The app uses the MVVM architecture and the Combine framework. Core Data is used to persist the data. MapKit is used to display the location of the animals.

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* Xcode 11.4 or later
* iOS 13.4 or later

### Installation

1. Clone the repo
```sh
git clone https://github.com/Juanfr97/AnimalsApp
```

2. Open the project in Xcode
```sh
open AnimalsApp.xcodeproj
```

3. Build and run the project

## Usage

The app displays a list of animals and their details. The user can add new animals and edit or delete existing ones. Map view is used to display the location of the animals. The user must add a location to the animal in order to display it on the map with latitude and longitude.

## Entities

### Animal

| Property | Type | Description |
| --- | --- | --- |
| id | UUID | Unique identifier |
| name | String | Name of the animal |
| headline | String | Headline of the animal |
| description | String | Description of the animal |
| latitude | Double | Latitude of the animal's location |
| longitude | Double | Longitude of the animal's location |
| image | String | Image of the animal |

### Gallery

| Property | Type | Description |
| --- | --- | --- |
| id | UUID | Unique identifier |
| image | String | Animal image |
| animal | Animal | Animal that the image belongs to |

### Facts

| Property | Type | Description |
| --- | --- | --- |
| id | UUID | Unique identifier |
| fact | String | Fact about the animal |
| animal | Animal | Animal that the fact belongs to |

## Screenshots

| ![HomeScreen](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.47.35.png>) | ![Add new animal](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.54.10.png>) |
|:---:|:---:|
| ![Animal list](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.54.51.png>) | ![Animal detail](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.55.02.png>) |
| ![Animal location](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.55.13.png>) | ![Alt text](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 18.00.37.png>)|
