## 📎 목차

1. [Posting Service](#-posting-service)
2. [개발 기간](#-개발-기간)
3. [개발 인원](#-개발-인원)
4. [요구사항 및 분석](#-요구사항-및-분석)
5. [기술 스택](#-기술-스택)
6. [DB 테이블 정의서](#-db-테이블-정의서)
7. [API Endpoints](#api-endpoints)
8. [ERD](#-erd)
9. [API 명세서](#-api-명세서)


## 🚀Posting Service
- 상품 판매 서비스

## 📆 개발 기간
- 2022.09.08 ~ 2022.09.14(7일)

## 🧑🏻‍💻 개발 인원(1명)
- 박민하

## 📝 요구사항 및 분석
1. 회원관리, 상품관리, 결제관리, 주문내역 확인 기능
2. CRUD를 위한 REST API
    - 입력, 수정 시 데이터 형식의 유효성 검사
    - REST API에서 벗어난 param 또는 요청에 대한 응답 처리
    - 상품, 결재, 주문은 관리자만 입력, 수정, 삭제 가능
    - 유저는 회원가입, 결제, 주문 외에는 조회만 가능
    - 조회 결과는 JSON 형태로 응답

## 🛠 기술 스택
Language | Framework | Database | HTTP | Tools
| :----------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: |
| <img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white"> | <img src="https://img.shields.io/badge/django-092E20?style=for-the-badge&logo=django&logoColor=white"> | <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> | <img src="https://img.shields.io/badge/postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"> |  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> </br> <img src="https://img.shields.io/badge/trello-0052CC?style=for-the-badge&logo=trello&logoColor=white"> 

## 🎯 DB 테이블 정의서
저장소 SQL 파일 참조
* mysql.xlsx
* mysql.ods

## 🎯 API Endpoints
| endpoint | HTTP Method | 기능 | response data |
|----------|-------------|------|-------------------|
|/users | GET | 회원 정보 조회 |  	200 OK </br> 400 Bad Request </br> 401 Unauthorized
|/users/signup | POST | 회원가입 | 	201 Created </br> 400 Bad Request </br> 409 Conflict
|/users/signin | GET | 로그인 | 200 OK </br> 400 Bad Request </br> 401 Unauthorized
|/users/:id | PATCH/DELETE | 회원 정보 수정/삭제 | 200 OK </br> 401 Unauthorized
|/products | POST | 상품 등록 | 201 Created </br> 400 Bad Request </br> 401 Unauthorized
|/products/index | GET | 메인/상세페이지 |  200 OK
|/products/index/:id | PATCH/DELETE | 상품 수정/삭제 | 200 OK </br> 400 Bad Request </br> 401 Unauthorized
|/orders | POST | 상품 결제  | 201 Created </br> 400 Bad Request </br> 401 Unauthorized
|/orders/:product_id | GET | 결제 내역 조회 | 200 OK 
|/orders/:user_id/:payment_id | PATCH/DELETE | 결제 수정/취소 | 200 OK </br> 400 Bad Request

## 📚 ERD
![](https://velog.velcdn.com/images/miracle-21/post/0127e91f-0643-4834-8c6b-053638804288/image.png)


## 🔖 참조 문서
- [postman API 링크](https://documenter.getpostman.com/view/18832289/2s7YYvaMyV)

- Trello
![](https://velog.velcdn.com/images/miracle-21/post/687aa9a9-0272-4858-b43c-469cb2d8783f/image.gif)
