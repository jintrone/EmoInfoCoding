
<g:each in="${hits}" var="hit">
    <tr>
        <td>
            <input type="checkbox" name="${hit.getHITId()}" value="${hit.getHITId()}"/>
        </td>
        <td>
            ${hit.getTitle()}
        </td>
        <td>
          ${hit.getMaxAssignments()}
        </td>
        <td>
            ${hit.getNumberOfAssignmentsCompleted()}
        </td>
        <td>
            ${hit.getExpiration().getTime().toString()}

        </td>
        <td>
            ${hit.getHITStatus()}
        </td>
    </tr>
</g:each>
