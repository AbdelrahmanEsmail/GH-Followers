# GitHub Followers App

![image](https://github.com/user-attachments/assets/4f5a148e-499b-4ff5-94e9-460e54f6219f)


This project is a GitHub Follower app built for iOS using Swift and UIKit. It was developed by following [Sean Allen's](https://www.youtube.com/@seanallen) YouTube tutorial on building an iOS app from scratch. The app allows users to search for GitHub users and view a list of their followers, complete with avatar images and user information.

## Features

- Search for GitHub users
- View and paginate through a list of followers
- Download and cache avatar images for offline use
- Display user info with a custom UI
- Persistent storage for saving favorite users
- Smooth navigation with `TabBar` and `NavBar`
- Programmatic UI using UIKit (no storyboards)
- Error handling and network calls with URLSession
- Memory management using ARC and capture lists

## Key Concepts

- **UIKit Programmatic UI**: The entire UI is built programmatically using UIKit, ensuring flexibility and control over the layout.
- **Networking**: Fetches data from GitHub's API to retrieve followers and user information using `URLSession`.
- **Pagination**: Loads followers in batches of 100 to ensure performance and avoid overloading the API.
- **Persistence**: Favorites are saved using `UserDefaults` for quick access even after the app is closed.
- **Custom Views**: Custom `UIButton`, `UITextField`, `UICollectionView`, and other UI components are used throughout the app.
- **Error Handling**: Displays custom alerts when network issues or data errors occur.
- **Image Caching**: Downloads and caches images to reduce data usage and improve performance.

## Technologies Used

- **Swift**: The app is written entirely in Swift.
- **UIKit**: Used for building the UI programmatically.
- **URLSession**: For making network calls to GitHub's API.
- **UserDefaults**: To persist favorite followers locally.

## Getting Started

### Prerequisites

- Xcode 15 or later
- iOS 17 or later
- GitHub API token

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/AbdelrahmanEsmail/GH-Followers
