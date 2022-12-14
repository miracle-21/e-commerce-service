## ๐ ๋ชฉ์ฐจ

1. [Service](#-service)
2. [๊ฐ๋ฐ ๊ธฐ๊ฐ](#-๊ฐ๋ฐ-๊ธฐ๊ฐ)
3. [๊ฐ๋ฐ ์ธ์](#-๊ฐ๋ฐ-์ธ์1๋ช)
4. [์๊ตฌ์ฌํญ ๋ฐ ๋ถ์](#-์๊ตฌ์ฌํญ-๋ฐ-๋ถ์)
5. [๊ธฐ์  ์คํ](#-๊ธฐ์ -์คํ)
6. [DB ํ์ด๋ธ ์ ์์](#-db-ํ์ด๋ธ-์ ์์)
7. [API Endpoints](#-api-endpoints)
8. [ERD](#-erd)
9. [๋ฐฐํฌ(2022.11.30)](#-๋ฐฐํฌ20221130)
    - [ํฌ๋กฌ ํ์คํธ](#-ํฌ๋กฌ-ํ์คํธ)
    - [postman ํ์คํธ](#-postman-ํ์คํธ)
    - [๋ฐฐํฌ ์ค ๋ฌธ์  ๋ฐ์: ์ธ์ฝ๋ฉ](#-๋ฐฐํฌ-์ค-๋ฌธ์ -๋ฐ์-์ธ์ฝ๋ฉ)
10. [์ฐธ์กฐ ๋ฌธ์](#-์ฐธ์กฐ-๋ฌธ์)


## ๐ Service
- ์ํ ํ๋งค ์๋น์ค

## ๐ ๊ฐ๋ฐ ๊ธฐ๊ฐ
- 2022.09.08 ~ 2022.09.14(7์ผ)

## ๐ง๐ปโ๐ป ๊ฐ๋ฐ ์ธ์(1๋ช)
- ๋ฐ๋ฏผํ

## ๐ ์๊ตฌ์ฌํญ ๋ฐ ๋ถ์
1. ํ์๊ด๋ฆฌ, ์ํ๊ด๋ฆฌ, ๊ฒฐ์ ๊ด๋ฆฌ, ์ฃผ๋ฌธ๋ด์ญ ํ์ธ ๊ธฐ๋ฅ
2. CRUD๋ฅผ ์ํ REST API
    - ์๋ ฅ, ์์  ์ ๋ฐ์ดํฐ ํ์์ ์ ํจ์ฑ ๊ฒ์ฌ
    - REST API์์ ๋ฒ์ด๋ param ๋๋ ์์ฒญ์ ๋ํ ์๋ต ์ฒ๋ฆฌ
    - ์ํ, ๊ฒฐ์ฌ, ์ฃผ๋ฌธ์ ๊ด๋ฆฌ์๋ง ์๋ ฅ, ์์ , ์ญ์  ๊ฐ๋ฅ
    - ์ ์ ๋ ํ์๊ฐ์, ๊ฒฐ์ , ์ฃผ๋ฌธ ์ธ์๋ ์กฐํ๋ง ๊ฐ๋ฅ
    - ์กฐํ ๊ฒฐ๊ณผ๋ JSON ํํ๋ก ์๋ต

## ๐  ๊ธฐ์  ์คํ
Language | Framework | Database | Deloy | HTTP | Tools 
| :----------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: 
| <img src="https://img.shields.io/badge/python-3.8.10-3776AB?style=for-the-badge&logo=python&logoColor=white"> | <img src="https://img.shields.io/badge/django-4.1.3-092E20?style=for-the-badge&logo=django&logoColor=white"> | <img src="https://img.shields.io/badge/mysql-v15.1-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> | <img src="https://img.shields.io/badge/navercloud-03C75A?style=for-the-badge&logo=naver&logoColor=white"> </br> <img src="https://img.shields.io/badge/gunicorn-499848?style=for-the-badge&logo=gunicorn&logoColor=white"> </br> <img src="https://img.shields.io/badge/nginx-1.18.0-009639?style=for-the-badge&logo=nginx&logoColor=white">| <img src="https://img.shields.io/badge/postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"> |  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> </br> <img src="https://img.shields.io/badge/trello-0052CC?style=for-the-badge&logo=trello&logoColor=white"> 

## ๐ฏ DB ํ์ด๋ธ ์ ์์
์ ์ฅ์ SQL ํ์ผ ์ฐธ์กฐ
* mysql.xlsx
* mysql.ods

## ๐ฏ API Endpoints
| endpoint | HTTP Method | ๊ธฐ๋ฅ | response data |
|----------|-------------|------|-------------------|
|/users | GET | ํ์ ์ ๋ณด ์กฐํ |  	200 OK </br> 400 Bad Request </br> 401 Unauthorized
|/users/signup | POST | ํ์๊ฐ์ | 	201 Created </br> 400 Bad Request </br> 409 Conflict
|/users/signin | GET | ๋ก๊ทธ์ธ | 200 OK </br> 400 Bad Request </br> 401 Unauthorized
|/users/:id | PATCH/DELETE | ํ์ ์ ๋ณด ์์ /์ญ์  | 200 OK </br> 401 Unauthorized
|/products | POST | ์ํ ๋ฑ๋ก | 201 Created </br> 400 Bad Request </br> 401 Unauthorized
|/products/index | GET | ๋ฉ์ธ/์์ธํ์ด์ง |  200 OK
|/products/index/:id | PATCH/DELETE | ์ํ ์์ /์ญ์  | 200 OK </br> 400 Bad Request </br> 401 Unauthorized
|/orders | POST | ์ํ ๊ฒฐ์   | 201 Created </br> 400 Bad Request </br> 401 Unauthorized
|/orders/:product_id | GET | ๊ฒฐ์  ๋ด์ญ ์กฐํ | 200 OK 
|/orders/:user_id/:payment_id | PATCH/DELETE | ๊ฒฐ์  ์์ /์ทจ์ | 200 OK </br> 400 Bad Request

## ๐ ERD
![](https://velog.velcdn.com/images/miracle-21/post/0127e91f-0643-4834-8c6b-053638804288/image.png)

## โ๏ธ ๋ฐฐํฌ(2022.11.30)
![](https://velog.velcdn.com/images/miracle-21/post/546c12b9-94fd-438b-955f-be55c11e685f/image.png)

### ๐ ํฌ๋กฌ ํ์คํธ
![](https://velog.velcdn.com/images/miracle-21/post/3328e5fe-2a3b-47b1-9ee6-78d0c8131b29/image.png)

### ๐ postman ํ์คํธ
![](https://velog.velcdn.com/images/miracle-21/post/e377f693-0165-448e-9bf8-c139e10753a5/image.gif)
`minha3` ์ ์ ๊ฐ ๋ก๊ทธ์ธ์ ํ๊ณ , `์ํid 11๋ฒ ์ฅ์์`๋ฅผ 1๊ฐ ๊ตฌ๋งคํ ํ, **์ํid 11๋ฒ์ ์ฌ๊ณ  ๋ณํ์ ์ ์ ์ credit ๋ณํ**๋ฅผ ์ ์ ์๋ค.

### โ ๋ฐฐํฌ ์ค ๋ฌธ์  ๋ฐ์: ์ธ์ฝ๋ฉ
![](https://velog.velcdn.com/images/miracle-21/post/b78c8da9-73e9-4acf-8257-fd2cf3a356a3/image.png)

#### ํด๊ฒฐ๋ฐฉ์ 1
```python
# return JsonResponse({'results' : results}, status = 200) ์์ 
return JsonResponse({'results' : results}, json_dumps_params={'ensure_ascii': False} status = 200)
```
์ฐธ๊ณ : https://hashcode.co.kr/questions/11530/python-django-jsonresponse%EC%97%90%EC%84%9C-%ED%95%9C%EA%B8%80-%EC%9D%B8%EC%BD%94%EB%94%A9-%EB%AC%B8%EC%A0%9C-%EC%A7%88%EB%AC%B8%EC%9E%85%EB%8B%88%EB%8B%A4

#### ํด๊ฒฐ๋ฐฉ์ 2
`JSONVue` ๊ฐ๋ฐ์ ๋๊ตฌ ์ค์น

## ๐ ์ฐธ์กฐ ๋ฌธ์
- [postman API ๋งํฌ](https://documenter.getpostman.com/view/18832289/2s7YYvaMyV)

- [Trello ๋งํฌ](https://trello.com/invite/b/SHbmrXXT/abc2161468cbb2d1a2c0225f815355cd/shopping-service)
![](https://velog.velcdn.com/images/miracle-21/post/687aa9a9-0272-4858-b43c-469cb2d8783f/image.gif)
