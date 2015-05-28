//
//  CartViewController.m
//  测试界面
//
//  Created by shoule on 15/5/20.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "CartViewController.h"
#import "CartCell.h"
#import "ExtraCartCell.h"
#import "AccessoriesCell.h"

@implementation CartViewController
#pragma mark - ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavi];
    [self initControls];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init
- (void)initNavi{
    self.title = @"我的购物车";
    self.navigationController.navigationBar.titleTextAttributes
        = @{ NSForegroundColorAttributeName: [UIColor colorWithRed:217/255.f
                                                             green:54/255.f
                                                              blue:22/255.f
                                                             alpha:1.0f],
             NSFontAttributeName : [UIFont systemFontOfSize:20.f]
             };
    UIButton* customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    customBtn.frame = CGRectMake(12.5, 34, 20, 20);
    [customBtn setImage:[UIImage imageNamed:@"icon-title-return"] forState:UIControlStateNormal];
    UIBarButtonItem* buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:customBtn];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [customBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initControls{
    _footerView.frame = CGRectMake(0,Screen_height-49-64,Screen_width , 49);
    [self.view addSubview:_footerView];
}

- (void)initData{
    _isSelectedAllPick = NO;
    _cellSelectedArray = [[NSMutableArray alloc]init];
    _addSelectedArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i<3; i++) {
        [self addDataModleFromArray:_cellSelectedArray];
    }

    [self addDataModleFromArray:_addSelectedArray];

    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)addDataModleFromArray:(NSMutableArray *)array{
    NSMutableDictionary *Dic = [NSMutableDictionary new];
    NSString *isSelected = @"NO";
    [Dic setValue:isSelected forKey:@"selected"];
    [array addObject:Dic];
}

#pragma mark - Actions
//全选按钮被点击时
- (IBAction)AllPick:(UIButton *)sender {
    //首先判断是否被全选
    _isSelectedAllPick = [self isAllPick];
    NSArray *visibleRowsArr = [NSArray arrayWithArray:[_tableView indexPathsForVisibleRows]];
    for (int i=0; i<[visibleRowsArr count]; i++) {
        NSIndexPath *indexPath= [visibleRowsArr objectAtIndex:i];
        //拿到TableView中对应indexPath的cell
        UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
        //根据cell的类型来设置其所对应的selected字段属性
        switch (indexPath.section) {
            case 0:{
                [self setCellSelectedProperty:cell Array:_cellSelectedArray Section:0 Row:indexPath.row];
                break;
            }
            case 1:{
                [self setCellSelectedProperty:cell Array:_addSelectedArray Section:1 Row:indexPath.row];
                break;
            }
            default:
                break;
        }
    }
    
    if (!_isSelectedAllPick){
        for (NSDictionary *Dic in _cellSelectedArray)
            [Dic setValue:@"YES" forKey:@"selected"];
        for (NSDictionary *Dic in _addSelectedArray)
            [Dic setValue:@"YES" forKey:@"selected"];

        [_allPickImage setImage:[UIImage imageNamed:@"ico-torlly-check"]];
        _isSelectedAllPick = YES;
        
        
    }
    
    else{
        for (NSDictionary *Dic in _cellSelectedArray)
            [Dic setValue:@"NO" forKey:@"selected"];
        for (NSDictionary *Dic in _addSelectedArray)
            [Dic setValue:@"NO" forKey:@"selected"];

        [_allPickImage setImage:[UIImage imageNamed:@"ico-torlly-ncheck"]];
        _isSelectedAllPick = NO;
        _sumPrice.text = @"¥0";
    }
}

- (void)plusBtnOnClick:(UIButton *)sender{
    NSUInteger Tag = sender.tag;
    NSUInteger section,row;
    if ((Tag>=CART_PLUS) && (Tag<EXTRA_PLUS)) {
        section = 0;
        row = Tag - CART_PLUS;
    }
    else if ((Tag>=EXTRA_PLUS) && (Tag<TABLEWARE_PLUS)){
        section = 1;
        row = Tag - EXTRA_PLUS;
    }
    else {
        section = 2;
        row = 0;
    }
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    UITableViewCell* cell = (UITableViewCell*)[_tableView cellForRowAtIndexPath:indexPath];

    switch (section) {
        case 0:{
            CartCell *cartCell = (CartCell *)cell;
            NSUInteger No = [cartCell.numberLabel.text integerValue];
            No = No + 1;
            cartCell.numberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)No];
            //当选中时，算钱
            if (cartCell.isSelectBtn)
                [self changePriceWhenSelectedAndButtonOnClick:cartCell Section:0 Operation:@"+"];

            break;
        }
        case 1:{
            ExtraCartCell *extraCartCell = (ExtraCartCell *)cell;
            NSUInteger No = [extraCartCell.numberLabel.text integerValue];
            No = No + 1;
            extraCartCell.numberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)No];
            //当选中时，算钱
            if (extraCartCell.isSelectBtn)
                [self changePriceWhenSelectedAndButtonOnClick:extraCartCell Section:1 Operation:@"+"];

            break;
        }
        case 2:{
            AccessoriesCell *accessoriesCell = (AccessoriesCell *)cell;
            if (Tag==TABLEWARE_PLUS) { //餐具加号button被点击时
                NSUInteger twNo = [accessoriesCell.tablewareNoLabel.text integerValue];
                twNo = twNo + 1;
                accessoriesCell.tablewareNoLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)twNo];
                accessoriesCell.price = TABLEWARE_PRICE;
                [self changePriceWhenSelectedAndButtonOnClick:accessoriesCell Section:2 Operation:@"+"];
            }
            else if (Tag==CANDLE_PLUS){ //蜡烛加号button被点击时
                NSUInteger cdNo = [accessoriesCell.candleNoLabel.text integerValue];
                cdNo = cdNo +1;
                accessoriesCell.candleNoLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)cdNo];
                accessoriesCell.price = CANDLE_PRICE;
                [self changePriceWhenSelectedAndButtonOnClick:accessoriesCell Section:2 Operation:@"+"];
            }
            break;
        }
        default:
            break;
    }
    
}

- (void)minusBtnOnClick:(UIButton *)sender{
    NSUInteger Tag = sender.tag;
    NSUInteger section,row;
    if ((Tag>=CART_PLUS) && (Tag<EXTRA_PLUS)) {
        section = 0;
        row = Tag - CART_MINUS;
    }
    else if ((Tag>=EXTRA_PLUS) && (Tag<TABLEWARE_PLUS)){
        section = 1;
        row = Tag - EXTRA_MINUS;
    }
    else {
        section = 2;
        row = 0;
    }
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    UITableViewCell* cell = (UITableViewCell*)[_tableView cellForRowAtIndexPath:indexPath];
    switch (section) {
        case 0:{
            CartCell *cartCell = (CartCell *)cell;
            NSUInteger No = [cartCell.numberLabel.text integerValue];
            if (No>1) {
                No = No - 1;
                cartCell.numberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)No];
                cartCell.numberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)No];
                //当选中时，算钱
                if (cartCell.isSelectBtn)
                    [self changePriceWhenSelectedAndButtonOnClick:cartCell Section:0 Operation:@"-"];
            }
            
            break;
        }
        case 1:{
            ExtraCartCell *extraCartCell = (ExtraCartCell *)cell;
            NSUInteger No = [extraCartCell.numberLabel.text integerValue];
            if (No>0) {
                No = No - 1;
                extraCartCell.numberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)No];
                //当选中时，算钱
                if (extraCartCell.isSelectBtn)
                   [self changePriceWhenSelectedAndButtonOnClick:extraCartCell Section:1 Operation:@"-"];
            }
        }
        case 2:{
            AccessoriesCell *accessoriesCell = (AccessoriesCell *)cell;
            if (Tag==TABLEWARE_MINUS) { //餐具减号button被点击时
                NSUInteger twNo = [accessoriesCell.tablewareNoLabel.text integerValue];
                if (twNo>0) {
                    twNo = twNo - 1;
                    accessoriesCell.tablewareNoLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)twNo];
                    accessoriesCell.price = TABLEWARE_PRICE;
                    [self changePriceWhenSelectedAndButtonOnClick:accessoriesCell Section:2 Operation:@"-"];
                }
            }
            else if(Tag==CANDLE_MINUS){   //蜡烛减号button被点击时
                NSUInteger cdNo = [accessoriesCell.candleNoLabel.text integerValue];
                if (cdNo>0) {
                    cdNo = cdNo - 1;
                    accessoriesCell.candleNoLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)cdNo];
                    accessoriesCell.price = CANDLE_PRICE;
                    [self changePriceWhenSelectedAndButtonOnClick:accessoriesCell Section:2 Operation:@"-"];
                }
            }
            break;
        }
        default:
            break;
    }
}


#pragma mark - TableViewDataSource
//section中包含row的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) return [_cellSelectedArray count];
    if (section == 1) return [_addSelectedArray count];
    else return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.row;
    NSUInteger section = indexPath.section;
    switch (section) {
        case 0:{    //当前显示cell为主购物车Section
            CartCell *cell = (CartCell *)[self dealTheCell:CART_CELL_ID
                                                   Section:section
                                                       Row:row
                                                     Array:_cellSelectedArray];
            [cell.minusBtn addTarget:self action:@selector(minusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.plusBtn addTarget:self action:@selector(plusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            //为主购物车Section加减按钮分别设置对应的tag值
            cell.plusBtn.tag = CART_PLUS + row;
            cell.minusBtn.tag = CART_MINUS + row;
            
            return cell;
            break;
        }
        case 1:{    //当前显示cell为加购价Section
            ExtraCartCell *cell = (ExtraCartCell *)[self dealTheCell:EXTRA_CART_CELL_ID
                                                             Section:section
                                                                 Row:row
                                                               Array:_addSelectedArray];
            [cell.minusBtn addTarget:self action:@selector(minusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.plusBtn addTarget:self action:@selector(plusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            //为加价购Section加减按钮分别设置对应的tag值
            cell.plusBtn.tag = EXTRA_PLUS + row;
            cell.minusBtn.tag = EXTRA_MINUS + row;
            
            return cell;
            break;
        }
        default:{   //当前显示cell为配件Section
            AccessoriesCell* cell =  [[[NSBundle mainBundle] loadNibNamed:ACCESSORIES_CELL_ID owner:self options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.twMinusBtn addTarget:self action:@selector(minusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.cdMinusBtn addTarget:self action:@selector(minusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.twPlusBtn addTarget:self action:@selector(plusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.cdPlusBtn addTarget:self action:@selector(plusBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            cell.twPlusBtn.tag = TABLEWARE_PLUS;
            cell.twMinusBtn.tag = TABLEWARE_MINUS;
            cell.cdPlusBtn.tag = CANDLE_PLUS;
            cell.cdMinusBtn.tag = CANDLE_MINUS;
    
            return cell;
            break;
        }
    }
}


#pragma mark 处理cell的显示
- (UITableViewCell *)dealTheCell:(NSString *)cellIdentifier Section:(NSUInteger)section Row:(NSUInteger)row Array:(NSMutableArray *)array{
    //拿到所对应的cell
    UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] firstObject];
    //设置SelectionStyle为None
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //将字典取出 并设置select的状态
    NSMutableDictionary *Dic = [[NSMutableDictionary alloc]init];
    Dic = [array objectAtIndex:row];
    
    if ([[Dic objectForKey:@"selected"] isEqualToString:@"YES"]){
        if (section == 0) {
            CartCell *cartCell = (CartCell *)cell;
            [cartCell selectedFlagButton:YES];
        }
        else if(section == 1){
            ExtraCartCell *extraCartCell = (ExtraCartCell *)cell;
            [extraCartCell selectedFlagButton:YES];
        }
    }
    //else
        //[cell selectedFlagButton:NO];
    
    return cell;
}

#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) return 90;
    else return 103;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(-2, 0, Screen_width + 4, 25)];
    headerView.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0];
    headerView.layer.borderWidth = 1.0f;
    headerView.layer.borderColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0].CGColor;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 2, 100, 20)];
    if (section == 0) titleLabel.text = @"购物车";
    else if (section == 1) titleLabel.text = @"加价购";
    else titleLabel.text = @"配件";
    
    titleLabel.font = [UIFont systemFontOfSize:17.0f];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:titleLabel];
    
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            [self dealSelectedCellWithArray:_cellSelectedArray
                                CurrentCell:[tableView cellForRowAtIndexPath:indexPath]
                                    Section:0
                                        Row:indexPath.row];
            break;
        case 1:
            [self dealSelectedCellWithArray:_addSelectedArray
                                CurrentCell:[tableView cellForRowAtIndexPath:indexPath]
                                    Section:1
                                        Row:indexPath.row];
            break;
        default:
            break;
    }
}

#pragma mark 处理cell的选中状态
- (void)dealSelectedCellWithArray:(NSMutableArray *)array CurrentCell:(UITableViewCell *)cell Section:(NSUInteger)section Row:(NSUInteger)row{
    NSMutableDictionary *Dic = [array objectAtIndex:row];
    switch (section) {
        case 0:{    //当前显示cell为主购物车Section
            CartCell *cartCell = (CartCell *)cell;
            if ([[Dic objectForKey:@"selected"] isEqualToString:@"NO"]) {
                [Dic setObject:@"YES" forKey:@"selected"];
                [cartCell selectedFlagButton:YES];
                //金额变更
                [self changePrice:cartCell Section:0 Operation:@"+"];
                
                //检查是否被全选 如果是全选状态则改变 全选状态 YES
                if ([self isAllPick]) {
                    [_allPickImage setImage:[UIImage imageNamed:@"ico-torlly-check"]];
                    _isSelectedAllPick = YES;
                }
            }
            else{
                [Dic setObject:@"NO" forKey:@"selected"];
                [cartCell selectedFlagButton:NO];
                //金额变更
                [self changePrice:cartCell Section:0 Operation:@"-"];
                
                //检查是否已经不为全选状态 如果是 则改变 全选状态 NO
                if (_isSelectedAllPick){
                    [_allPickImage setImage:[UIImage imageNamed:@"ico-torlly-ncheck"]];
                    _isSelectedAllPick = NO;
                }
            }
            break;
        }
        case 1:{    //当前显示cell为加购价Section
            ExtraCartCell *extraCartCell = (ExtraCartCell *)cell;
            if ([[Dic objectForKey:@"selected"] isEqualToString:@"NO"]) {
                [Dic setObject:@"YES" forKey:@"selected"];
                [extraCartCell selectedFlagButton:YES];
                //检查是否被全选 如果是全选状态则改变全选状态为Y
                //金额变更
                [self changePrice:extraCartCell Section:1 Operation:@"+"];
                if ([self isAllPick]) {
                    [_allPickImage setImage:[UIImage imageNamed:@"ico-torlly-check"]];
                    _isSelectedAllPick = YES;
                }
            }
            else{
                [Dic setObject:@"NO" forKey:@"selected"];
                [extraCartCell selectedFlagButton:NO];
                //金额变更
                [self changePrice:extraCartCell Section:1 Operation:@"-"];
                //检查是否已经不为全选状态 如果是 则改变全选状态栏NO
                if (_isSelectedAllPick){
                    [_allPickImage setImage:[UIImage imageNamed:@"ico-torlly-ncheck"]];
                    _isSelectedAllPick = NO;
                }
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark - 自定义方法判断是否全选
- (void)changePrice:(UITableViewCell *)cell Section:(NSUInteger)section Operation:(NSString*)operation{
    //金额变更
    NSUInteger Price = [[_sumPrice.text substringFromIndex:1]integerValue];
    switch (section) {
        case 0:{
            CartCell *cartCell = (CartCell *)cell;
            
            NSString *priceStr = [cartCell.priceLabel.text substringFromIndex:1];
            int cakeNo = [cartCell.numberLabel.text intValue];
            
            if ([operation isEqualToString:@"+"])
                Price = Price + [priceStr intValue]*cakeNo;
            else if ([operation isEqualToString:@"-"])
                Price = Price - [priceStr intValue]*cakeNo;
            
            _sumPrice.text = [NSString stringWithFormat:@"¥%lu",(unsigned long)Price];
            
            
            break;
        }
        case 1:{
            ExtraCartCell *extracCartCell = (ExtraCartCell *)cell;
            
            NSString *priceStr = [extracCartCell.priceLabel.text substringFromIndex:1];
            int cakeNo = [extracCartCell.numberLabel.text intValue];
            
            if ([operation isEqualToString:@"+"])
                Price = Price + [priceStr intValue]*cakeNo;
            else if ([operation isEqualToString:@"-"])
                Price = Price - [priceStr intValue]*cakeNo;
            _sumPrice.text = [NSString stringWithFormat:@"¥%lu",(unsigned long)Price];
            break;
        }
        default:
            break;
    }
}

- (void)changePriceWhenSelectedAndButtonOnClick:(UITableViewCell *)cell Section:(NSUInteger)section Operation:(NSString*)operation{
    switch (section) {
        case 0:{
            CartCell *cartCell = (CartCell *)cell;
            NSUInteger price = [[cartCell.priceLabel.text substringFromIndex:1]integerValue];
            NSUInteger sumPrice = [[_sumPrice.text substringFromIndex:1]integerValue];
            if ([operation isEqualToString:@"+"])
                _sumPrice.text = [NSString stringWithFormat:@"¥%ld",sumPrice + price];
            else if ([operation isEqualToString:@"-"])
                _sumPrice.text = [NSString stringWithFormat:@"¥%ld",sumPrice - price];
            break;
        }
        case 1:{
            ExtraCartCell *extraCartCell = (ExtraCartCell *)cell;
            NSUInteger price = [[extraCartCell.priceLabel.text substringFromIndex:1]integerValue];
            NSUInteger sumPrice = [[_sumPrice.text substringFromIndex:1]integerValue];
            if ([operation isEqualToString:@"+"])
                _sumPrice.text = [NSString stringWithFormat:@"¥%ld",sumPrice + price];
            else if ([operation isEqualToString:@"-"])
                _sumPrice.text = [NSString stringWithFormat:@"¥%ld",sumPrice - price];
            break;
        }
        case 2:{
            AccessoriesCell *accessoriesCell = (AccessoriesCell *)cell;
            NSUInteger sumPrice = [[_sumPrice.text substringFromIndex:1]integerValue];
            
            if ([operation isEqualToString:@"+"]){
                _sumPrice.text = [NSString stringWithFormat:@"¥%ld",sumPrice + accessoriesCell.price];
            }
            else if ([operation isEqualToString:@"-"]){
                NSString *tempStr  = _sumPrice.text;
                NSInteger price = [tempStr integerValue];
                if (price > 0)
                    _sumPrice.text = [NSString stringWithFormat:@"¥%ld",sumPrice - accessoriesCell.price];
                
            }
            break;
        }
        default:
            break;
    }
}

//判断是否为全选状态
- (BOOL)isAllPick{
    for (NSDictionary *Dic in _cellSelectedArray)
        if ([[Dic objectForKey:@"selected"] isEqualToString:@"NO"])
            return NO;
    for (NSDictionary *Dic in _addSelectedArray)
        if ([[Dic objectForKey:@"selected"] isEqualToString:@"NO"])
            return NO;
    return YES;
}

//设置cell的选中属性
- (void)setCellSelectedProperty:(UITableViewCell *)cell Array:(NSMutableArray *)array Section:(NSUInteger)section Row:(NSUInteger)row{
    NSMutableDictionary *Dic = [array objectAtIndex:row];
    switch (section) {
        case 0:{
            CartCell *cartCell = (CartCell *)cell;
            if (!_isSelectedAllPick) {
                [Dic setObject:@"YES" forKey:@"selected"];
                [cartCell selectedFlagButton:YES];
            }
            else {
                [Dic setObject:@"NO" forKey:@"selected"];
                [cartCell selectedFlagButton:NO];
            }
            break;
        }
        case 1:{
            ExtraCartCell *extraCartCell = (ExtraCartCell *)cell;
            if (!_isSelectedAllPick) {
                [Dic setObject:@"YES" forKey:@"selected"];
                [extraCartCell selectedFlagButton:YES];
            }
            else {
                [Dic setObject:@"NO" forKey:@"selected"];
                [extraCartCell selectedFlagButton:NO];
            }
            break;
        }
        default:
            break;
    }
}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
