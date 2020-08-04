<?php

use Illuminate\Database\Seeder;
use App\Model\Blog;

class BlogTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Let's truncate our existing records to start from scratch.
        Blog::truncate();

        $faker = \Faker\Factory::create();

        // And now, let's create a few Blogs in our database:
        for ($i = 0; $i < 5; $i++) {
            Blog::create([
                'title' => $faker->sentence,
                'user_id' => $faker->randomDigit,
                'category_id' => $faker->randomDigit,
                'description' => $faker->sentence,
                'image' => $faker->sentence,
                'is_featured' => 1,
                'is_active' => 1,                
            ]);
        }
        
    }
}
