<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function index() {
        $category = Category::all();

        return response()->json([
            'status' => 200,
            'category' => $category,
        ]);
    }

    public function allCategory() {
        $category = Category::where('status', '0')->get();

        return response()->json([
            'status' => 200,
            'category' => $category,
        ]);
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'meta_title' => 'required | max:191',
            'slug' => 'required | max:191',
            'name' => 'required | max:191',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => 400,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $category = new Category;

            $category->meta_title = $request->input('meta_title');
            $category->meta_keyword = $request->input('meta_keyword');
            $category->meta_descrip = $request->input('meta_descrip');
            $category->slug = $request->input('slug');
            $category->name = $request->input('name');
            $category->description = $request->input('description');
            $category->status = $request->input('status') == true ? '1' : '0';
            $category->save();

            return response()->json([
                'status' => 200,
                'message' => 'Category added successfully'
            ]);
        }
    }

    public function edit($id) {
        $category = Category::find($id);

        if($category) {
            return response()->json([
                'status' => 200,
                'category' => $category,
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'Category ID not found',
            ]);
        }
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'meta_title' => 'required | max:191',
            'slug' => 'required | max:191',
            'name' => 'required | max:191',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => 422,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $category = Category::find($id);

            if($category) {
                $category->meta_title = $request->input('meta_title');
                $category->meta_keyword = $request->input('meta_keyword');
                $category->meta_descrip = $request->input('meta_descrip');
                $category->slug = $request->input('slug');
                $category->name = $request->input('name');
                $category->description = $request->input('description');
                $category->status = $request->input('status') == true ? '1' : '0';
                $category->save();
    
                return response()->json([
                    'status' => 200,
                    'message' => 'Category updated successfully'
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'message' => 'Category not found',
                ]);
            }
        }
    }

    public function destroy($id) {
        $category = Category::find($id);

        if($category) {
            $category->delete();

            return response()->json([
                'status' => 200,
                'message' => 'Category deleted successfully',
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'Category ID not found',
            ]);
        }
    }
}
