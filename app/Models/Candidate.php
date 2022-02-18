<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Education;
use App\Models\Subject;
class Candidate extends Model
{
    use HasFactory;
    protected $table = 'candidates';

    public function education()
    {
        return $this->belongsTo(Education::class);
    }

    public function subject()
    {
        return $this->belongsTo(Subject::class);
    }
}