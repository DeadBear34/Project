<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/error404.css">
</head>
<body>
    <div id="clouds">
        <div class="cloud x1"></div>
        <div class="cloud x1_5"></div>
        <div class="cloud x2"></div>
        <div class="cloud x3"></div>
        <div class="cloud x4"></div>
        <div class="cloud x5"></div>
    </div>
    <div class='c'>
        <div class='_404'>
            <%= request.getAttribute("javax.servlet.error.status_code") %>
        </div>
        <hr>
        <div class='_1'>
            THE PAGE
        </div>
        <div class='_2'>
            <%
                Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
                if (statusCode != null) {
                    switch (statusCode) {
                        case 400:
                            out.print("BAD REQUEST");
                            break;
                        case 401:
                            out.print("UNAUTHORIZED");
                            break;
                        case 403:
                            out.print("FORBIDDEN");
                            break;
                        case 404:
                            out.print("NOT FOUND");
                            break;
                        case 500:
                            out.print("INTERNAL SERVER ERROR");
                            break;
                        case 502:
                            out.print("BAD GATEWAY");
                            break;
                        case 503:
                            out.print("SERVICE UNAVAILABLE");
                            break;
                        case 504:
                            out.print("GATEWAY TIMEOUT");
                            break;
                        default:
                            out.print("UNKNOWN ERROR");
                    }
                } else {
                    out.print("UNKNOWN ERROR");
                }
            %>
        </div>
        <a class='btn' href="javascript:history.back()">BACK</a>
    </div>
</body>
</html>
