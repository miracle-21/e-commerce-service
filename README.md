## 📎 목차

1. [Service](#-service)
2. [개발 기간](#-개발-기간)
3. [개발 인원](#-개발-인원1명)
4. [요구사항 및 분석](#-요구사항-및-분석)
5. [기술 스택](#-기술-스택)
6. [DB 테이블 정의서](#-db-테이블-정의서)
7. [API Endpoints](#-api-endpoints)
8. [ERD](#-erd)
9. [배포(2022.11.30)](#-배포20221130)
    - [크롬 테스트](#-크롬-테스트)
    - [postman 테스트](#-postman-테스트)
    - [배포 중 문제 발생: 인코딩](#-배포-중-문제-발생-인코딩)
10. [참조 문서](#-참조-문서)


## 🚀 Service
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
Language | Framework | Database | Deloy | HTTP | Tools 
| :----------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: 
| <img src="https://img.shields.io/badge/python-3.8.10-3776AB?style=for-the-badge&logo=python&logoColor=white"> | <img src="https://img.shields.io/badge/django-4.1.3-092E20?style=for-the-badge&logo=django&logoColor=white"> | <img src="https://img.shields.io/badge/mysql-v15.1-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> | <img src="https://img.shields.io/badge/navercloud-03C75A?style=for-the-badge&logo=naver&logoColor=white"> </br> <img src="https://img.shields.io/badge/gunicorn-499848?style=for-the-badge&logo=gunicorn&logoColor=white"> </br> <img src="https://img.shields.io/badge/nginx-1.18.0-009639?style=for-the-badge&logo=nginx&logoColor=white">| <img src="https://img.shields.io/badge/postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"> |  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> </br> <img src="https://img.shields.io/badge/trello-0052CC?style=for-the-badge&logo=trello&logoColor=white"> 

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

## ✈️ 배포(2022.11.30)
![](https://velog.velcdn.com/images/miracle-21/post/546c12b9-94fd-438b-955f-be55c11e685f/image.png)

### 👉 크롬 테스트
![](https://velog.velcdn.com/images/miracle-21/post/3328e5fe-2a3b-47b1-9ee6-78d0c8131b29/image.png)

### 👉 postman 테스트
![](https://velog.velcdn.com/images/miracle-21/post/e377f693-0165-448e-9bf8-c139e10753a5/image.gif)
`minha3` 유저가 로그인을 하고, `상품id 11번 옥수수`를 1개 구매한 후, **상품id 11번의 재고 변화와 유저의 credit 변화**를 알 수 있다.

### ❗ 배포 중 문제 발생: 인코딩
![](https://velog.velcdn.com/images/miracle-21/post/b78c8da9-73e9-4acf-8257-fd2cf3a356a3/image.png)

#### 해결방안 1
```python
# return JsonResponse({'results' : results}, status = 200) 수정
return JsonResponse({'results' : results}, json_dumps_params={'ensure_ascii': False} status = 200)
```
참고: https://hashcode.co.kr/questions/11530/python-django-jsonresponse%EC%97%90%EC%84%9C-%ED%95%9C%EA%B8%80-%EC%9D%B8%EC%BD%94%EB%94%A9-%EB%AC%B8%EC%A0%9C-%EC%A7%88%EB%AC%B8%EC%9E%85%EB%8B%88%EB%8B%A4

#### 해결방안 2
`JSONVue` 개발자 도구 설치

## 🔖 참조 문서
- [postman API 링크](https://documenter.getpostman.com/view/18832289/2s7YYvaMyV)

- [Trello 링크](https://trello.com/invite/b/SHbmrXXT/abc2161468cbb2d1a2c0225f815355cd/shopping-service)
![](https://velog.velcdn.com/images/miracle-21/post/687aa9a9-0272-4858-b43c-469cb2d8783f/image.gif)
