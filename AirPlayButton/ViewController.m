//
//  ViewController.m
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor grayColor];
    [self addAirPlayButton];
    [super viewDidLoad];
}

- (void)addAirPlayButton
{
    // Зеленая вью - контейнер
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    view.backgroundColor = [UIColor greenColor];
    
    // MPVolumeView - черная
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectZero];
    volumeView.backgroundColor = [UIColor blackColor];
    // показываем кнопку airplay и скрываем слайдер громкости
    volumeView.showsRouteButton = YES;
    volumeView.showsVolumeSlider = NO;
    // Устанавливаем свою иконку на аирплей кнопку
    [volumeView setRouteButtonImage:[UIImage imageNamed:@"Airplay.png"] forState:UIControlStateNormal];

    // находим кнопку в subviews
    for (id view in volumeView.subviews)
    {
        if ([[[view class] description] isEqualToString:@"MPButton"])
        {
            // делаем кнопку оранжевой и пытаемся сделать отступ от родительского зеленого вью
            // размеры кнопки изменились а вот координаты x и y как будто не работают
            UIButton *airPlayButton = (UIButton *)view;
            airPlayButton.frame = CGRectMake(20, 20, 20, 20);
            airPlayButton.backgroundColor = [UIColor orangeColor];
        }
    }
    
    [view addSubview:volumeView];
    [self.view addSubview:view];
}



@end
