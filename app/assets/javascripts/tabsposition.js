
alert("xyz");
$(function() {alert("hrishita");
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();
    });
    $(function() {

        $( "#tabs" ).tabs({
            collapsible: true
        });
    });
$(function() { 
        //var tabs = $( "#tabs" ).tabs();
        // close icon: removing the tab on click
        $( "#tabs span.ui-icon-close" ).live( "click", function() { 
            var panelId = $( this ).closest( "li" ).remove().attr( "aria-controls" );
            $( "#" + panelId ).remove();
           // tabs.tabs( "refresh" );
        });     
    });