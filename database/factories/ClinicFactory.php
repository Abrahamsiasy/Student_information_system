<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Clinic>
 */
class ClinicFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        static $name = 1;
        return [
            //
            'campas_id' => $name++,
            'name' => 'CLINIC_ ' . str_pad($name++, 3, '0', STR_PAD_LEFT),
        ];
    }
}
