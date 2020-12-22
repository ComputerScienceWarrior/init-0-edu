document.addEventListener('turbolinks:load', ()=>{
    const button = document.querySelector('#view-comment-btn');
    const courseCommentLink = document.querySelector('#course-comments-link')
        button.addEventListener('click', function(){
            var optVal = document.querySelector('#comment_course_id').value
            var href = `/admin/courses/${optVal}/comments`
            courseCommentLink.href = href
            courseCommentLink.innerHTML = "View Comments"
            
        })
})

