import 'dart:io';
main()
{
  bool is_student =false;
  bool is_teacher =true;

   List<String> annex =[
     'Name',
     'ID',
     if(is_teacher)'Qualification',
     if(is_student)'intake'


   ];
   Map<String,dynamic> details =
   {
     'Name':'Miel Mahmud Sifat',
     'ID':'20234103368',
     if(is_student)'intake':'52',
     if(is_teacher)'Desognation':'Lecturer'


   };
   print(annex);
   print(details['intake']);
}