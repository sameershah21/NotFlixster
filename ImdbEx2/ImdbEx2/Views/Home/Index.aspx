﻿<%@ Import Namespace="ImdbEx2.Models" %>


<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<RootObject>" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    NOT Flixster
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style type="text/css">
table.JsonTable {
	border-width: 1px;
	border-spacing: 2px;
	border-style: outset;
	border-color: gray;
	border-collapse: separate;
	background-color: white;
}
table.JsonTable th {
	border-width: 1px;
	padding: 1px;
	border-style: inset;
	border-color: gray;
	background-color: white;
	-moz-border-radius: ;
}
table.JsonTable td {
	border-width: 1px;
	padding: 1px;
	border-style: inset;
	border-color: gray;
	background-color: white;
	-moz-border-radius: ;
}
</style>



    <script type="text/javascript">
        $(function () {
            //movie search
            $("#btnSearchMovie").click(function () {

                var movie = $("#txtMovieName").val();
                // basic validation to check null. Validation steps can be added further based on requirements.
                if ((movie == null) || (movie == "")) {
                    alert("Please enter a movie name to search");
                    return;
                }

                //make sure table is empty before new search begins
                $("#target_table").html("");
                //make sure error are disabled before new search begins
                $("#lblNoGo").html("");

                //TODO: encode the api key later if security is required
                var movieURL = "http://private-f5ef-themoviedb.apiary.io/3/search/movie?query=" + movie + "&api_key=82a4e8f609d88910ecebf92741a87f7b";
                var dataRecieved = false;


                //get deserialised data from api and then send it over to server for deserialization. Get the json back from the server and display it in a table form
                $.ajax({
                    url: movieURL,
                    type: 'GET',
                    dataType: 'json',
                    error: function (xhr, status, error) {
                        $("#lblNoGo").html("There was an error while trying to search");
                        return;
                    },
                    success: function process(json) {

                        var jsonfromImdb = JSON.stringify(json);


                        $.ajax({
                            type: 'POST',
                            url: "home/Search",
                            // pass the data as a json string
                            data: jsonfromImdb,

                            // tell the server that is indeed JSON that we're sending
                            contentType: "json",

                            // handle the request back from the server
                            success: function (data) {

                                if ((data == null) || (data == "")) {
                                    $("#lblNoGo").html("No records found with that name");
                                    return;
                                }
                                data = JSON.stringify(eval(data));


                                var jsondata = $.parseJSON(data);
                                //convert json to table
                                var tbl_body = "";
                                var tbl_head = "";
                                var tbl_row = "";
                                //quickly put the data in a table
                                $.each(jsondata, function () {
                                    $.each(this, function (k, v) {
                                        tbl_head += "<th>" + k + "</th>";
                                    })
                                    return false;
                                })

                                $.each(jsondata, function () {
                                    $.each(this, function (k, v) {
                                        tbl_row += "<td>" + v + "</td>";
                                    })
                                    tbl_body += "<tr>" + tbl_row + "</tr>";
                                    tbl_row = ""; //reset for next iteration.
                                })

                                tbl_body = "<tr>" + tbl_head + "</tr>" + tbl_body;

                                $("#target_table").html(tbl_body);

                            },

                            // this is to tell the handler for the 'success' piece
                            // that the content of the result is json
                            dataType: 'json'
                        });
                    }
                });
            });
        });


    </script>





   <div>
        <h3>Please enter a movie name</h3>
        <p>
            <input type="text" id="txtMovieName" />
            <input type="submit" value="Search" id="btnSearchMovie" />
        </p>

        <table id="target_table" class="JsonTable"></table>
        <label id="lblNoGo" ></label>

    </div>



</asp:Content>

