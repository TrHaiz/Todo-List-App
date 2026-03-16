
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<String>l=[];
  TextEditingController textEdit=TextEditingController();

     void showAdd(BuildContext context)
  {
    showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text("Thêm công việc", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          content: TextField(
            style: TextStyle(color: Colors.white),
            controller: textEdit,
            decoration: const InputDecoration(
              hintText: "Nhập tên công việc",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);}, 
              child: Text("Huỷ", style: TextStyle(
              color: Colors.white
            ))),

            TextButton(onPressed: (){
              String input="";
              input=textEdit.text;
              if (input.isNotEmpty)
              {
                 setState(() {
                l.add(input);
              });
              }
             saveTask();
            textEdit.clear();
              Navigator.pop(context);
            },

             child: Text("Nhập", style: TextStyle(color: Colors.white)))
          ],
        );
    }
    );
  }

  void showTask(String t, int index)
  {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(child: Text(t, style: TextStyle(color: Colors.white, fontWeight: .bold))),
          content: Row(
           mainAxisAlignment: .spaceEvenly,
            children: [
              Text("Trạng thái:", style: TextStyle(color: Colors.white, fontWeight: .bold)),
      Text("Đang thực hiện", style: TextStyle(color: Colors.white, ),),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){ Navigator.pop(context); }, 
              child: Text("Thoát", style: TextStyle(color: Colors.white, fontWeight: .bold),)
              ),
            TextButton(
              onPressed: (){
                setState(() {
                  l.removeAt(index);
                });
                saveTask();
                Navigator.pop(context);
              },
              child: Text("Hoàn thành", style: TextStyle(color: Colors.white, fontWeight: .bold),)
              )
          ],
          );
          }
      );
  }

  void showFind()
  {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text("Tìm kiếm công việc", style: TextStyle(color: Colors.white, fontWeight: .bold),),
        content: TextField(
          style: TextStyle(color: Colors.white),
          controller: textEdit,
          decoration: InputDecoration(
            hintText: "Nhập công việc cần tìm",
            hintStyle: TextStyle(color: Colors.white)
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){Navigator.pop(context);},
           child: Text("Huỷ", style: TextStyle(color: Colors.white),)),
           TextButton(
            onPressed: (){
              String x=textEdit.text;
              if (x.isNotEmpty)
              {
                if (l.contains(x)) 
                {
                  Navigator.pop(context);
              showTask(x, l.indexOf(x));

                }
                else {
                  Navigator.pop(context);
                  showDialog(context: context, builder: (BuildContext context){
                    return   AlertDialog(
                    backgroundColor: Colors.black,
                    title: Text("Không tìm thấy", style: TextStyle(color: Colors.white),),
                    actions: [
                      TextButton(
                        onPressed: (){Navigator.pop(context);}, 
                        child: Text("OK", style: TextStyle(color: Colors.white),) 
                        )
                    ],
                    );
                  });
                }
              }
              textEdit.clear();
            }, 
            child: Text("Tìm kiếm", style: TextStyle(color: Colors.white),))
        ],
      );
      }
    );
  }
  

  Future<void>loadTask() async {
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      final data=prefs.getStringList('task') ?? <String>[];
      l=data.map((item)=>item.toString()).toList();
    });
  }

Future<void>saveTask() async {
    final prefs=await SharedPreferences.getInstance();
    prefs.setStringList('task', l);
}

  @override

void initState()
{
  super.initState();
  loadTask();
}

@override 

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(borderRadius: .circular(10), color: Colors.black87),
           child: IconButton(onPressed: (){showAdd(context);}, icon: Icon(Icons.add), color: Colors.white,),
          ),
          
      appBar:  AppBar(
        centerTitle: true,
       backgroundColor: Colors.black87,
        title: 
            (Text("Todo App",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
                  ),
        actions: [
          IconButton(onPressed: (){(showFind());}, 
          icon: Icon(Icons.search, size: 35, color: Colors.white,)),
          SizedBox(width: 10,),
        ],
      ),
          body: l.isEmpty ? Center(child: Text("Vui lòng thêm công việc", style: TextStyle(fontSize: 20, fontWeight: .bold)),) :
                ListView.builder(
                itemCount: l.length,
                itemBuilder: (BuildContext context, int index)
                {
                  String cur=l[index];
                  return ListTile(
                    leading: Icon(Icons.circle, color: Colors.greenAccent,),
                    title: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                      onPressed: (){showTask(cur, index);}, 
                      child:Text(
                          cur, 
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: Colors.white),
                              ) 
                      ),
                    
                  );
                }
              ),
            );
  }
}