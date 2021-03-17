
// Đối tượng
function Validator(options){

    var selectorRules = {};
    // Hàm thực hiện validate
    function validate(inputElement, rule){
        var errorElement = inputElement.parentElement.querySelector(options.errorSelector);
        var errMessage;
        // lấy ra các rules của selector
        var rules = selectorRules[rule.selector];


        // lặp qua từng rules 
        // nếu có lỗi thì dừng việc kiểm tra
        for(var i=0; i<rules.length; i++){
            errMessage = rules[i](inputElement.value);
            if(errMessage) break;
        }
        // console.log(rules);
        if(errMessage){
            errorElement.innerText = errMessage;
            inputElement.parentElement.classList.add('invalid');
        }
        else{
            errorElement.innerText = '';
            inputElement.parentElement.classList.remove('invalid');
        }
                    
    }
    var forElement  = document.querySelector(options.form);
    
    if(forElement){

//        forElement.onsubmit = function(e){
//            e.preventDefault();
//
//            // lặp qua từng rules và validate
//            options.rules.forEach(function (rule){
//                var inputElement = forElement.querySelector(rule.selector);
//                validate(inputElement,rule);
//            });
//        }
        // lặp qua mỗi rules và xử lý (lắng nghe sự kiên blur,input,...)
        options.rules.forEach(function (rule){
            var inputElement = forElement.querySelector(rule.selector);
            var errorElement = inputElement.parentElement.querySelector('.form-message');
            // lưu lại các rule cho mỗi input
            if(Array.isArray( selectorRules[rule.selector])){
                selectorRules[rule.selector].push(rule.test);
            }
            else{
                selectorRules[rule.selector] = [rule.test];
            }
            
            if(inputElement){
                // Xử lý trường hopwk blur khỏi input
                inputElement.onblur = function (){
                    validate(inputElement,rule);
                }
                // Xử lý mỗi khi người dùng nhập vào input
                inputElement.oninput = function(){
                    errorElement.innerText = '';
                    inputElement.parentElement.classList.remove('invalid');
                }   
            }
        });
//        console.log(selectorRules);
    }
}


// Định nghĩa Rules
Validator.isRequired = function (selector,message){
    return{
        selector: selector,
        test: function(value){
            return value.trim() ? undefined : 'Vui lòng nhập trường này'
        }
    }
}

Validator.isEmail = function(selector,message){
    return{
        selector: selector,
        test: function(value){
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : 'Trường này phải là email'; 
        }
    }
}

Validator.minLength = function(selector,min,message){
    return{
        selector: selector,
        test: function(value){
            return (value.length >= min) ? undefined : `Mật khẩu phải tối thiểu ${min} ký tự`; 
        }
    }
}

Validator.isConfirmed = function(selector, getConfirmValue, message){
    return{
        selector: selector,
        test: function (value) {
            return value === getConfirmValue() ? undefined : message ||'Giá trị nhập vào không chính xác';
        }
    }
}