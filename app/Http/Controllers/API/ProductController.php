<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;

class ProductController extends Controller
{
    public function index() {
        $products = Product::orderBy('id', 'DESC')->get();

        return response()->json([
            'status' => 200,
            'products' => $products,
        ]);
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required | max:191',
            'slug' => 'required | max:191',
            'name' => 'required | max:191',
            'meta_title' => 'required | max:191',
            'brand' => 'required | max:20',
            'selling_price' => 'required | max:20',
            'original_price' => 'required | max:20',
            'qty' => 'required | max:4',
            'image' => 'required | image| mimes:jpeg,png,jpg | max:2048',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => 422,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $product = new Product;

            $product->category_id = $request->input('category_id');
            $product->slug = $request->input('slug');
            $product->name = $request->input('name');
            $product->description = $request->input('description');

            $product->meta_title = $request->input('meta_title');
            $product->meta_keyword = $request->input('meta_keyword');
            $product->meta_descrip = $request->input('meta_descrip');

            $product->selling_price = $request->input('selling_price');
            $product->original_price = $request->input('original_price');
            $product->brand = $request->input('brand');
            $product->qty = $request->input('qty');

            if($request->hasFile('image')) {
                $file = $request->file('image');
                $extension = $file->getClientOriginalExtension();
                $filename = time(). '.' .$extension;
                $file->move('uploads/product', $filename);
                $product->image = 'uploads/product/'. $filename;
            }

            $product->featured = $request->input('featured') == true ? '1' : '0';
            $product->popular = $request->input('popular') == true ? '1' : '0';
            $product->status = $request->input('status') == true ? '1' : '0';

            $product->save();

            return response()->json([
                'status' => 200,
                'message' => 'Product added successfully'
            ]);
        }
    }

    public function edit($id) {
        $product = Product::find($id);

        if($product) {
            return response()->json([
                'status' => 200,
                'product' => $product,
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'Product ID not found',
            ]);
        }
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required | max:191',
            'slug' => 'required | max:191',
            'name' => 'required | max:191',
            'meta_title' => 'required | max:191',
            'brand' => 'required | max:20',
            'selling_price' => 'required | max:20',
            'original_price' => 'required | max:20',
            'qty' => 'required | max:4'
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => 422,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $product = Product::find($id);

            if($product) {
                $product->category_id = $request->input('category_id');
                $product->slug = $request->input('slug');
                $product->name = $request->input('name');
                $product->description = $request->input('description');

                $product->meta_title = $request->input('meta_title');
                $product->meta_keyword = $request->input('meta_keyword');
                $product->meta_descrip = $request->input('meta_descrip');

                $product->selling_price = $request->input('selling_price');
                $product->original_price = $request->input('original_price');
                $product->brand = $request->input('brand');
                $product->qty = $request->input('qty');

                if($request->hasFile('image')) {
                    $path = $product->image;
                    if(File::exists($path)) {
                        File::delete($path);
                    }
                    $file = $request->file('image');
                    $extension = $file->getClientOriginalExtension();
                    $filename = time(). '.' .$extension;
                    $file->move('uploads/product', $filename);
                    $product->image = 'uploads/product/'. $filename;
                }

                $product->featured = $request->input('featured');
                $product->popular = $request->input('popular');
                $product->status = $request->input('status');

                $product->save();

                return response()->json([
                    'status' => 200,
                    'message' => 'Product Updated successfully'
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'message' => 'Product not found',
                ]);
            }
        }
    }
}
