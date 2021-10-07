<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
   href="${contextPath}/resources/vendors/feather/feather.css">
<link rel="stylesheet"
   href="${contextPath}/resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
   href="${contextPath}/resources/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
   href="${contextPath}/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
   href="${contextPath}/resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
   href="${contextPath}/resources/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
   href="${contextPath}/resources/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon"
   href="${contextPath}/resources/images/favicon.png" />

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8"
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<!-- your piecelabel -->

<style>
@import
   url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
   ;

body {
   font-family: 'Noto Sans KR', sans-serif;
}

ul {
   list-style: none;
}
</style>


</head>
<body>
   <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->

      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
         <!-- partial:partials/_settings-panel.html -->
         <div class="theme-setting-wrapper">
            <div id="settings-trigger">
               <i class="ti-settings"></i>
            </div>
            <div id="theme-settings" class="settings-panel">
               <i class="settings-close ti-close"></i>
               <p class="settings-heading">SIDEBAR SKINS</p>
               <div class="sidebar-bg-options selected" id="sidebar-light-theme">
                  <div class="img-ss rounded-circle bg-light border mr-3"></div>
                  Light
               </div>
               <div class="sidebar-bg-options" id="sidebar-dark-theme">
                  <div class="img-ss rounded-circle bg-dark border mr-3"></div>
                  Dark
               </div>
               <p class="settings-heading mt-2">HEADER SKINS</p>
               <div class="color-tiles mx-0 px-4">
                  <div class="tiles success"></div>
                  <div class="tiles warning"></div>
                  <div class="tiles danger"></div>
                  <div class="tiles info"></div>
                  <div class="tiles dark"></div>
                  <div class="tiles default"></div>
               </div>
            </div>
         </div>
         <div id="right-sidebar" class="settings-panel">
            <i class="settings-close ti-close"></i>
            <ul class="nav nav-tabs border-top" id="setting-panel"
               role="tablist">
               <li class="nav-item"><a class="nav-link active" id="todo-tab"
                  data-toggle="tab" href="#todo-section" role="tab"
                  aria-controls="todo-section" aria-expanded="true">TO DO LIST</a></li>
               <li class="nav-item"><a class="nav-link" id="chats-tab"
                  data-toggle="tab" href="#chats-section" role="tab"
                  aria-controls="chats-section">CHATS</a></li>
            </ul>
            <div class="tab-content" id="setting-content">
               <div class="tab-pane fade show active scroll-wrapper"
                  id="todo-section" role="tabpanel" aria-labelledby="todo-section">
                  <div class="add-items d-flex px-3 mb-0">
                     <form class="form w-100">
                        <div class="form-group d-flex">
                           <input type="text" class="form-control todo-list-input"
                              placeholder="Add To-do">
                           <button type="submit"
                              class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                        </div>
                     </form>
                  </div>
                  <div class="list-wrapper px-3">
                     <ul class="d-flex flex-column-reverse todo-list">
                        <li>
                           <div class="form-check">
                              <label class="form-check-label"> <input
                                 class="checkbox" type="checkbox"> Team review meeting
                                 at 3.00 PM
                              </label>
                           </div> <i class="remove ti-close"></i>
                        </li>
                        <li>
                           <div class="form-check">
                              <label class="form-check-label"> <input
                                 class="checkbox" type="checkbox"> Prepare for
                                 presentation
                              </label>
                           </div> <i class="remove ti-close"></i>
                        </li>
                        <li>
                           <div class="form-check">
                              <label class="form-check-label"> <input
                                 class="checkbox" type="checkbox"> Resolve all the low
                                 priority tickets due today
                              </label>
                           </div> <i class="remove ti-close"></i>
                        </li>
                        <li class="completed">
                           <div class="form-check">
                              <label class="form-check-label"> <input
                                 class="checkbox" type="checkbox" checked> Schedule
                                 meeting for next week
                              </label>
                           </div> <i class="remove ti-close"></i>
                        </li>
                        <li class="completed">
                           <div class="form-check">
                              <label class="form-check-label"> <input
                                 class="checkbox" type="checkbox" checked> Project
                                 review
                              </label>
                           </div> <i class="remove ti-close"></i>
                        </li>
                     </ul>
                  </div>
                  <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
                  <div class="events pt-4 px-3">
                     <div class="wrapper d-flex mb-2">
                        <i class="ti-control-record text-primary mr-2"></i> <span>Feb
                           11 2018</span>
                     </div>
                     <p class="mb-0 font-weight-thin text-gray">Creating component
                        page build a js</p>
                     <p class="text-gray mb-0">The total number of sessions</p>
                  </div>
                  <div class="events pt-4 px-3">
                     <div class="wrapper d-flex mb-2">
                        <i class="ti-control-record text-primary mr-2"></i> <span>Feb
                           7 2018</span>
                     </div>
                     <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
                     <p class="text-gray mb-0 ">Call Sarah Graves</p>
                  </div>
               </div>
               <!-- To do section tab ends -->
               <div class="tab-pane fade" id="chats-section" role="tabpanel"
                  aria-labelledby="chats-section">
                  <div
                     class="d-flex align-items-center justify-content-between border-bottom">
                     <p
                        class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
                     <small
                        class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
                        All</small>
                  </div>
                  <ul class="chat-list">
                     <li class="list active">
                        <div class="profile">
                           <img src="images/faces/face1.jpg" alt="image"><span
                              class="online"></span>
                        </div>
                        <div class="info">
                           <p>Thomas Douglas</p>
                           <p>Available</p>
                        </div> <small class="text-muted my-auto">19 min</small>
                     </li>
                     <li class="list">
                        <div class="profile">
                           <img src="images/faces/face2.jpg" alt="image"><span
                              class="offline"></span>
                        </div>
                        <div class="info">
                           <div class="wrapper d-flex">
                              <p>Catherine</p>
                           </div>
                           <p>Away</p>
                        </div>
                        <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                        <small class="text-muted my-auto">23 min</small>
                     </li>
                     <li class="list">
                        <div class="profile">
                           <img src="${contextPath}/resources/images/faces/face3.jpg"
                              alt="image"><span class="online"></span>
                        </div>
                        <div class="info">
                           <p>Daniel Russell</p>
                           <p>Available</p>
                        </div> <small class="text-muted my-auto">14 min</small>
                     </li>
                     <li class="list">
                        <div class="profile">
                           <img src="${contextPath}/resources/images/faces/face4.jpg"
                              alt="image"><span class="offline"></span>
                        </div>
                        <div class="info">
                           <p>James Richardson</p>
                           <p>Away</p>
                        </div> <small class="text-muted my-auto">2 min</small>
                     </li>
                     <li class="list">
                        <div class="profile">
                           <img src="${contextPath}/resources/images/faces/face5.jpg"
                              alt="image"><span class="online"></span>
                        </div>
                        <div class="info">
                           <p>Madeline Kennedy</p>
                           <p>Available</p>
                        </div> <small class="text-muted my-auto">5 min</small>
                     </li>
                     <li class="list">
                        <div class="profile">
                           <img src="${contextPath}/resources/images/faces/face6.jpg"
                              alt="image"><span class="online"></span>
                        </div>
                        <div class="info">
                           <p>Sarah Graves</p>
                           <p>Available</p>
                        </div> <small class="text-muted my-auto">47 min</small>
                     </li>
                  </ul>
               </div>
               <!-- chat tab ends -->
            </div>
         </div>
         <!-- partial -->

         <!-- partial -->
         <div class="main-panel">
            <div class="content-wrapper">
               <div class="row">
                  <div class="col-md-12 grid-margin">
                     <div class="row">
                        <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                           <h3 class="font-weight-bold">청원글 네트워크 그래프</h3>
                           <h6 class="font-weight-normal mb-0">
                              단어간 연관관계를 분석하여 보여줍니다
                           </h6>
                        </div>
                        <div class="col-12 col-xl-4">
                           <div class="justify-content-end d-flex">
                              <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                                 <button class="btn btn-sm btn-light bg-white dropdown-toggle"
                                    type="button" id="dropdownMenuDate2" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="true">
                                    <i class="mdi mdi-calendar"></i> Today (10 Jan 2021)
                                 </button>
                                 <div class="dropdown-menu dropdown-menu-right"
                                    aria-labelledby="dropdownMenuDate2">
                                    <a class="dropdown-item" href="#">January - March</a> <a
                                       class="dropdown-item" href="#">March - June</a> <a
                                       class="dropdown-item" href="#">June - August</a> <a
                                       class="dropdown-item" href="#">August - November</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-lg-7 col-md-10 grid-margin stretch-card">
                     <div class="card tale-bg">

                        <div class="card-body">
                        <div class="row template-demo grid-margin ml-2">
               <div class="btn-group">
                      <button type="button" class="btn btn-info">${config.month }월</button>
                      <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" id="dropdownMenuSplitButton5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuSplitButton5" style="">
                        <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=9">9월</a>
                       <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=8">8월</a>
                       <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=7">7월</a>
                       <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=6">6월</a>
                      </div>
                    </div>
<%--                     <div class="btn-group">
                      <button type="button" class="btn btn-info">
               ${config.category }
               </button>
                      <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" id="dropdownMenuSplitButton5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuSplitButton5" style="">
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=0">전체</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=15">경제민주화</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=9">교통/건축/국토</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=8">농산어촌</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=12">문화/예술/체육/언론</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=13">미래</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=14">반려동물</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=5">보건복지</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=16">성장동력</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=7">안전/환경</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=11">외교/통일/국방</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=10">육아/교육</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=6">인권/성평등</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=4">일자리</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=17">저출산/고령화대책</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=2">정치개혁</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=3">행정</a>
                      <a class="dropdown-item" href="${contextPath}/main/networkDetail.do?month=${config.month }&category=1">기타</a>
                      </div>
                    </div> --%>
                        </div>
                        <div class="row grid-margin ml-2">
                           <div class="chart" id="net">
                                 <script>
                                      var graphs = ${net}

                                   Plotly.plot('net', graphs, {});
                                </script>
                           </div>
                        </div>
                        </div>

                     </div>
                  </div>
               </div>
               </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <!-- partial -->
         </div>
         <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
   </div>

   <!-- container-scroller -->

   <!-- plugins:js -->
   <script src="${contextPath}/resources/vendors/js/vendor.bundle.base.js"></script>
   <!-- endinject -->
   <!-- Plugin js for this page -->
   <script src="${contextPath}/resources/vendors/chart.js/Chart.min.js"></script>
   <script
      src="${contextPath}/resources/vendors/datatables.net/jquery.dataTables.js"></script>
   <script
      src="${contextPath}/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
   <script src="${contextPath}/resources/js/dataTables.select.min.js"></script>

   <!-- End plugin js for this page -->
   <!-- inject:js -->
   <script src="${contextPath}/resources/js/off-canvas.js"></script>
   <script src="${contextPath}/resources/js/hoverable-collapse.js"></script>
   <script src="${contextPath}/resources/js/template.js"></script>
   <script src="${contextPath}/resources/js/settings.js"></script>
   <script src="${contextPath}/resources/js/todolist.js"></script>
   <!-- endinject -->
   <!-- Custom js for this page-->
   <script src="${contextPath}/resources/js/dashboard.js"></script>
   <script src="${contextPath}/resources/js/Chart.roundedBarCharts.js"></script>
   <!-- End custom js for this page-->
</body>

</html>
