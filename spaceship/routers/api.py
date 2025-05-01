import numpy as np
from fastapi import APIRouter

router = APIRouter()

@router.get("/matrix")
async def matrix_multiply():
    matrix_a = np.random.rand(10, 10).tolist()
    matrix_b = np.random.rand(10, 10).tolist()
    product = np.dot(matrix_a, matrix_b).tolist()
    
    return {
        "matrix_a": matrix_a,
        "matrix_b": matrix_b,
        "product": product
    }
