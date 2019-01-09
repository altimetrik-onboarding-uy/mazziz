({
    //En el do init de cada card cargo el tipo de icono dependiendo de lo devuelva el helper
    doInit: function(component, event, helper){
        var icon = helper.generateIconPath(component, event, helper);
        component.set('v.icon', icon);


    },
    //El edit es llamado desde el href en el titulo y utilizo el editRecord para abrir la ventana de edicion
    edit : function(component, event, helper) {

        //Creo un nuevo evento por defecto del tipo editRecord
        var editRecordEvent = $A.get("e.force:editRecord");
        //Seteo los parametros del evento que voy a disparar, en este caso el id del work
        editRecordEvent.setParams({
            "recordId": component.get("v.recordId")
        });
        //Disparo el evento
        editRecordEvent.fire();

    },
    //Funcion utiliza el toast event para identificar cuando se modifica con exito un record
    handleToastEvent : function(component, event, helper) {

    var toastMessageParams = event.getParams();
    //Traigo el contenido del texto del toast a una variable
    var message = toastMessageParams.message;
    //Verifico si el mensaje dice que se modifico con exito un record y de ser asi ejecuto un refresh del componente utilizando el evento refreshView
    if (message.includes('was saved')) {
        $A.get('e.force:refreshView').fire();
    }

}
})