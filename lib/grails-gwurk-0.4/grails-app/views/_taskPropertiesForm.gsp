
<div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}controller" class="col-sm-2 control-label">Controller</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}controller"
                     value="${fieldValue(bean: props, field: 'controller')}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}action" class="col-sm-2 control-label">Action</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}action"
                     value="${fieldValue(bean: props, field: 'action')}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}rewardAmount" class="col-sm-2 control-label">Reward</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}rewardAmount"
                     value="${props?.rewardAmount ? fieldValue(bean: props, field: 'rewardAmount') : ""}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}relaunchInterval" class="col-sm-2 control-label">Relaunch Interval (semi-functional)</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}relaunchInterval"
                     value="${props?.relaunchInterval ? fieldValue(bean: props, field: 'relaunchInterval') : ""}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}assignmentDuration" class="col-sm-2 control-label">Assignment Duration</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}assignmentDuration"
                     value="${props?.assignmentDuration ? fieldValue(bean: props, field: 'assignmentDuration') : ""}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}autoApprove" class="col-sm-2 control-label">AutoApprove</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}autoApprove"
                     value="${props?.autoApprove ? fieldValue(bean: props, field: 'autoApprove') : ""}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}lifetime" class="col-sm-2 control-label">Lifetime</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}lifetime"
                     value="${props?.lifetime ? fieldValue(bean: props, field: 'lifetime') : ""}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}keywords" class="col-sm-2 control-label">Keywords</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}keywords"
                     value="${fieldValue(bean: props, field: 'keywords')}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}maxAssignments" class="col-sm-2 control-label">Max Assignments</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}maxAssignments"
                     value="${props?.maxAssignments ? fieldValue(bean: props, field: 'maxAssignments') : ""}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}title" class="col-sm-2 control-label">Title</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}title"
                     value="${fieldValue(bean: props, field: 'title')}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}description" class="col-sm-2 control-label">Description</label>
    <div class="col-sm-10">
        <g:textField class="form-control" name="${prefix ? "props.${prefix}." : ''}description"
                     value="${fieldValue(bean: props, field: 'description')}"/>
    </div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}height" class="col-sm-2 control-label">Height</label>
    <div class="col-sm-10">
        <g:textField name="${prefix ? "props.${prefix}." : ''}height"
                     value="${props?.height ? fieldValue(bean: props, field: 'height') : ""}"/>
</div>
</div><div class="form-group">
    <label for="${prefix ? "props.${prefix}." : ''}requireApproval" class="col-sm-2 control-label">Require Approval</label>
    <div class="col-sm-10">
        <g:textField name="${prefix ? "props.${prefix}." : ''}requireApproval"
                     value="${props?.requireApproval ? fieldValue(bean: props, field: 'requireApproval') : ""}"/>
    </div>
</div>



