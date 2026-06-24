import 'dart:io';
main()
{
  List<String> fruits = ['Apple', 'Banana', 'Mango', 'Orange', 'Grapes'];
  fruits.sort();
for(var  s=0;s<fruits.length;s++)
  {
    print(fruits[s]);
  }
  fruits.add('Pineapple');
  print(fruits);
  fruits.remove('Banana');
    print(fruits);
fruits.addAll(['miel','anas']);
print(fruits);
fruits.insert(0, 'Strawberry');
print(fruits);
var addf=['kiwi','pear','watermelon'];
fruits.insertAll(2, addf);
print(fruits);
fruits.removeAt(3);
print(fruits);  
fruits.removeLast();
print(fruits);
fruits.removeRange(1, 3);
print(fruits); 
fruits.replaceRange(1, 3, ['cherry','peach']);
print(fruits);
 
print("Enter yourb team size");
int teamSize=int.parse(stdin.readLineSync()!);
List<String>teammate=[];
for(int i=0;i<teamSize;i++)

{
  teammate.add(stdin.readLineSync()!);

}
for(int i=0;i<teammate.length;i++)
  {
    print(teammate[i]);
  }
}