# SwiftUI - NewsApp

with: WebKit, Combine, MVVM, SwiftUI, Open API

### 동작 화면

<img src = "../NewsApp/Media/NewsApp.gif" width = "30%">



Open API: https://newsapi.org/docs/endpoints/top-headlines

### 구현 기능

1.  ViewModel에서 Combine을 사용하여 API에 요청을 보냅니다.
2. ImageLoader에서 서버에서 이미지를 요청해 받아오면 이를 감지하고 있던 관련 view들이 업데이트 됩니다.
3. Pagination(페이지네이션)
   : 한 번 요청할 때마다 10개의 뉴스를 받아오고 스크롤이 마지막 뉴스에 다다르면 추가적으로 뉴스를 요청해서 받아옵니다. 
4. 뉴스를 탭하면 WebView를 사용하여 뉴스의 내용을 확인할 수 있습니다.
5.  네트워크 관련 에러 처리



### 새로운 키워드

```swift
final func store(in set: inout Set<AnyCancellable>)
```

```swift
struct Just<Output>
```



### 블로그

작성 예정입니다.


