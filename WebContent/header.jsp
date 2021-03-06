<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header role="banner">
    <img alt="Books" src="images/books.jpg">
    <h1><span>Library</span></h1>
    <nav>
        <ul>
            <c:choose>
                <c:when test="${param.title=='Home'}">
                    <li id="actual"><a href="Controller">Home</a></li>
                    <li><a href="Controller?action=StatusPage">Status</a></li>
                    <li><a href="Controller?action=ChatPage">Chat</a></li>
                    <li><a href="Controller?action=RegistrationPage">Registration</a></li>
                    <li><a href="Controller?action=WkResultaatPage">WK resultaat</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="Controller">Home</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
    <h2>
        ${param.title}
    </h2>
</header>