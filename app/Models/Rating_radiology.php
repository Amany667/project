<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rating_radiology extends Model
{
    use HasFactory;
    protected $table="rating_radiologies";
    protected $fillable=[
        'user_id',
        'reserv_id',
        'star_rated',
        'comment',
    ];
}
