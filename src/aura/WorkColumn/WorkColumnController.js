({
    doInit: function(component, event, helper){

        //obtain the status and the contact id from the view
        var workStatus = component.get("v.workType");
        var contactId = component.get("v.contactId");

        var aux = null;
        //Verify the status type
            if(workStatus==="New"){
                //Verify if the contact id is null or not to determine if i am in a ontact record view

                //If not, i get all the works
                if(contactId===null){
                    aux = component.get("c.getWorksNew");

                    //if true, i get the works just for the particular contact id
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":contactId,
                        "workStatus":workStatus
                    });
                }
                
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(workStatus ==='Ready'){
                if(contactId===null){
                    aux = component.get("c.getWorksReady");
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":contactId,
                        "workStatus":workStatus
                    });
                }
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(workStatus ==='InProgress'){
                if(contactId===null){
                    aux = component.get("c.getWorksInProgress");
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":contactId,
                        "workStatus":workStatus
                    });
                }
                aux.setCallback(this, function(res){
                    var works = res.getReturnValue();
                    component.set("v.workList",works);
                });
                $A.enqueueAction(aux);
            }
            if(workStatus ==='Done'){
                if(contactId===null){
                    aux = component.get("c.getWorksDone");
                }else{
                    aux = component.get("c.getWorksForContact");
                    aux.setParams({
                        "id":contactId,
                        "workStatus":workStatus
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