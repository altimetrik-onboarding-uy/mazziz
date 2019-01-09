({
    doInit: function(component, event, helper){

        var estado = component.get("v.workType");
        
        var aux = null;
            if(estado==="New"){
                aux = component.get("c.getWorksNew");
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(estado ==='Ready'){
                aux = component.get("c.getWorksReady");
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(estado ==='InProgress'){
                aux = component.get("c.getWorksInProgress");
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(estado ==='Done'){
                aux = component.get("c.getWorksDone");
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
    

    component.set("v.workLists",aux);

},

})