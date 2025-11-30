<?php

namespace Tests\Feature;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class MarkdownSanitizationTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function gadget_detail_markdown_is_sanitized_in_view()
    {
        // Arrange: create minimal related data
        $brand = \App\Models\Brand::create(['name' => 'TestBrand', 'slug' => 'testbrand']);
        $category = \App\Models\Category::create(['name' => 'TestCategory', 'slug' => 'testcategory']);

        $gadget = \App\Models\Gadget::create([
            'name' => 'Sanitize Me',
            'slug' => 'sanitize-me',
            'brand_id' => $brand->id,
            'category_id' => $category->id,
            'price' => 1000000,
        ]);

        // Write a markdown file containing unsafe HTML and links
        $path = 'private/tests/sanitize.md';
        Storage::disk('local')->put($path, "# Specs\n<script>alert('xss')</script>\nThis is a [bad link](javascript:alert('x')).");

        // Attach spec pointing to the markdown file (detail_path)
        \App\Models\GadgetSpec::create([
            'gadget_id' => $gadget->id,
            'key' => 'detail_path',
            'value' => $path,
        ]);

        // Act: visit gadget detail page
        $response = $this->get(route('gadgets.show', $gadget->slug));

        // Assert: script tags and unsafe javascript links are not present
        $response->assertStatus(200);
        $response->assertDontSee('<script>');
        $response->assertDontSee('javascript:alert');
        // Title and link text should render as plain text or safe markup
        $response->assertSee('Specs');
        $response->assertSee('bad link');
    }
}
