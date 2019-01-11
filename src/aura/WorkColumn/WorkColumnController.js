({
    doInit: function(component, event, helper){

        var estado = component.get("v.workType");
        var work = component.get("v.contactId");
        console.log(work)

        var aux = null;
            if(estado==="New"){
                if(work===null){
                    aux = component.get("c.getWorksNew");
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":work,
                        "estado":estado
                    });
                }
                
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(estado ==='Ready'){
                if(work===null){
                    aux = component.get("c.getWorksReady");
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":work,
                        "estado":estado
                    });
                }
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(estado ==='InProgress'){
                if(work===null){
                    aux = component.get("c.getWorksInProgress");
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":work,
                        "estado":estado
                    });
                }
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(estado ==='Done'){
                if(work===null){
                    aux = component.get("c.getWorksDone");
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":work,
                        "estado":estado
                    });
                }
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                
                $A.enqueueAction(aux);
            }
    

    component.set("v.workLists",aux);

},


})