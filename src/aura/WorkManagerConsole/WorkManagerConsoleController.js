({
    refresh : function(component, event, helper) {
        $A.get('e.force:refreshView').fire();
    },
    
    handleToastEvent : function(component, event, helper) {

        var toastMessageParams = event.getParams();
        //Traigo el contenido del texto del toast a una variable
        var message = toastMessageParams.message;
        console.log("Entro al handle del toast" + message) 
        //Verifico si el mensaje dice que se modifico con exito un record y de ser asi ejecuto un refresh del componente utilizando el evento refreshView
        if (message.includes('was saved')) {
            $A.get('e.force:refreshView').fire();
        }
    }

})