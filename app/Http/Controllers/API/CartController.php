<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Cart;

class CartController extends Controller
{
    public function addToCart(Request $request) {
        if(auth('sanctum')->check()) {
            $user_id = auth('sanctum')->user()->id;
            $product_id = $request->product_id;
            $product_qty = $request->product_qty;

            $productCheck = Product::where('id', $product_id)->first();
            if($productCheck) {
                if(Cart::where('product_id', $product_id)->where('user_id', $user_id)->exists()) {
                    return response()->json([
                        'status' => 409,
                        'message' => $productCheck->name." Product already exists in your cart",
                    ]);
                } else {
                    $cartitem = new Cart();
                    $cartitem->user_id = $user_id;
                    $cartitem->product_id = $product_id;
                    $cartitem->product_qty = $product_qty;
                    $cartitem->save();

                    return response()->json([
                        'status' => 201,
                        'message' => "Add to cart done",
                    ]);
                }
            } else {
                return response()->json([
                    'status' => 404,
                    'message' => "Product not found",
                ]);
            }
        } else {
            return response()->json([
                'status' => 401,
                'message' => "Login to add cart",
            ]);
        }
    }

    public function viewCart() {
        if(auth('sanctum')->check()) {
            $user_id = auth('sanctum')->user()->id;
            $cartItem = Cart::where('user_id', $user_id)->get();

            return response()->json([
                'status' => 200,
                'cart' => $cartItem,
            ]);
        } else {
            return response()->json([
                'status' => 401,
                'message' => "Login to view cart",
            ]);
        }
    }

    public function updateCartQty($cart_id, $scope) {
        if(auth('sanctum')->check()) {
            $user_id = auth('sanctum')->user()->id;
            $cartItem = Cart::where('id', $cart_id)->where('user_id', $user_id)->first();

            if($scope == "inc") {
                $cartItem->product_qty +=1;
            } else {
                $cartItem->product_qty -=1;
            }

            $cartItem->update();

            return response()->json([
                'status' => 200,
                'message' => "Quantity Updated",
            ]);
        } else {
            return response()->json([
                'status' => 401,
                'message' => "Login to update cart qty",
            ]);
        }
    }

    public function deleteCartItem($cart_id) {
        if(auth('sanctum')->check()) {
            $user_id = auth('sanctum')->user()->id;
            $cartItem = Cart::where('id', $cart_id)->where('user_id', $user_id)->first();

            if($cartItem) {
                $cartItem->delete();

                return response()->json([
                    'status' => 200,
                    'message' => "Item deleted",
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'message' => "Cart item not found",
                ]);
            }
        } else {
            return response()->json([
                'status' => 401,
                'message' => "Login to Delete cart item",
            ]);
        }
    }
}
