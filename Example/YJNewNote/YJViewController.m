//
//  YJViewController.m
//  YJNewNote
//
//  Created by lyj on 04/09/2020.
//  Copyright (c) 2020 lyj. All rights reserved.
//

#import "YJViewController.h"
#import <YJNewNote/YJNewNoteManager.h>

@interface YJViewController ()

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    YJNewNoteManager.defaultManager.newNoteType = YJNewNoteTypeKlg;
//    YJNewNoteManager.defaultManager.US_voice = @"http://dfff";
    YJNewNoteManager.defaultManager.US_phonetic = @"jhjkdj";
//    YJNewNoteManager.defaultManager.UN_voice = @"http://dfff";
    YJNewNoteManager.defaultManager.UN_phonetic = @"hhhhhh";
    YJNewNoteManager.defaultManager.Explain = @"四大皆空还放假分类速度快建峰开发了时代峰峻第三轮开发阶段理发卡死了副科级萨兰斯克的分句的时空裂缝就案例可夫斯基山卡拉附件杀了开发就类速度快建峰开发了时代峰峻第三轮开发阶段理发卡死了副科级萨兰斯克的分句的时空裂缝就案例可夫斯基山卡拉附件杀了开发就";
    [YJNewNoteManager defaultManager].NoteApi = @"http://192.168.129.130:10104/Web_FSCModule_Note/";
    [YJNewNoteManager defaultManager].UserID = @"Stu601";
    [YJNewNoteManager defaultManager].UserType = 2;
    [YJNewNoteManager defaultManager].Token = @"6a332064-d1af-47aa-bd6a-2c31752c1974";
    [YJNewNoteManager defaultManager].SchoolID = @"S-130";
    [YJNewNoteManager defaultManager].ReSourceName = @"fanwen";
    [YJNewNoteManager defaultManager].ResourceID = @"6a332064-d1af-47aa-bd6a-2c31752c1974";
    [YJNewNoteManager defaultManager].SystemID = @"930";
    [YJNewNoteManager defaultManager].SystemName = @"电子教材库";
    [YJNewNoteManager defaultManager].SubjectID = @"S1-English";
    [YJNewNoteManager defaultManager].SubjectName = @"英语";
    [YJNewNoteManager defaultManager].MaterialID = @"CHDE31191CIA10004yK";
    [YJNewNoteManager defaultManager].MaterialName = @"Great Depression";
    [YJNewNoteManager defaultManager].NoteTitle = @"English YJNewNoteManager defaultManager";
    [[YJNewNoteManager defaultManager] showNewNoteViewOn:[UIApplication sharedApplication].delegate.window];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
