<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Campas>
 */
class CampasFactory extends Factory
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
            'name' => 'CAMPASS_' . str_pad($name++, 3, '0', STR_PAD_LEFT),

        ];
    }
}
