# **FTTI (Fashion Tendency Types Indicator)**

## **Team & Members**

> **Team Name**: BusTaewooJo  

| **Role**       | **Name**        |
| :------------: | :-------------: |
| FE & Leader    | **Boseong Lee** |
| BE             | **Juri Jang**   |
| ML & PM        | **Minjae Kim**  |

---

## **Project Overview**

> The mobile app assigns a fashion code (FTTI) to individuals based on their preferred styles.  
> Using the FTTI, the app provides curated fashion recommendations tailored to each user's style preferences.

---

## **Implementation Results**

### **1. Login Screen**

<img src="Doc/imgs/최종보고서_img/1.로그인.png" alt="Login Screen" height=400>

---

### **2. Style Selection Screen**

<img src="Doc/imgs/최종보고서_img/2-1.스타일선택.png" alt="Style Selection 1" height=400>  
<img src="Doc/imgs/최종보고서_img/2-2.스타일선택.png" alt="Style Selection 2" height=400>

---

### **3. FTTI Lookup Screen**

<img src="Doc/imgs/최종보고서_img/3.FTTI설명.png" alt="FTTI Explanation" height=400>

---

### **4. Style Recommendation Screen**

<img src="Doc/imgs/최종보고서_img/4-1.추천스타일조회.png" alt="Style Recommendation Screen" height=400>

---

### **4.1. Saved & Wishlist Screen**

<img src="Doc/imgs/최종보고서_img/4-2.추천스타일찜.png" alt="Saved Style" height=400>  
<img src="Doc/imgs/최종보고서_img/4-3.찜목록.png" alt="Wishlist" height=400>

---

### **5. Random Style Recommendation Screen**

<img src="Doc/imgs/최종보고서_img/5.랜덤스타일추천.png" alt="Random Style Recommendation" height=400>

---

### **6. Item Purchase Screen**

<img src="Doc/imgs/최종보고서_img/4-3.쇼핑몰 이동화면.png" alt="Shopping Page" height=400>

---

### **7. Logout Popup**

<img src="Doc/imgs/최종보고서_img/6.로그아웃.png" alt="Logout Popup" height=400>

---

## **Development Environment**

### **Operating System**

![mac](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white)
![windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

### **Code Editor**

![vsCode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)
![android Studio](https://img.shields.io/badge/Android_Studio-3DDC84?style=for-the-badge&logo=android-studio&logoColor=white)

### **Collaboration Tools**

![notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white)
![slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)
![github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
![figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![google Cloud](https://img.shields.io/badge/Google_Cloud-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)

---

## **Tech Stack**

### **Frontend**

![flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![html5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![js](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)

### **Machine Learning**

![python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

### **Backend (Server & DB)**

![firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)

---

## **System Architecture**

![SystemDiagram](./Doc/Diagrams/시스템구성도_20240607수정.png)

This system diagram illustrates the overall architecture of the **FTTI project**. The system consists of two major components: **Mobile Client** and **Google Cloud Platform**.

- **_Mobile Client_**
  - **Login & Registration**: Users can easily sign up or log in using Google Social Login.  
  - **FTTI & Style Recommendations**: Users can check their fashion tendency type and receive tailored style recommendations.  
  - **Save & View Favorite Styles**: Users can save their preferred styles and review them anytime.  
  - **Fashion Item Purchase**: Users can purchase recommended styles directly from the app.

- **_FTTI App_**
  - Serves as the intermediary between the Mobile Client and Google Cloud Platform.

- **_Google Cloud Platform_**
  - **Cloud Storage**: Stores image data uploaded through the image registration feature.  
  - **Firestore**: Manages user and image metadata, including FTTI types and preferences.  
  - **Firebase Authentication**: Ensures user authentication and data security.

---

## **Expected Effects**

1. **Personalized Fashion Recommendations**: Provides tailored fashion recommendations, helping users discover styles that suit them.  
2. **Improved Understanding of Fashion Trends**: Enables users to better understand their fashion tendencies and make informed style choices.  
3. **Enhanced User Satisfaction**: Personalized recommendations make it easier for users to find products they love, increasing satisfaction and retention.  
4. **Targeted Advertising & Marketing**: The system allows fashion brands to offer personalized marketing, improving advertising efficiency.

---

## **Project Deliverables**

| **Category** | **Deliverable** |
| :----------: | :-------------: |
| **Initial**  | [Project Plan](Doc/1_1_OSSProj_01_버스태워조_수행계획서.md) 🔹 [Project Plan Presentation](Doc/1_2_OSSProj_01_버스태워조_수행계획발표자료%20.pdf) |
| **Midterm**  | [Midterm Report](Doc/2_1_OSSProj_01_버스태워조_중간보고서.md) 🔹 [Midterm Presentation](Doc/2_2_OSSProj_01_버스태워조_중간발표자료.pdf) |
| **Final**    | [Final Report](Doc/3_1_OSSProj_01_버스태워조_최종보고서.md) 🔹 [Final Presentation](Doc/3_2_OSSProj_01_버스태워조_최종발표자료.pdf) |
| **Others**   | [Deployment & Operations](Doc/4_3_OSSProj_01_버스태워조_제품구성배포운영자료.md) 🔹 [Overview](Doc/4_4_OSSProj_01_버스태워조_Overivew.md) 🔹 [Scope & Schedule](Doc/4_1_OSSProj_01_버스태워조_범위_일정_이슈관리.md) 🔹 [Meeting Minutes](Doc/4_2_OSSProj_01_버스태워조_회의록.md) |

[**_📄 Latest Release_**](https://github.com/CSID-DGU/2024-1-OSSProj-ComfyRide-01/releases)

---

## **License**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
