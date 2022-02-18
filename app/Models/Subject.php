<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Education;
use App\Models\Candidate;
class Subject extends Model
{
    use HasFactory;
    protected $table = 'subjects';

    public function education()
    {
        return $this->belongsTo(Education::class);
    }

    public function candidates(){
        return $this->hasMany(Candidate::class);
    }
}