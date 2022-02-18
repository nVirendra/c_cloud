@extends('layouts.master')
@push('style')
<script>
function previewFile(input) {
    var file = $("input[type=file]").get(0).files[0];

    if (file) {
        var reader = new FileReader();

        reader.onload = function() {
            $("#previewImg").attr("src", reader.result);
        }

        reader.readAsDataURL(file);
    }
}
</script>
@endpush
@section('title')
{{"Home"}}
@endsection
@section('content')
<div class="card mt-2">
    <div class="card-body">
        <h3 class="card-title text-center mb-4">Student Marksheet</h3>
        @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif
        <form id="saveMarksDetails">
            @csrf
            <h4 class="text-warning">Student Information<h4>
                    <div class="row">
                        <div class="col-sm-8">

                            <div class="form-group">

                                <label>Student Name<span style='color: red;'>*</span></label>
                                <input type="text" class="form-control" id="sname" name="sname">
                                <span class="text-danger" id="nameError"></span>

                            </div>
                            <div class="form-group">

                                <label>Roll No<span style='color: red;'>*</span></label>
                                <input type="text" class="form-control" id="roll_no" name="roll_no">
                                <span class="text-danger" id="rolNoError"></span>
                                <span id="rollno_response"></span>
                            </div>
                            <div class="form-group">
                                <input type="file" name="file" id="file" onchange="previewFile(this);">
                                <span class="text-danger" id="photoError"></span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <img src="{{asset('images/default_photo.jpg')}}" id="previewImg" width="152" height="145">
                        </div>
                    </div>

                    <h4 class="text-warning">Marks Details<h4>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Select<span style='color: red;'>*</span></label>
                                    <select id="sclass" class="form-control" name="sclass">
                                        <option value="" selected>Select Class</option>
                                        @isset($educations)
                                        @foreach($educations as $key=>$edu)
                                        <option value="{{$edu->id}}">{{$edu->class_name}}</option>
                                        @endforeach
                                        @endisset


                                    </select>
                                    <span class="text-danger" id="classError"></span>
                                </div>
                            </div>

                            <div class="form-row" id="subjectDiv">

                            </div>


                            <a href="javaScript:void(0);" onclick="saveSubjectMarks();" id='submitBtn'
                                class="btn btn-success">Save</a>
        </form>

        <hr>
        <h4 class="text-warning">Student Marks Details<h4>
                <form id="class_filter">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Class Wise Filter</label>
                            <select id="class_filter_drop" class="form-control" name="class_filter_drop">
                                <option value="" selected>Select Class</option>
                                @isset($educations)
                                @foreach($educations as $key=>$edu)
                                <option value="{{$edu->id}}">{{$edu->class_name}}</option>
                                @endforeach
                                @endisset
                            </select>
                        </div>
                    </div>




                </form>
                <table class="table table-bordered" id="studentMarksdetails">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Roll No</th>
                            <!-- <th>Class</th> -->
                            @isset($subjects)
                            @foreach($subjects as $key=>$sub)
                            <th>{{$sub->subject_name}}</th>
                            @endforeach
                            @endisset
                        </tr>
                    </thead>
                    <tbody>
                        @isset($subMarks)
                        @foreach ($subMarks as $key1=>$sm)

                        <tr>
                            <th scope="row">{{$sm['Student Name']}}</th>
                            <td>{{$sm['Roll No']}}</td>
                            <!-- <td>{{-- $sm['Class'] --}}</td> -->
                            @foreach($subjects as $key=>$sub)
                            <td>{{$sm[$sub->subject_name]}}</td>
                            @endforeach
                        </tr>

                        @endforeach
                        @endisset
                    </tbody>
                </table>

    </div>
</div>
@endsection