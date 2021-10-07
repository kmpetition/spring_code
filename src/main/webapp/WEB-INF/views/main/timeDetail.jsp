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


<!-- 구글 웹폰트 -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
   rel="stylesheet">

<!-- Core theme CSS (includes Bootstrap)-->
<%-- <link href="${contextPath }/resources/css/main_content.css" rel="stylesheet" /> --%>

<!-- Bootstrap core JS-->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
   integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
   crossorigin="anonymous">


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
                           <h3 class="font-weight-bold">Welcome Aamir</h3>
                           <h6 class="font-weight-normal mb-0">
                              All systems are running smoothly! You have <span
                                 class="text-primary">3 unread alerts!</span>
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
                  <div class="col-md-12 grid-margin stretch-card">
                     <div class="card position-relative">

                        <div class="card-body">
                           <!-- 
                           <div class="card-body"
                              style="display: flex; align-items: center;">
                              <div class="chart" id="time">
                                 <script>
                                      var graphs = ${time1}

                                   Plotly.plot('time', graphs, {});
                                </script>
                              </div>
                           </div>
                         -->



                           <main class="flex-shrink-0">

                              <!-- Features section-->
                              <section class="py-5" id="features">
                                 <div class="container px-5 my-5">
                                    <div class="row gx-5">
                                       <div class="col-lg-8 mb-5 mb-lg-0" style="padding-bottom:100px;">
                                          <!-- mb = margin-bottom -->
                                          <h2 class="fw-bolder mb-0">국민청원 한눈에 보기</h2>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="col-lg-12">
                                          <div class="row gx-5 row-cols-1 row-cols-md-2">
                                             <div class="col-lg-6 mb-5 h-100">
                                                <div
                                                   class="bg-primary bg-gradient text-white rounded-3 mb-3" style="padding:2px; border-radius:5px; text-align:center; vertical-align:middle;">
                                                   <h3>2021년 ${timeMap.time4}주차</h3>
                                                </div>
                                                <div class="chart" id="time4">
                                                   <script>
                                                      var graphs = ${time4}

                                                      Plotly.plot('time4',graphs,{});
                                                   </script>
                                                </div>
                                             </div>
                                             <div class="col-lg-6 mb-5 h-100">
                                                <div
                                                   class="bg-primary bg-gradient text-white rounded-3 mb-3" style="padding:2px; border-radius:5px; text-align:center; vertical-align:middle;">
                                                   <h3>2021년 ${timeMap.time3}주차</h3>
                                                </div>
                                                <div class="chart" id="time3">
                                                   <script>
                                                      var graphs = ${time3}

                                                      Plotly.plot('time3',graphs,{});
                                                   </script>
                                                </div>
                                             </div>
                                             <div class="col-lg-6 mb-5 mb-md-0 h-100">
                                                <div
                                                   class="bg-primary bg-gradient text-white rounded-3 mb-3" style="padding:2px; border-radius:5px; text-align:center; vertical-align:middle;">
                                                   <h3>2021년 ${timeMap.time2}주차</h3>
                                                </div>
                                                <div class="chart" id="time2">
                                                   <script>
                                                      var graphs = ${time2}

                                                      Plotly.plot('time2',graphs,{});
                                                   </script>
                                                </div>
                                             </div>
                                             <div class="col h-100">
                                                <div
                                                   class="bg-primary bg-gradient text-white rounded-3 mb-3" style="padding:2px; border-radius:5px; text-align:center; vertical-align:middle;">
                                                   <h3>2021년 ${timeMap.time1}주차</h3>
                                                </div>
                                                <div class="chart" id="time1">
                                                   <script>
                                                      var graphs = ${time1}

                                                      Plotly.plot('time1',graphs,{});
                                                   </script>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
</div>
                                 </div>
                              </section>
                           </main>

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
