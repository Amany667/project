<?php

namespace App\Models;
use App\Models\Dentist;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;


class Appointment extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    public $table = 'appointment';

    protected $fillable = [
        'id-den',
        'day',
        'starhour',
        'endhour',
    ];

    public function Dentist(): BelongsTo
    {
        return $this->belongsTo(Dentist::class,'id-den','dentist_id');
    }


}
