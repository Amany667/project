<?php

namespace App\Models;

use App\Models\Appointment;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Dentist extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    public $table = 'dentists';
    protected $primaryKey = 'dentist_id';
   /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    protected $fillable = [
        'firstname',
        'secondname',
        'email',
        'phonenumber',
        'password',
        'confirmpassword',
        'covernate',
        'region',
        'youraddress',
        'personalphoto',
        'syndicatedphoto',

    ];

    public function Appointment(): HasMany
    {
        return $this->hasMany(Appointment::class,'id-den','dentist_id');
    }



    protected $hidden = [
        'password',
        'password_confirmation',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


}
