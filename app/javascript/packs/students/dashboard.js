document.addEventListener('turbolinks:load', ()=>{

    const studentUsername = document.querySelector('#student_username');
    const studentPassword = document.querySelector('#student_password');
    const studentPasswordConf = document.querySelector('#student_password_confirmation');
    const studentEmail = document.querySelector('#student_email');
    const spaces = document.querySelector('#spaces_label')
    // name="student[username]"

    const formData = {};
    for(let input of [studentUsername]){
        input.addEventListener('input', ({target}) => {
            const {name, value} = target;
            formData[name] = value;
            if (formData[name].includes(' ')){
                spaces.style.visibility = 'visible';
                console.log("No spaces allowed!")
            }else{
                spaces.style.visibility = 'hidden'
            }
        });
    }

    for(let input of [studentPassword, studentPasswordConf]){
        input.addEventListener('input', ({target}) => {
            const {name, value} = target;
            formData[name] = value;
            if (formData[name].includes(' ')){
                spaces.style.visibility = 'visible';
                console.log("No spaces allowed!")
            }else{
                spaces.style.visibility = 'hidden'
            }
        });
    }
})

