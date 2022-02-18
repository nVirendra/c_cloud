<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Subject;
use App\Models\Candidate;
class Education extends Model
{
    use HasFactory;
    protected $table = 'educations';

    public function subjects(){
        return $this->hasMany(Subject::class);
    }

    public function candidates(){
        return $this->hasMany(Candidate::class);
    }
}