# CPCollectionViewWheelLayout
An interested wheel layout of collection view.

##Overview
<p align="center"><img src="https://github.com/mingweizhang/CPCollectionViewWheelLayout/blob/master/CollectionViewWheelLayoutDemo/Demo.gif?raw=true"/></p>

##Requirements
iOS7.0 or later.
##Installation
####CocoaPods:
```
pod 'CPCollectionViewWheelLayout', '~> 1.0.0'
```

if you got the error below when install:


```
Unable to find a specification for `CPCollectionViewWheelLayout (~> 1.0.0)`
```
try this command to update your master pod repo

```
pod setup
```

####Manually
1.clone this repo;

2.add the source files --'CPCollectionViewWheelLayout.h' and 'CPCollectionViewWheelLayout.m' to your project.
##Usage
```  
    CPCollectionViewWheelLayout *wheelLayout =
    [[CPCollectionViewWheelLayout alloc] initWithRadius:self.view.bounds.size.width/1.8
                                               cellSize:CGSizeMake(60, 60)
                                                angular:20
											    fadeAway:NO
											  layoutType:self.layoutType];
    
    UICollectionView *collectionView = 
    [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) collectionViewLayout:wheelLayout];
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