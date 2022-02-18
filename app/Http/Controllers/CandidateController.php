<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Candidate;
use App\Models\Education;
use App\Models\Mark;
use Validator;
use Carbon\Carbon;
use DB;
class CandidateController extends Controller
{
    
    public function index(){
        
        $educations = Education::all();
        if(empty($_GET['c_id'])){
            $classWise = 1;
        }else{
        
            $classWise = $_GET['c_id'];
        }
        
        $subjects = Education::find($classWise)->subjects;
        $cData = Candidate::where('candidates.education_id','=',$classWise)
                    ->selectRaw('candidates.`student_name`,candidates.`roll_no`')
                    ->get();
        
        foreach($cData as $key=>$cd){
            $subMarks[$key]['Student Name'] = $cd->student_name;
            $subMarks[$key]['Roll No'] = $cd->roll_no;
            $subMark = DB::table('subjects')->join('marks as M', function ($join) {
                $join->on('subjects.id', '=', 'M.subject_id');
                $join->on('subjects.education_id', '=', 'M.education_id');
                })->selectRaw('subjects.`subject_name`,M.`marks`')->where('M.roll_no','=',$cd->roll_no)->get();
                if($subMark){
                     foreach($subMark as $key1=>$sm){
                        $subMarks[$key][$sm->subject_name]=$sm->marks;
                    }
                }
        }
        
        return view('students.index',['educations'=>$educations,'subjects'=>$subjects,'subMarks'=>$subMarks]);
    }

    

    public function isRolNoAvailable(Request $request){
        $rollExist = Candidate::where('roll_no',$request->rollNumber)->first();
        $data = "";
        if(!empty($rollExist->roll_no)){
            $data = "<span style='color: red;'>Not Available.</span>";
        }
        return response()->json($data);
    }

    public function getSubjects(Request $request)
    {
        $subjects = Education::find($request->class_Id)->subjects;
     
        $htmlres = "";
            foreach ($subjects as $key=>$subject) 
            {
                
                $htmlres.= "<div class='form-group col-md-2'>
                                    <label>".$subject->subject_name." <span style='color: red;'>*</span></label>
                                    <input type='text' class='form-control getsubData' name='".$subject->subject_name."' data-subid='".$subject->id."' id='".$subject->id."' required>
                                </div>";
            }
            return response()->json( array('status' => true, 'html'=>$htmlres));
    }


    public function saveMarks(Request $request){

        //validate input
        $request->validate([
            'name'      => 'required',
            'roll_no'    => 'required|unique:candidates',
            'file' => 'required',
            'cls_id'=>'required'
        ]);
        //save candidate details
        $candidate = new Candidate();
        $candidate->student_name = $request->name;
        $candidate->roll_no = $request->roll_no;
        if($request->file)
        {
            $image = $request->file;
            $currentDate = Carbon::now()->toDateString();
            $imagename = $currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
            $image->move(public_path().'/images',$imagename);
            
        }
        $candidate->photo = $imagename;
        $candidate->education_id = $request->cls_id;
        if($candidate->save()){
            //to save all subject marks of single student
            $data = [];
            foreach(json_decode($request->subjecMark) as $key => $val){
                $data[] = [
                    'roll_no'=>$request->roll_no,
                    'education_id'=>$request->cls_id,
                    'subject_id'=>$val->sub_id,
                    'marks'=>$val->mark,
                    'created_at'=> Carbon::now(),
                    'updated_at'=> Carbon::now()
                ];
            }
            $saveMark = Mark::insert($data);
            if($saveMark){
                return response()->json( array('status' => true, 'msg'=>'marksheet data saved'));
            }
            else{
                return response()->json( array('false' => true, 'msg'=>'something went wrong'));
            }
        }
        
    }

    public function serversideIndex(){
        $educations = Education::all();
        $subjects = Education::find(1)->subjects;
        return view('students.server-side',['educations'=>$educations,'subjects'=>$subjects]);
    }



    public function ServersideList(Request $request){
        ## Read value
       $draw = $request->get('draw');
       $start = $request->get("start");
       $rowperpage = $request->get("length"); // Rows display per page
  
       $columnIndex_arr = $request->get('order');
       $columnName_arr = $request->get('columns');
       $order_arr = $request->get('order');
       $search_arr = $request->get('search');
  
       $columnIndex = $columnIndex_arr[0]['column']; // Column index
       $columnName = $columnName_arr[$columnIndex]['data']; // Column name
       $columnSortOrder = $order_arr[0]['dir']; // asc or desc
       $searchValue = $search_arr['value']; // Search value

    $totalRecords = Candidate::select('count(*) as allcount')->count();
    $totalRecordswithFilter = Candidate::select('count(*) as allcount')->where('student_name', 'like', '%' .$searchValue . '%')->count();

    // Fetch records
    $cData = Candidate::orderBy($columnName,$columnSortOrder)
      ->where('candidates.student_name', 'like', '%' .$searchValue . '%')
      ->select('candidates.*')
      ->skip($start)
      ->take($rowperpage)
      ->get();
         
        
         $data_arr = array();
        foreach($cData as $key=>$cd){
            $student_name = $cd->student_name;
            $roll_no = $cd->roll_no;
            $subMark = DB::table('subjects')->join('marks as M', function ($join) {
                $join->on('subjects.id', '=', 'M.subject_id');
                $join->on('subjects.education_id', '=', 'M.education_id');
                })->selectRaw('subjects.`subject_name`,M.`marks`')->where('M.roll_no','=',$cd->roll_no)->get();
                if($subMark){
                    $sub_marks = array();
                     foreach($subMark as $key1=>$sm){
                        $sub_marks[]=$sm->marks;
                    }
                }

                $data_arr[] = array(
                    "student_name" => $student_name,
                    "roll_no" => $roll_no,
                    "sub_marks"=>$sub_marks,
                  );
        }
        $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $totalRecordswithFilter,
            "aaData" => $data_arr
         );
    
         echo json_encode($response);
         exit;
    }

    public function totoalScore(){
        
        $totalScore = Candidate::join('marks as M', function ($join) {
            $join->on('candidates.roll_no', '=', 'M.roll_no');
            $join->on('candidates.education_id', '=', 'M.education_id');
            })->join('educations as E','E.id','=','candidates.education_id')
            ->select('candidates.student_name', 'candidates.roll_no','candidates.photo','E.class_name',DB::raw("SUM(M.marks) as total"))
            ->groupBy('M.roll_no')->get();

        return view('students.student-total-score',['totalScore'=>$totalScore]);
    }

   
}