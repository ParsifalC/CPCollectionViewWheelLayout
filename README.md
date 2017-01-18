# CPCollectionViewWheelLayout
[![Version](https://img.shields.io/cocoapods/v/CPCollectionViewWheelLayout.svg?style=flat)](http://cocoapods.org/pods/CPCollectionViewWheelLayout)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/CPCollectionViewWheelLayout.svg?style=flat)]
(http://cocoapods.org/pods/CPCollectionViewWheelLayout)
[![Platform](https://img.shields.io/cocoapods/p/CPCollectionViewWheelLayout.svg?style=flat)](http://cocoapods.org/pods/CPCollectionViewWheelLayoutSwift)    

An interesting wheel layout of collection view.
[Here's the Swift version](https://github.com/Parsifal/CPCollectionViewWheelLayoutSwift)
## Overview
<p align="center"><img src="https://github.com/ParsifalC/CPCollectionViewWheelLayout/blob/master/CollectionViewWheelLayoutDemo/Demo.gif?raw=true"/></p>

## Requirements
iOS7.0 or later.
## Installation    

#### CocoaPods:    

```
pod 'CPCollectionViewWheelLayout', '~> 1.0.3'
```

if you got the error below when installing:


```
Unable to find a specification for `CPCollectionViewWheelLayout (~> 1.0.3)`
```
try this command to update your master pod repo

```
pod setup
```

#### Manually:
1.clone this repo;

2.add the source files --'CPCollectionViewWheelLayout.h' and 'CPCollectionViewWheelLayout.m' to your project.    
#### Carthage    

```
github "ParsifalC/CPCollectionViewWheelLayout"
```

## Usage
```Objective-C  
    CPCollectionViewWheelLayout *wheelLayout =
    [[CPCollectionViewWheelLayout alloc] initWithRadius:self.view.bounds.size.width/1.8
                                               cellSize:CGSizeMake(60, 60)
                                                angular:20
					       fadeAway:NO
					     layoutType:self.layoutType];
    
    UICollectionView *collectionView = 
    [[UICollectionView alloc] initWithFrame:CGRectMake(0,
    						      64, 
						      self.view.bounds.size.width, 
						      self.view.bounds.size.height-64)
		       collectionViewLayout:wheelLayout];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[CPCollectionViewCell class]
       forCellWithReuseIdentifier:NSStringFromClass([CPCollectionViewCell class])];
```
## License
MIT
