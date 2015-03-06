<%-- 
    Document   : newjsp
    Created on : 25/02/2015, 11:13:43
    Author     : jefferson.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title id='Description'>In this demo is illustrated how to display checkboxes next to the ComboBox items. The combobox's input field in this mode is readonly.</title>
            <link rel="stylesheet" href="./css/jqx.base.css" type="text/css" />
            <script type="text/javascript" src="./js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript" src="./js/demos.js"></script>
            <script type="text/javascript" src="./js/jqxcore.js"></script>
            <script type="text/javascript" src="./js/jqxdata.js"></script>
            <script type="text/javascript" src="./js/jqxbuttons.js"></script>
            <script type="text/javascript" src="./js/jqxscrollbar.js"></script>
            <script type="text/javascript" src="./js/jqxlistbox.js"></script>
            <script type="text/javascript" src="./js/jqxcombobox.js"></script>
            <script type="text/javascript" src="./js/jqxcheckbox.js"></script>
        </head>
        <body>
            <div id='content'>
                <script type="text/javascript">
                    $(document).ready(function () {
                        var url = "../sampledata/customers.txt";
                        // prepare the data
                        var source =
                                {
                                    datatype: "json",
                                    datafields: [
                                        {name: 'CompanyName'},
                                        {name: 'ContactName'}
                                    ],
                                    id: 'id',
                                    url: url,
                                    async: false
                                };
                        var dataAdapter = new $.jqx.dataAdapter(source);
                        // Create a jqxComboBox
                        $("#jqxWidget").jqxComboBox({checkboxes: true, source: dataAdapter, displayMember: "ContactName", valueMember: "CompanyName", width: 200, height: 25});
                        $("#jqxWidget").jqxComboBox('checkIndex', 0);
                        // subscribe to the checkChange event.
                        $("#jqxWidget").on('checkChange', function (event) {
                            if (event.args) {
                                var item = event.args.item;
                                if (item) {
                                    var valueelement = $("<div></div>");
                                    valueelement.text("Value: " + item.value);
                                    var labelelement = $("<div></div>");
                                    labelelement.text("Label: " + item.label);
                                    var checkedelement = $("<div></div>");
                                    checkedelement.text("Checked: " + item.checked);
                                    $("#selectionlog").children().remove();
                                    $("#selectionlog").append(labelelement);
                                    $("#selectionlog").append(valueelement);
                                    $("#selectionlog").append(checkedelement);
                                    var items = $("#jqxWidget").jqxComboBox('getCheckedItems');
                                    var checkedItems = "";
                                    $.each(items, function (index) {
                                        checkedItems += this.label + ", ";
                                    });
                                    $("#checkedItemsLog").text(checkedItems);
                                }
                            }
                        });
                    });
                </script>
                <div>
                    <div style='float: left;' id='jqxWidget'>
                    </div>
                    <div style="float: left; margin-left: 20px; font-size: 13px; font-family: Verdana;">
                        <div id="selectionlog"></div>
                        <div style='max-width: 300px; margin-top: 20px;' id="checkedItemsLog"></div>
                    </div>

                </div>
            </div>
        </body>
    </html>
</html>
