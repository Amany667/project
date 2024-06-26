<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class appoin extends Model
{
    use HasFactory;
    protected $table="appoin-reserve";
    protected $fillable=[
        'day',
        'time',
    ];
}
