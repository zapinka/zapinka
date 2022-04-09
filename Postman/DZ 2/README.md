# HW_2 Postman
___

## `http://162.55.220.72:5005/first`
1. Отправить запрос:
+ Request
```js
Get
http://162.55.220.72:5005/first
```
+ Response
```js
This is the first responce from server!
```
2. Статус код 200
```js
pm.test("Check status code is 200", function () {
    pm.response.to.have.status(200);
});
```
3. Проверить, что в body приходит правильный string.
```js
pm.test("Body matches string", function () {
    pm.expect(pm.response.text()).to.include("This is the first responce from server!");
});
```
___
## `http://162.55.220.72:5005/user_info_3`

1. Отправить запрос.
+ Request:
```js
Post
http://162.55.220.72:5005/user_info_3
age:27
name:"Alex"
salary:1000
```
+ Response:
```json
{
    "age": "27",
    "family": {
        "children": [
            [
                "Alex",
                24
            ],
            [
                "Kate",
                12
            ]
        ],
        "u_salary_1_5_year": 4000
    },
    "name": "Alex",
    "salary": 1000
}
```
2. Статус код 200
```js

pm.test("Check status code is 200", function () {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```js
var jsonData = pm.response.json();
```
4. Проверить, что name в ответе равно name s request (name вбить руками.)
```js
pm.test("Check name", function () {
    pm.expect(jsonData.name).to.eql("Alex");
});
```
5. Проверить, что age в ответе равно age s request (age вбить руками.)
```js
pm.test("Check age", function () {
   	 pm.expect(jsonData.age).to.eql("27");
});

```
6. Проверить, что salary в ответе равно salary s request (salary вбить руками.)
```js
pm.test("Check salary", function () {
    pm.expect(jsonData.salary).to.eql(parseInt(1000));
});
```
7. Спарсить request.
```js
var reqBody = request.data;
```
8. Проверить, что name в ответе равно name s request (name забрать из request.)
```js
pm.test("Check your name", function () {
    pm.expect(jsonData.name).to.eql(reqBody.name);
});
```
9. Проверить, что age в ответе равно age s request (age забрать из request.)
```js
pm.test("Check your age", function () {
    pm.expect(jsonData.age).to.eql(reqBody.age);
});
```
10. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```js
pm.test("Check your salary", function () {
    pm.expect(jsonData.salary).to.eql(parseInt(reqBody.salary));
});
```
11. Вывести в консоль параметр family из response.
```js
var resp = jsonData.family;
console.log('resp = ' , resp)
```
12. Проверить что u_salary_1_5_year в ответе равно salary*4 (salary забрать из request)
```js
pm.test("Check u_salary_1_5_year = salary*4", function () {
    pm.expect(jsonData.family.u_salary_1_5_year).to.eql(reqBody.salary*4);
});
```
___

## `http://162.55.220.72:5005/object_info_3`
1. Отправить запрос:
+ Request:
```js
Get http://162.55.220.72:5005/object_info_3
Params: name:"Alex"
        age:27
        salary:1000
```
2. Статус код 200
```js
pm.test("Check status code is 200", function () {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```js
var jsonData = pm.response.json();
```   	
4. Спарсить request.
```js
var reqBody =  pm.request.url.query.toObject();
```
5. Проверить, что name в ответе равно name s request (name забрать из request.) 
```js
pm.test("Check name", function () {
    pm.expect(jsonData.name).to.eql(reqBody.name);
});
```
6. Проверить, что age в ответе равно age s request (age забрать из request.) 
```js
pm.test("Check age", function () {
    pm.expect(jsonData.age).to.eql(reqBody.age);
});
```
7. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```js
pm.test("Check salary", function () {
    pm.expect(jsonData.salary).to.eql(parseInt(reqBody.salary));
});
```
8. Вывести в консоль параметр family из response.
```js
var resp = jsonData.family;
console.log('resp = ' , resp)
```
9. Проверить, что у параметра dog есть параметры name.
```js
var resp = jsonData.family;
pm.test("Check the dog has name", function () {
    pm.expect(resp.pets.dog).to.property("name");
});
```
10. Проверить, что у параметра dog есть параметры age:
```js

pm.test("Check the dog has age", function () {
    pm.expect(resp.pets.dog).to.property("age");
});
```
11. Проверить, что параметр name имеет значение Luky:
```js
pm.test("Check dog's name Lucky ", function () {
    pm.expect(resp.pets.dog.name).to.eql("Luky");
});
```
12. Проверить, что параметр age имеет значение 4.
```js
 pm.test("Check dog's age", function () {
    pm.expect(resp.pets.dog.age).to.eql(4);
});
```
## `http://162.55.220.72:5005/object_info_4`
1. Отправить запрос:
```js
Get http://162.55.220.72:5005/object_info_4?name=Alex&age=27&salary=2000
```
2. Статус код 200:
```js
pm.test("Check status code is 200", function () {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json:
```js
    var jsonData = JSON.parse(responseBody);
```    	
4. Спарсить request:
```js
var reqBody = pm.request.url.query.toObject();
```
5. Проверить, что name в ответе равно name s request (name забрать из request.)
```js
pm.test("Check name", function () {
    pm.expect(jsonData.name).to.eql(reqBody.name);
});
```
6. Проверить, что age в ответе равно age из request (age забрать из request.)
```js
pm.test("Check age", function () {
    pm.expect(jsonData.age).to.eql(parseInt(reqBody.age));
});
```
7. Вывести в консоль параметр salary из request.
```js
var salary = reqBody.salary
console.log('salary =' + salary)
```	
8. Проверить, что 0-й элемент параметра salary равен salary из request (salary забрать из request.):
```js
pm.test("Check resp_salary[0]=req_salary", function () {
   	pm.expect(jsonData.salary[0]).to.eql (parseInt(reqBody.salary));
});
```
9. Проверить, что 1-й элемент параметра salary равен salary*2 из request (salary забрать из request.):
```js
pm.test("Check salary[1]=salary*2", function () {
   	pm.expect(1*jsonData.salary[1]).to.eql(reqBody.salary*2);
});
```
10. Проверить, что 2-й элемент параметра salary равен salary*3 из request (salary забрать из request.):
```js
pm.test("salary[2]=salary*3", function () {
   	pm.expect(1*jsonData.salary[2]).to.eql(reqBody.salary*3);
});
```
11. Передать в окружение переменную name:
```js
var name = jsonData.name
pm.test("set name", function () {
   	pm.expect(name).to.eql('Alex');
});
pm.environment.set("name_1", name);
```
12. Передать в окружение переменную age 
```js
var age = jsonData.age
console.log('age =' + age)
pm.test("set age", function () {
   	pm.expect(age).to.eql(29);
});

pm.environment.set("age_1", age);
```
13. Передать в окружение переменную salary
```js
var salary = 1*jsonData.salary[1];
console.log('salary =' + salary)


pm.test("set salary", function () {
   	pm.expect(salary).to.eql(4000);
});

pm.environment.set("salary_1", salary);
```
14. Написать цикл который выведет в консоль по порядку элементы списка из параметра salary:
```js
for (var i=0; i < salary.length; i++){
    console.log("salary_" + i + ":" +salary[i])
}	
```    
___
## `http://162.55.220.72:5005/user_info_2`
1. Отправить запрос:
+ Request
```js
Post  `http://162.55.220.72:5005/user_info_2`
Body,form-data:
       name:{{name}}
       age:{{age}}
       salary:{{salary}}
```       
2. Статус код 200
```js
pm.test("Check status code is 200", function () {
    	pm.response.to.have.status(200);
});
```
3. Спарсить response body в json:
```js
var respBody = JSON.parse(responseBody);
```
4. Спарсить request:
```js
var req = request.data;
```
5. Проверить, что json response имеет параметр start_qa_salary:
```js 	
pm.test("Your test name", function () {
     pm.expect(respBody).to.have.property('start_qa_salary');
});
```	
6. Проверить, что json response имеет параметр qa_salary_after_6_months:
```js
pm.test("Check qa_salary_after_6_months", function () {
     pm.expect(respBody).to.have.property('qa_salary_after_6_months');
});
```    
7. Проверить, что json response имеет параметр qa_salary_after_12_months:
```js
console.log("salary = " + salary)

pm.test("Check qa_salary_after_12_months", function () {
     pm.expect(respBody).to.have.property("qa_salary_after_12_months");
});
```    
8. Проверить, что json response имеет параметр qa_salary_after_1.5_year:
```js
pm.test("Check qa_salary_after_1.5_year", function () {
    pm.expect(respBody).to.have.property("qa_salary_after_1.5_year");
});
```    
9. Проверить, что json response имеет параметр qa_salary_after_3.5_years: 
```js
pm.test("Check qa_salary_after_3.5_year", function () {
    pm.expect(respBody).to.have.property("qa_salary_after_3.5_year");
});
```
10. Проверить, что json response имеет параметр person:
```js
pm.test("Check that response has person", function () {
    pm.expect(respBody).to.have.property('person');
});
```    
11. Проверить, что параметр start_qa_salary равен salary из request (salary забрать из request.):- 
```js

pm.test("Check start_qa_salary = salary from request", function () {
    pm.expect(respBody.start_qa_salary).to.eql(parseInt(req.salary));
});
```
12. Проверить, что параметр qa_salary_after_6_months равен salary*2 из request (salary забрать из request.):
```js
pm.test("qa_salary_after_6_months = salary*2 from request", function () {
    pm.expect(respBody.qa_salary_after_6_months).to.eql(req.salary*2);
});
```
13. Проверить, что параметр qa_salary_after_12_months равен salary*2.7 из request (salary забрать из request.):
```js
pm.test("qa_salary_after_12_months =salary*2.7 from request", function () {
    pm.expect(respBody.qa_salary_after_12_months).to.eql(req.salary*2.7);
});
```
14. Проверить, что параметр qa_salary_after_1.5_year равен salary*3.3 из request (salary забрать из request.):
```js
pm.test("qa_salary_after_1.5_year равен salary*3.3", function () {
    pm.expect(respBody["qa_salary_after_1.5_year"]).to.eql(req.salary*3.3);
});
```
15. Проверить, что параметр qa_salary_after_3.5_years равен salary*3.8 из request (salary забрать из request.):
```js
pm.test("qa_salary_after_3.5_year = salary*3.8", function () {
    pm.expect(resp["qa_salary_after_3.5_year"]).to.eql(req.salary*3.8);
});
```
16. Проверить, что в параметре person, 1-й элемент из u_name равен salary из request (salary забрать из request.):
```js
pm.test("the first element from u_name = salary ", function () {
    pm.expect(respBody.person.u_name[1]).to.eql(parseInt(req.salary));
});
```
17. Проверить, что что параметр u_age равен age из request (age забрать из request.): 
```js
pm.test("u_age = age from request ", function () {
    pm.expect(respBody.person.u_age).to.eql(parseInt(req.age));
});
```
18. Проверить, что параметр u_salary_5_years равен salary*4.2 из request (salary забрать из request.):
```js

pm.test("u_salary_5_years equals salary*4.2", function () {
    pm.expect(respBody.person.u_salary_5_years).to.eql(req.salary*4.2);
});
```
