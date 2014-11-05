package com.revizor

import grails.util.GrailsNameUtils

/**
 * One separate review by one or few commits
 */
class Review implements INotifiable {

    String title
    // SHA-1 of the reviewed commits
    String[] commits = []
    String description
    ReviewStatus status

    static belongsTo = [
            repository: Repository,
            author: User
    ]

    static hasMany = [
            reviewers: Reviewer,
            comments: Comment
    ]

    static constraints = {
        title(nullable: false)
        repository(nullable: false)
        author(nullable: false)
        reviewers(nullable: true)
    }

    def findReviewerByUser(user) {
        return reviewers?.find{
            it.reviewer.id == user.id
        }
    }
	
	/**
	 * {@inheritDoc}
	 */
	public String getDetailsAsHtml() {
		return null;
	}
	
	/**
	 * {@inheritDoc}
	 */
	public String getNotificationName() {
		return "${this.id}: ${this.title}";
	}
}

enum ReviewStatus {
    OPEN("review.status.open"),
    CLOSED("review.status.closed")

    ReviewStatus(String value) { this.value = value }

    private final String value
    public String value() { return value }
}