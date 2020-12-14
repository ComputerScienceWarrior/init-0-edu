document.addEventListener('turbolinks:load', ()=>{
    const student = document.querySelector('#student-1');
    student.addEventListener('mouseover', function(){
        console.log("hello")
    })
})