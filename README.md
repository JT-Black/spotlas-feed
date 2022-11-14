# Spotlas Feed

A small front end Flutter app that consumes the Spotlas App user feed API. The user can scroll through the feed, look at reviews for 'spots', save the spot, and like the review. This app was fun to build, there were some nice challenges: implement a scrolling image carousel that contained the user and spot superimposed over the images, an expanding review caption, and a horizontally scrolling tag list that uses Flutter chip widgets. Another challenge that I enjoyed was implementing the BLoC pattern for state management, and feature-based architecture. As a result the code is well-organised, it's easy to read, and has a modular structure that allows for implementation of new features without breaking existing ones. Substitution of individual component layers without breaking other layers is possible using BLoC. Perhaps the greatest advantage is readability gained by the organisation of the code allowing someone else to easily pick up where I left off.

## Run The App

- Install Flutter SDK
- Install Android SDK or Apple XCode
- Run mobile emulator
- Install Dependencies
- In Terminal, type the command: flutter run

## Screen Recording

Feed
<p style="text-align:center">
  

https://user-images.githubusercontent.com/87031124/201330682-cdad6d87-47e4-495a-ba2e-8134b894b3f2.mp4



</p>

## Screenshots

Feed
<p style="text-align:center">
  <img  src="assets/SpotlasFeed.png">
</p>

## Todos
I wanted to put the project up with the requested MVP, and so there are a couple stretch goals left to finish.
- Finish implementing the add and like functionality.
- Extract the main build method into individual widgets
