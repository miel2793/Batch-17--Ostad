import 'dart:io';
main()
{

  Set<int>a={2,3,4,5,6,7,4};
  Set<int>b={4,6,7,8,4,5,3};
  print(a.union(b) );

 print(a.intersection(b) ) ;
 print(a.difference(b));
}