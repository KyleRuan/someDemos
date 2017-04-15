
var jsGlobleVar = "JS Demo";
function min(a,b){
    return a-b;
};

function callback (){
    // 这里打印的东西可以在 safari浏览器上的开发选项中打开
console.log("method----");

};

function setObj(obj) {
    this.obj = obj;
    obj.intV = 12 ;
    obj.jsValue = callback;
    
    model.minuseBC(100,2,3)
    model.intV = 14;
    return obj
};

function useOCObject(){
    model.minuseBC(100,12,12);
    model.intV = 14;
};
function useOCClass(){
    Model.intV = 100;
    var m =  Model.createWithIntV(12);
    console.log(m);
    m.minuseBC(10,1,1);
    return
}

function jsFunc(){
    Obj.jsValue = callback // 直接对变量赋值
    return callback;  //将function 以callback的形式返回
}



function ClickHandler(button, callback) {
    this.button = button;
    this.button.onClickHandler = this; // this stand the ClickHander
    this.handleEvent = callback;
};
