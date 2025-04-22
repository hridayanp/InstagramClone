# 📱 iOS Instagram Clone App

A starter Instagram-like iOS UI app built using **SwiftUI** and **Firebase**. This app allows users to sign up, log in, upload images, view a post feed, edit their profile, and search for other users.

---

## 🔧 Features

### 🔐 Authentication (Login / Sign Up)
- Users can create an account using their email and password.
- Login screen allows existing users to securely log in.
- Firebase Authentication handles all account management and security.
- Persisted login sessions with auto sign-in on app launch.

### 🖼️ Image Uploading / Downloading
- Users can upload profile pictures and posts directly from their device.
- Images are compressed before upload to optimize storage.
- Firebase Storage handles storing and serving uploaded images.
- Real-time download of images for profiles and posts.

### 📰 Post Feed
- Users can upload image-based posts with captions.
- All posts are shown in a vertically scrolling feed.
- Posts display the user’s profile image, username, image, and caption.
- Feed updates in real time using Firestore's snapshot listeners.

### 👤 User Profile
- Each user has a personal profile page.
- Displays user information: profile image, username, and post grid.
- Users can view all their uploaded posts in a grid layout.

### 🔍 User Search
- Real-time search bar to find other users by username.
- Search results show profile image and username.
- Tapping a result navigates to the selected user’s profile.

### ✏️ Edit Profile
- Users can update their profile image and username.
- Changes are saved instantly to Firestore and Firebase Storage.
- Live preview of new profile image before uploading.

---

## 🧰 Firebase Backend

The app uses Firebase as its full backend solution:

- **Firebase Authentication** for user sign-up and sign-in.
- **Firebase Firestore** for storing user data, posts, and following relationships.

---

## ✅ Future Improvements

- Add Firebase Storage to retain images.
- Add likes and comments to posts.
- Implement following/followers system.
- Add push notifications for new followers or interactions.
- Support stories, reels, and messaging features.

---

## 📦 Dependencies

- SwiftUI
- Firebase SDKs (Auth, Firestore, Storage)
- Combine for reactive UI updates

---

## 🏁 Getting Started

1. Clone the repository.
2. Set up Firebase and download `GoogleService-Info.plist`.
3. Install dependencies via Swift Package Manager.
4. Run the app in Xcode on an iOS simulator or real device.
