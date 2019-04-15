({
    //In the "doInit" from each card, load the type of icon depending on the helper's answer
    doInit: function(component, event, helper){
        var icon = helper.generateIconPath(component, event, helper);
        component.set('v.icon', icon);


    },
    //The "edit" method is called from the href in the title and then use the editRecord to open the edit window.
    edit : function(component, event, helper) {

        //I create a new default event of type editRecord
        var editRecordEvent = $A.get("e.force:editRecord");
        //I set the parameters of the event that I am going to shoot, in this case the id of the work
        editRecordEvent.setParams({
            "recordId": component.get("v.recordId")
        });
        //fire the event
        editRecordEvent.fire();
    }
})