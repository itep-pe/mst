<%-- 
    Document   : index
    Created on : 24/02/2015, 15:02:31
    Author     : jefferson.lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title id='Description'>Auto-complete feature of jqxComboBox. Suggestions are displayed when at least two characters are entered into the field.</title>
        <link rel="stylesheet" href="./css/jqx.base.css" type="text/css" />
        <script type="text/javascript" src="./js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="./js/jqxcore.js"></script>
        <script type="text/javascript" src="./js/jqxdata.js"></script> 
        <script type="text/javascript" src="./js/jqxbuttons.js"></script>
        <script type="text/javascript" src="./js/jqxscrollbar.js"></script>
        <script type="text/javascript" src="./js/jqxlistbox.js"></script>
        <script type="text/javascript" src="./js/jqxcombobox.js"></script>
        <script type="text/javascript" src="./js/demos.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                // prepare the data
                var source =
                        {
                            datatype: "jsonp",
                            datafields: [
                                {name: 'countryName'},
                                {name: 'name'},
                                {name: 'population', type: 'float'},
                                {name: 'continentCode'},
                                {name: 'adminName1'}
                            ],
                            url: "http://api.geonames.org/searchJSON",
                            data: {
                                featureClass: "P",
                                style: "full",
                                maxRows: 12,
                                username: "jqwidgets"
                            }
                        };

                var dataAdapter = new $.jqx.dataAdapter(source,
                        {
                            formatData: function (data) {
                                if ($("#jqxcombobox").jqxComboBox('searchString') != undefined) {
                                    data.name_startsWith = $("#jqxcombobox").jqxComboBox('searchString');
                                    return data;
                                }
                            }
                        }
                );

                $("#jqxcombobox").jqxComboBox(
                        {
                            width: 250,
                            height: 25,
                            source: dataAdapter,
                            remoteAutoComplete: true,
                            autoDropDownHeight: true,
                            selectedIndex: 0,
                            displayMember: "name",
                            valueMember: "countryName",
                            renderer: function (index, label, value) {
                                var item = dataAdapter.records[index];
                                if (item != null) {
                                    var label = item.name + "(" + item.countryName + ", " + item.adminName1 + ")";
                                    return label;
                                }
                                return "";
                            },
                            renderSelectedItem: function (index, item)
                            {
                                var item = dataAdapter.records[index];
                                if (item != null) {
                                    var label = item.name;
                                    return label;
                                }
                                return "";
                            },
                            search: function (searchString) {
                                dataAdapter.dataBind();
                            }
                        });
            });
        </script>
    </head>
    <body class='default'>
        <div id='jqxWidget' style="font-size: 13px; font-family: Verdana; float: left;">
            <span>Procure a cidade:</span>
            <div style="margin-top: 7px; margin-bottom: 5px;" id="jqxcombobox"></div>
            <span>ex: Rec</span>
        </div>
    </body>
</html>