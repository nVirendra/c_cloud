$(function() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    

    $('#studentMarksdetails').DataTable();
   
    $('#studentServersideMarksdetails').DataTable({
        processing: true,
        serverSide: true,
        ajax: "/serverList",
        columns: [{
                data: 'student_name'
            },
            {
                data: 'roll_no'
            },
            {
                data: 'sub_marks'
            },
            
        ]
    });
    $('#totalScoreSimple').DataTable();
    

    $("#roll_no").keyup(function(){
        var rollNumber = $(this).val().trim();
        if(rollNumber != ''){
           $.ajax({
             type: "POST",
             url: "check-roll-number",
              data: {rollNumber: rollNumber},
              dataType:'json',
              success: function(data){
                  $('#rollno_response').html(data);
  
               }
           });
        }else{
           $("#rollno_response").html("");
        }
      });


    $('#sclass').on('change', function(){
        var classId = $(this).val();
        if(classId){
            $.ajax({
                type: "POST",
                url: "getsubjecs",
                data:'class_Id='+classId,
                dataType:'json',
                beforeSend: function(){
            
                },
                success:function(data){
                    if(data.status == true){
                        $('#subjectDiv').html(data.html);
                    }
                    
                }
            }); 
        }else{
            $('#subjectDiv').html('<option value="" style="color:red; margin-bottom:5px;">Select class first</option>'); 
        }
    });


    saveSubjectMarks = function(){
            var formValid = true;
            var name = $('#sname').val();
            var rol_no = $('#roll_no').val();

            var files = $('#file')[0].files;
        
            var cls_id = $('#sclass').val();
            var formData = new FormData();
            
            var subjecMark = [];
            $('.getsubData').each(function(key,value){
                if($(this).attr('type') == 'text'){
                    subjecMark.push({'sub_id':$(this).data('subid'),'mark':$(this).val()});
                }
            });


            formData.append('name', name);
            formData.append('roll_no', rol_no);
            formData.append('file', files[0]);
            formData.append('cls_id', cls_id);
            formData.append('subjecMark', JSON.stringify(subjecMark));
  
            if(formValid){
                    $.ajax({
                        type:'POST',
                        url: "save-marks",
                        data:formData,
                        dataType:'json',
                        beforeSend:function(){
                        },
                        success:function(data){
                            if(data.status == true){
                                $('#saveMarksDetails').trigger("reset");
                                alert(data.msg);
                                window.location.href = '/';
                                
                            }else{
                                alert(data.msg);
                            }
                        },
                        error:function(data) {
                            $('#nameError').text(data.responseJSON.errors.name);
                            $('#rolNoError').text(data.responseJSON.errors.rol_no);
                            $('#photoError').text(data.responseJSON.errors.file);
                            $('#classError').text(data.responseJSON.errors.cls_id);
                          },
                        cache:false,
                        contentType:false,
                        processData:false
                    });
            }
}


$('#class_filter_drop').on('change', function(){
    var c_id = $(this).val();
    if(c_id){
        $.ajax({
            type: "GET",
            url: "/?c_id="+c_id,
            dataType:'json',
            beforeSend: function(){
        
            },
            success:function(data){
                if(data.status == true){
                   
                }
                
            }
        }); 
    }else{
        
    }
});


});