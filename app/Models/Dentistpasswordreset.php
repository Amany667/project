<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use \Illuminate\Database\Eloquent\Relations\BelongsTo;

class Dentistpasswordreset extends Model
{
    use HasFactory;
    public $table = 'dentistpassword_reset';
    protected $guanded =[];

    const UPDATED_AT = null;
    protected $fillable=[
        'email',
        'token',
    ];
}
