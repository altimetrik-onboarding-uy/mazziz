({
    refresh : function(component, event, helper) {
        $A.get('e.force:refreshView').fire();
    },
    
    handleToastEvent : function(component, event, helper) {
        var toastMessageParams = event.getParams();
        //I bring the text content of the toast to a variable
        var message = toastMessageParams.message;
        //Verify if the message says that a record was successfully modified and, if so, execute a refresh of the component using the refreshView event
        if (message.includes('was saved')) {
            $A.get('e.force:refreshView').fire();
        }
    }

})