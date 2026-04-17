/*main()
{
    //● Growable lists and fixed-length lists
     List<int>  id =[101,102,103,104];
     print(id)  ;

     //● Adding elements using add()
id.add(50);
print("After add  :$id");

//● Removing elements using remove()

id.remove(103);
print("After remove :$id");

//● Inserting elements using insert()

id.insert(3, 500);
print("After insert :$id");

//● Sorting numeric or string lists

id.sort();
print("After sort :$id");


// 3: Practicing Sets (Unique Elements)

Set<int>  room_no  ={2,3,4,3,4,5,1,2,5,7,8,4,5,98,};

 print(room_no);   

 // add element 
 room_no.add(100) ;
 print(room_no);
 //remove
 room_no.remove(100);
 print(room_no);

 Set<int>  teacher_id  ={1,2,3,4,5,6,7,8,9,10};
 //union
 print(room_no.union(teacher_id));
 //intersection
 print(room_no.intersection(teacher_id));
 //difference
 print(room_no.difference( teacher_id));

 //Step 4: Practicing Maps (Key-Value Pairs)

Map<String,String>  name_grade={
    "Miel":"A+",
    "arif":"B+",
    "anas":"A+"

};
print(name_grade);

// Working with Nested Maps

Map<int, Map<String,dynamic>> student={
    101:{"name":"Miel","grade":"A+","Adress":"Dhaka"},
    102:{"name":"arif","grade":"B+"},
    103:{"name":"anas","grade":"A+"}
    

};


  print(student);
  //Step 6: Using Map methods and collection operators



  print(student.keys);
  print(student.values);   



Map<String,Map<dynamic,dynamic>> Student_project={
    "Miel Mahmud Sifat":{"Roll":201,"Grade":"A+"},
        "Arif Billah RIfat":{"Roll":501,"Grade":"A"},

    "Ratul ":{"Roll":201,"Grade":"B+"},


};





}*/

/*
///Step 7: Planning the Student Info System mini project


main()
{
    List<Map<String,dynamic>> Student =[];

    void addStudent(String name,int roll,String grade)
    {
        Student.add({"name":name,"roll":roll,"grade":grade});
    }

    void display ()
{
    for(var students in Student)
    {
        print("Name:${students['name']}, Roll:${students['roll']}, Grade:${students['grade']}");
    }
}

void update_student(int roll,String name,String grade)
{
    for(var students in Student)
    {
        if(students['roll']==roll)
        {
            students['name']=name;
            students['grade']=grade;
           
        }
    }


}

void removeStudent(int roll) {
    Student.removeWhere((student) => student["roll"] == roll);
  } 


  addStudent("Miel", 20, "A+");
  addStudent("Arif", 240, "B+");
  addStudent("Ratul", 201, "A");    
addStudent("John", 202, "B");

  display();
  removeStudent(201);
  print("After removing student with roll 201:");
  display();

}

*/

/// 8: Implementing the Student Info System
void main() {
  List<Map<String, dynamic>> students = [
    {
      "name": "Sifat",
      "roll": 101,
      "grade": "A"
    },
    {
      "name": "Abhi",
      "roll": 102,
      "grade": "B"
    }
  ];

  students.add({
    "name": "Alok",
    "roll": 103,
    "grade": "A+"
  });


  for (int i = 0; i < students.length; i++) {
    print("Student ${i + 1}");
    print("Name  : ${students[i]["name"]}");
    print("Roll  : ${students[i]["roll"]}");
    print("Grade : ${students[i]["grade"]}");
   
  }
}







