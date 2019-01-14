({
    //I generate a String with the path that will be located in the icon attribute of a component, which will depend on the type it has set
    generateIconPath : function (component,event,helper){
        //Obtain the type
        var work = component.get("v.work");
        //Depending on the type, return a string with the path to an icon
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