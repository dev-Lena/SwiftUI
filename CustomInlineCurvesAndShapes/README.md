# SwiftUI - Custom Inline Curves and Shapes

### 동작 화면

<img src = "../CustomInlineCurvesAndShapes/Media/CustomInlineCurvesAndShapes.gif" width = "30%">

### 새로운 키워드

`renderingMode()` / `func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image`

`resizable()` / `func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image`

`clipShape()` / `func clipShape<S>(_ shape: S, style: FillStyle = FillStyle()) -> some View where S : Shape`

### 궁금한 것

1. 버튼을 메서드나 구조체로 만들어서 생성해낼 수는 없을까?

```swift
        func ImageButton(imageName: ImageName) -> UIButton {
    
    
    
            Button(action: {
    
            }) {
                Image(systemName: imageName)
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
```

![image-20210202010641574](/Users/keunnalee/Library/Application Support/typora-user-images/image-20210202010641574.png)

2. @State 의 용도

3. $property와 property의 차이

   ```swift
   @State var property = 0
   
   // $property: Binding<Int>
   // property: Int
   ```

   

### 블로그

작성 예정입니다.



### 참고

[SwiftUI: Animated Bar Charts and Picker Segmented Style Binding](https://youtu.be/5lSJzzI2fj8)

