<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use \Illuminate\Database\Eloquent\Relations\BelongsTo;



class Passwordresets extends Model
{
    use HasFactory;
    public $table = 'password_resets';
    protected $guanded =[];

    const UPDATED_AT = null;
    protected $fillable=[
        'email',
        'token',
    ];
}
