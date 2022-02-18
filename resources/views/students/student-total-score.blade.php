@extends('layouts.master')
@section('title')
{{"Total Score"}}
@endsection
@section('content')
<div class="container">
    <div class="card mt-2">
        <div class="card-body">
            <h3 class="card-title text-center mb-4">Student Score</h3>
            <hr>
            <h4 class="text-warning">Student Total Score<h4>
                    <table class="table table-bordered" id="totalScoreSimple">
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Student Roll No</th>
                                <th>Student Photo link</th>
                                <th>Class</th>
                                <th>Total Score</th>
                            </tr>
                        </thead>
                        <tbody>
                            @isset($totalScore)
                            @foreach ($totalScore as $key1=>$ts)

                            <tr>
                                <th scope="row">{{$ts->student_name}}</th>
                                <td>{{$ts->roll_no}}</td>

                                <td><a href="{{asset('images/'.$ts->photo)}}">
                                        <img alt="photo link" src="{{asset('images/'.$ts->photo)}}" width=150"
                                            height="70">
                                    </a></td>
                                <td>{{$ts->class_name}}</td>
                                <td>{{$ts->total}}</td>
                            </tr>

                            @endforeach
                            @endisset
                        </tbody>
                    </table>

        </div>
    </div>
</div>
@endsection