<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class reservation extends Model
{
    use HasFactory;
    protected $table="reservation";
    protected $fillable=[
        'email_doctor',
        'first name',
        'last name',
        'email patient',
        'phone patient'	,
        'doctor_name',
        'finished',
        'waiting list',
       'id-patient',
        'den-id',
    ];
}
