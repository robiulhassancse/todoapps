import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {

  TextEditingController _titleTEController = TextEditingController();
  TextEditingController _descriptionTEController = TextEditingController();

  List<todos> todolist = [];

  String item ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEFF5),
        leading: const Icon(Icons.menu),
        title:  Text('Todos app'.toUpperCase(),style: const TextStyle(
          color: Colors.grey,
        ),),
        actions: [
          IconButton(onPressed: (){
            todolist.clear();
            if(mounted){
              setState(() {
              });
            }
          }, icon: const Icon(Icons.playlist_remove,size: 30,),),
        ],
      ),
      body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context, index) {
      return ListTile(
        onLongPress: (){
          todolist[index].isDone = !todolist[index].isDone;
          if(mounted){
            setState(() {

            });
          }
        },
        leading: todolist[index].isDone ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank_outlined),
        title: Text(todolist[index].title),
        subtitle: Text(todolist[index].description),
        trailing: SizedBox(
          width: 100,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[

                Expanded(
                  child: IconButton(icon: const Icon(Icons.edit,size: 20,color: Colors.white,), onPressed: () {
                    showDialog(context: context, builder: (context)=>SimpleDialog(
                      title: const Text('Updates message'),
                      children: [
                        TextField(
                          onChanged: (value){
                            item = value;
                            setState(() {

                            });

                          },
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: const Text('cancle'),),
                                const SizedBox(width: 20,),
                                ElevatedButton(onPressed: (){
                                  // todolist[index] = item;
                                  if(mounted){
                                    setState(() {

                                    });
                                  }
                                }, child: const Text('updates'),),
                              ],

                            ),
                          ),
                        )

                      ],
                  ),);
                  if(mounted){
                    setState(() {

                    });
                  }

              },),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(icon: const Icon(Icons.delete_forever,size: 20,color: Colors.white,), onPressed: () {
                      todolist.removeAt(index);
                      if(mounted){
                        setState(() {

                        });
                      }

                    },),
                  ),
                ),
          ],
            ),
          ),
        ),

      );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // todolist.add(todos('title', 'description', false));

          showModalBottomSheet(
              isDismissible: false,
              context: context, builder: (context){
            return  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add Todo New Item',style: TextStyle(fontSize: 20),),
                        IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.clear),),
                      ],
                    ),
                     const SizedBox(height: 10,),
                     TextField(
                      controller: _titleTEController,
                      decoration: const InputDecoration(
                        hintText: 'Write your title',
                        border: OutlineInputBorder(),
                        label: Text('Title'),
                      ),
                    ),
                    const SizedBox(height: 20,),
                     TextField(
                       controller: _descriptionTEController,
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Write your description',
                        label: Text('Description',),
                        border: OutlineInputBorder(
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: (){
                              if(_titleTEController.text.trim().isNotEmpty && _descriptionTEController.text.trim().isNotEmpty) {
                                todolist.add(todos(
                                    _titleTEController.text.trim(),
                                    _descriptionTEController.text.trim(),
                                    false));
                                if (mounted) {
                                  setState(() {

                                  });
                                }
                                _titleTEController.clear();
                                _descriptionTEController.clear();
                                Navigator.pop(context);
                              }
                            }, child: const Text('ADD',),style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          minimumSize:const Size(double.infinity, 40),
                        )),
                        const SizedBox(height: 10,),
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                              color: Colors.red,
                             ),
                            child: IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: const Icon(Icons.clear,color: Colors.white,),)),
                      ],
                    ),
                    const SizedBox(width: 20,)


                  ],
                ),
              ),
            );
          });


          if(mounted){
            setState(() {

            });
          }
        }, child: const Icon(Icons.add),
      ),
    );
  }
}

class todos {
  String title, description;
  bool isDone;

  todos(this.title, this.description, this.isDone);
}
