document.addEventListener('turbolinks:load', ()=>{
    const create_student_btn = document.querySelector('#create_student');
    create_student_btn.addEventListener('mouseover', function(){
        create_student_btn.style.color = "green"
        create_student_btn.style.width = "270px"
        create_student_btn.style.height = "20px"
    })
    create_student_btn.addEventListener('mouseout', function(){
        create_student_btn.style.color = "black"
        create_student_btn.style.width = "300px"
        create_student_btn.style.height = "25px"
        create_student_btn.style.fontWeight = "none"
    })
})

