//function is returned

void main(){
  var res=display("Sanjay");
  res();
}
Function display(String str){
  void InnerFun(){
    print(str);
  };
  return InnerFun;
}
