# NewsApp

<p align="center">
  <img src="https://github.com/PhilomathMac/NewsApp/blob/main/PortfolioImage.png?raw=true" alt="newsapp screenshot" width="200"/>
</p>

## Description
SwiftUI app to get and display latest news articles that mention Apple

## Skills Practiced

* UIKit TableViews
* Segues
* Passing Information Between Views
* DataSource and Delegate Pattern
* WebKit
* WKWebView
* UIActivityIndicatorView
* Retrieving Data with URLs
* DispatchQueue
* Decoding JSON Data
* Caching Images

## Future Features / Fixes
* Prevent add videos from opening automatically?
* Mark unread articles with a blue dot

## Use Instructions

This app uses NewsApi. In order to use this app, follow the instructions below:

1. Clone the repo
2. Create an account with NewsAPI and get your own api key
3. Create a Constants struct with a static constant to store your api key

``` swift
struct Constants {
  static let apiKey = "ENTER YOUR API KEY HERE"
}
```

## Attributions

This was developed using in CodeWithChris's iOS Foundations course. Check out the full course at https://codewithchris.com/
