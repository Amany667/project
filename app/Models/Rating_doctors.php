<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rating_doctors extends Model
{
    use HasFactory;
    protected $table="rating_doctors";
    protected $fillable=[
        'user_id',
        'doctor_id',
        'star_rated',
        'comment',
    ];
}
