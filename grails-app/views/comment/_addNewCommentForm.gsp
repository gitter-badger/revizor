<%@ page import="com.revizor.CommentType" %>

<%-- 
	The form to add new comment
--%>
<div class="form-group" style="width: 800px;">

	<g:if test="${commentType == CommentType.LINE_OF_CODE.name()}">
		<h2><g:message code="review.comments.form.line.code" default="Your comment to this line of code" /></h2>
	</g:if>
	<g:else>
		<h2><g:message code="review.comments.form.title" default="Your comment to this review" /></h2>
	</g:else>

	<textarea name="text" class="form-control" rows="3"></textarea>
</div>

<div class="form-group" style="width: 800px;">
	
	<g:if test="${commentType == CommentType.LINE_OF_CODE.name()}">
		<g:hiddenField name="commit" value="${commit}"/>
		<g:hiddenField name="fileName" value="${fileName}"/>
	</g:if>

	<g:hiddenField name="redirectTo" value="review/${reviewId}"/>
	<g:hiddenField name="author.id" value="${session.user.id}"/>
	<g:hiddenField name="review.id" value="${reviewId}"/>
	<g:hiddenField name="type" value="${commentType}"/>
	<button type="button" name="submit-comment-review-btn" class="btn btn-default" onclick="createNewComment();">${message(code: 'review.comments.post', default: 'Post the comment')}</button>
</div>