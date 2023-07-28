<br>
<div align="center">
<img src="https://github.com/Ohnus/Semi_Project_HamoYeah/assets/88930889/a3ba4498-693b-49fc-a5fd-9f021f9289e5" width="70%">
</div>
<br>

## 🔗 Link
- **Repository**: https://github.com/Ohnus/Semi_Project_HamoYeah
<br>

## 🗂️ Table of Contents
- [👔 Introduction](#-introduction)
- [🤝 Team Members](#-team-member)
- [💻 Technologies Used](#-technologies-used)
- [🔍 Features](#-features)
- [📸 Screenshots](#-screenshots)
- [🛠 Prerequisites](#-prerequisites)
- [📥 Installation](#-installation)
<br>

#
### 👔 Introduction
- 프로젝트 이름: HamoYeah(하모예)
- 프로젝트 기간: 2023.04.20 ~ 2023.05.04
- 프로젝트 내용: 온라인 옷장으로 내 옷을 관리하고, 나의 옷장에서 날씨와 기온에 따른 옷을 추천해주는 서비스
- 프로젝트 목적: 해당 프로젝트는 KOSTA 257기 교육기간 중 진행된 파이널 프로젝트입니다. 교육기간 중 배운 JPA, REST API 기반 SpringBoot와 Vue.js 기술을 프로젝트에 도입함으로써 기술을 숙달하고, 기존 개발패턴이었던 jsp, handler, jQuery에서 새로운 개발패턴을 익히기 위해 진행된 프로젝트입니다.
<br>

### 🤝 Team Member
- 이주원
- 봉선호: https://github.com/Ohnus
- 문승미
- 최예은
- 손행원
<br>

### 💻 Technologies Used
- Programming Languages: Java, HTML5, CSS3, JavaScript
- Framework/Library: SpringBoot, JPA, REST API, Vue.js
- Server: Oracle DB, Apache Tomcat
- Envrionment/Tooling: Eclipse, VS Code, GitHub, Sourcetree
- Open API: 기상청 단기예보 API, 한국천문연구 출몰시각 API, 카카오 로컬 API, 네이버쇼핑 API
<br>

### 🔍 Features
#### 1. Member Part
- 회원가입 시 정규표현식을 통한 유효성 검사
- 유효성 검사 대상: 아이디, 비밀번호, 이메일, 닉네임
- 로그인, 아이디 비밀번호 찾기 기능
- 이메일 인증 기능
#### 2. Weather Part
- 현 위치의 24시간 기상 정보를 3가지 API를 통해 불러오기
- 날씨에 따른 view 아이콘 및 배경 변화
- 현재 기온을 기준으로 기온별 추천 옷을 카테고리별로 추천
- 추천된 카테고리로 옷장에서 옷 정보를 카드 형식으로 불러옴
- 옷 정보가 없을 경우 네이버 쇼핑 API로 연동된 옷 검색 결과를 불러옴
- 현재 기온과 유사한 날에 기록된 OOTW 게시글을 불러와 과거 옷차림 기록을 볼 수 있음
#### 3. Closet & OOTW(Outfit of the weather) Board Part
- 이미지 drag&drop을 통해 옷장에 내 옷 등록하기
- 메뉴바에서 옷 카테고리 클릭하여 리스트 필터링
- 옷 키워드로 검색하여 리스트 필터링
- 즐겨찾기, 수정, 삭제 기능으로 옷 관리하기
- 2차원 배열과 JavaScript filter, find method를 활용한 더보기 기능
- 옷장에 등록된 옷을 바탕으로 OOTW 게시판에 날짜, 날씨, 기온, 간단한 커멘트와 함께 기록하기
- 날짜, 기온, 키워드로 작성된 게시글 검색하여 리스트 필터링
- 옷장에 등록된 옷이 삭제되면 해당 옷이 등록된 모든 OOTW 게시글 자동 삭제 기능
#### 4. Outfit Coordination Board Part
- 
#### 5. Battle Board Part
- 매주 새로운 테마로 진행되는 테마에 맞는 코디 배틀 게시판
- 금, 토, 일요일은 관리자에 의해 선정된 배틀 테마로 유저들이 테마에 맞는 코디 사진을 첨부하여 배틀 신청
- 월요일 오전 10시까지 관리자가 배틀을 신청한 유저들 중 랜덤으로 2명을 후보로 선정
- 선정된 2명의 후보는 월, 화, 수요일에 비밀투표를 받게 되고, 투표에 참여한 유저는 선택 번복 불가능
- 수요일 밤 11시59분까지 투표를 진행하고 목요일 자정에 자동 집계하여 이 주의 우승자를 선정
- 선정된 우승자는 일주일간 '이 주의 우승자' 게시판에 노출되며, 명예의 전당에 오르게 됨
<br>

### 📸 Screenshots
- (Under construction)
<br>

### 🛠 Prerequisites
- (Under construction)
<br>

### 📥 Installation
- (Under construction)
<br>
