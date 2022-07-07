from django.shortcuts import render
from django.http import HttpResponse

import pprint
from pymongo import MongoClient

def index(request):
    client = MongoClient("mongodb+srv://mongo:mongo@cluster0.ipvq6.mongodb.net/?retryWrites=true&w=majority")
    
    db = client.rh
    print('db', db)
    print(db.list_collection_names())

    pontos = db.ponto

    pprint.pprint(pontos.find_one())

    return HttpResponse("<h1>Hello HR-TECH!</h1>")