<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\FrontendController;
use App\Http\Controllers\API\CartController;
use App\Http\Controllers\API\CheckoutController;
use App\Http\Controllers\API\OrderController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::get('get-category-lists', [FrontendController::class, 'category']);
Route::get('fetch-product-lists/{slug}', [FrontendController::class, 'product']);
Route::get('fetch-product-lists', [FrontendController::class, 'allProducts']);
Route::get('view-product-detail/{category_slug}/{product_slug}', [FrontendController::class, 'viewProduct']);
Route::post('add-to-cart', [CartController::class, 'addToCart']);
Route::get('cart', [CartController::class, 'viewCart']);
Route::put('cart-qty-update/{cart_id}/{scope}', [CartController::class, 'updateCartQty']);
Route::delete('delete-cart-item/{cart_id}', [CartController::class, 'deleteCartItem']);
Route::post('place-order', [CheckoutController::class, 'placeOrder']);

Route::middleware('auth:sanctum')->group(function() {
    Route::post('logout', [AuthController::class, 'logout']);
});

Route::middleware('auth:sanctum', 'isAPIAdmin')->group(function() {
    Route::get('/checkingAuthenticate', function(){
        return response()->json(['message' => 'You are logged in', 'status' => 200], 200);
    });

    //categories
    Route::post('/store-category', [CategoryController::class, 'store']);
    Route::get('/view-category', [CategoryController::class, 'index']);
    Route::get('/edit-category/{id}', [CategoryController::class, 'edit']);
    Route::put('/update-category/{id}', [CategoryController::class, 'update']);
    Route::delete('/delete-category/{id}', [CategoryController::class, 'destroy']);
    Route::get('/all-category', [CategoryController::class, 'allCategory']);

    //products
    Route::post('/store-product', [ProductController::class, 'store']);
    Route::get('/view-product', [ProductController::class, 'index']);
    Route::get('/edit-product/{id}', [ProductController::class, 'edit']);
    Route::post('/update-product/{id}', [ProductController::class, 'update']);

    Route::get('/admin/show-user-orders', [OrderController::class, 'index']);
});
