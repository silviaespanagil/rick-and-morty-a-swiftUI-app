# iOS App: Rick and Morty
## _“I’m a scientist; because I invent, transform, create, and destroy for a living, and when I don’t like something about the world, I change it.” — Pickle Rick_

¡Hola mundo!

New day new projects this time I wanted to work with the Rick and Morty API, as I already have [worked with it before](https://github.com/silviaespanagil/rick-and-morty-directory) but for a webApp. Now it was time to work with it for an iOS App. This is the [Rick and Morty API](https://rickandmortyapi.com/). If you have never used it, the API gives you information about Characters, Locations and Episodes of the Rick and Morty show 📺

The app has six main views with general information and each of them has a detail view with more information about the characters. Take a look! 👀 

<img src="https://user-images.githubusercontent.com/81619759/142416919-7a0860b9-6a7a-48f1-86c9-5948c0b6897a.png" alt="App view with all of Rick and Morty characters" width="250"/> <img src="https://user-images.githubusercontent.com/81619759/142417024-6d78e00b-ac5e-4311-9d2c-026cf769a54f.png" alt="App view with all of Rick and Morty locations" width="250"/> <img src="https://user-images.githubusercontent.com/81619759/142417104-a28b54eb-d070-4ec6-acec-bc580b265622.png" alt="App view with all of Rick and Morty episodes" width="250"/>

<img src="https://user-images.githubusercontent.com/81619759/142417263-6ba02f4c-25a8-49e4-a267-7a63297f6bc8.png" alt="App view of character detail" width="250"/> <img src="https://user-images.githubusercontent.com/81619759/142417293-0ca68397-04c1-43dd-9a03-5f61f31acfbc.png" alt="App view with location detail" width="250"/> <img src="https://user-images.githubusercontent.com/81619759/142417300-e2a16650-95c6-466f-9332-02f23ae12b85.png" alt="App view with episodes detail" width="250"/>


## Initial Requirements 📋

- Create a Swift App
- App must be fed via API
- Show list of characters (show: image, name and status)
- Show list of locations (show: name, type and dimension)
- Show list of episodes (show: name, episode and air date)
- Show character detail (show: image, name, status, species, type, gender, origin location, last known location and first seen episode)
- Show a list of characters for a specified location
- Show a list of characters for a specified episode
- Implement pagination

## Extra features 🚀 

- Add extra information for experience purposes
- Add a tab bar
- Support dark mode 🌙 
- Test entities, repositories and useCases
- Add a Launch Screen and app icon
- Create colour scheme
- Pagination as infinite scroll to three main views
- Cute styles 💅

## Last updates 🚀 

- Added states in CharacterList for reactive rending
- Added ViewInspector 

## Built with 🔨
- XCode
- SwiftUI
- Combine

## Development ⌨️

First of all, I used the Elephant Carpaccio approach, which is to do smaller tasks until I finish the app. Basically to be Agile. For so I created a GitHub Project with 5 columns. One for general info I thought it was important to have on hand and a to-do, in-progress, pull request and done. I also automated them so that when an issue was on Pull Request it moved automatically and when the PR was merged and closed it moved also automatically to done ✅ 

The project had four main milestones and a lot of labels that helped me to keep it organized and not get overwhelmed. You may take a look 🔎 [to the labels here](https://github.com/silviaespanagil/rick-and-morty-a-swiftUI-app/labels) as for the Milestones I decided to have one related to API management, and another for the Models, one for Testing tasks and the last one related to Extra Features.

With that done I started working. The API management was done with Combine. As I have to work with many API calls I decided to work by functionalities so I started with everything related to "Characters": Entities, repositories, use cases, scenes and tests. After that was done I did the same with "Locations" and "Episodes", that way I could guarantee an MVP in early stages.

## Cool stuff 💖

💻  **Combine** 💻 

Combine is a framework that allows us to process asynchronous events and manage states making reactive programming more concise, readable, scalable and maintainable. So I used it to make all the service calls to the API. 

♾️  **Infinite scroll** ♾️ 

The infinite scroll is one of my favourite things in the whole project. This was my first time doing it so it took me some hours to get it and correctly implement it but it was sooooo worthy as it looks great. What I do is that I send a currentPage parameter to my function starting with page 1, we ask the API for the page 1 information and we render it into a `List` and using `onAppear()` we check if we are in the last element of our array, if so, we call the function again but we sum up 1 += to our current page each time we call it. 

Here is important to remember that as we want to keep all of the elements of the previous pages we must append the new information the API send us to the old one, this way is not like we are loading new pages but we are actually creating an infinite scroll. Believe me, it sounds obvious but I forgot it twice.

<img src="https://user-images.githubusercontent.com/81619759/142438468-7501272a-9d15-4203-8083-1548526e9f19.gif" alt="Gif showing an infinite scroll" width="300"/>

🎨 **Colour palette and customization** 🎨

I know I kinda enjoy little things but I do think they make the difference. I created a little colour palette to use all over the project. I also added a custom LaunchScreen.


![image](https://user-images.githubusercontent.com/81619759/142441715-d0026647-bbbc-49d9-8870-5c0349bea835.png)


🌙 **Dark mode** 🌙

This is an encore. I love a dark mode and a lot of users do so too so, I used the `colorScheme` environment key to detect the user configuration so the views render correctly according to it.

Here you can see a light and a dark mode video. 

https://user-images.githubusercontent.com/81619759/142444545-ab92d7b3-cf14-4a39-98fd-69db30ccd831.mov

https://user-images.githubusercontent.com/81619759/142637572-3e8376a8-2122-4ac3-8f22-3b8ca37d243c.mov


## Want to clone this repo? 🐑

If you want to clone this repo please feel free to! Go for it, - let me know if you do something cool wit it

