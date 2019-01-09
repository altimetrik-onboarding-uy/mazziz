({
    //Genero un string con el path que sera ubicado en el atributo icon de un componente, el cual dependera del Tipo que este tenga seteado
    generateIconPath : function (component,event,helper){
        //Obtengo el tipo
        var work = component.get("v.work");
        //Dependiendo del mismo retorno un string con el path a un icono
        switch(work.Type__c) {
            case "Idea":
            return "http://www.wvsadd.org/images/Icon3.png";

            case "Action":
            return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWiiBw1ueZKgP9mI_whOQ6_sqHb61sDdkZZwSk7KsAg2eUIgE2";

            case "Fix":
            return "https://cdn0.iconfinder.com/data/icons/business-seo-vol-2-1/512/SEO_Optimization_Gear_Repair_Tools_Fix_Support-512.png";

          }
    }
})