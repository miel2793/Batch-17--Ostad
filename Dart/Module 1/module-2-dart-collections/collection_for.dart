import'dart:io';
main()
{
  List<String>  name = ['anas','miel'];
  List<String>  to_up=[
    for(var n in name)
      n[0].toUpperCase() +n.substring(1)


  ];
  print(to_up);
}