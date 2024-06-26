<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Radiology extends Model
{
    use HasFactory;
    protected $table="radiology center";
    protected $fillable = [
        'name',
        'email',
        'phone',
        'password',
        'confirmpassword',
        'covernate',
        'region',
        'youraddress',
        'personal photo',
        'syndicatedphoto',

    ];





    protected $hidden = [
        'password',
        'proved',
        'used',
        'password_confirmation',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
