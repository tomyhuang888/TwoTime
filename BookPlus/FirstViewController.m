//
//  FirstViewController.m
//  BookPlus
//
//  Created by Thomas Huang on 4/30/19.
//

#import "FirstViewController.h"
#import <UIKit/UIKit.h>
#import "BookTableViewCell.h"

@interface FirstViewController ()

//@property (nonatomic, strong) IBOutlet UITableView * booksInterest;
@property (nonatomic, strong) NSMutableArray* tableData;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.booksInterest.delegate = self;
//    self.booksInterest.dataSource = self;
    
    self.tableData = [[NSMutableArray alloc] init];
    
    [self.tableData addObject: @{ @"image" : @"Clrs3.jpeg",
                             @"title" : @"Introduction to Algorithms, 3rd Edition (The MIT Press)",
                             @"author" : @"By Thomas H. Cormen, Charles E. Leiserson, Ronald Riverst, Clifford Stein"
                             }];
    [self.tableData addObject: @{ @"image" : @"calculus.jpg",
                             @"title" : @"Calculus: A Complete Course, Seventh Edition (7th Edition)",
                             @"author" : @"by Robert Adams, Christopher Essex"
                             }];
    
//    [self.booksInterest reloadData];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"BookTableViewCell";
    
    BookTableViewCell *cell = (BookTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:MyIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.title.text = [self.tableData objectAtIndex:indexPath.row][@"title"];
    cell.image.image = [UIImage imageNamed:[self.tableData objectAtIndex:indexPath.row][@"image"]];
    cell.author.text = [self.tableData objectAtIndex:indexPath.row][@"author"];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowDetail" sender:tableView];
}
@end
