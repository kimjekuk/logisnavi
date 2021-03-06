<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <title>10. Binding to remote data using DataSource</title>
    <link rel="stylesheet" type="text/css" href="./css/tui-example-style.css" />
    <link rel="stylesheet" type="text/css" href="../dist/tui-grid.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.css"
    />
  </head>

  <body>
    <div class="description">
      You can see the tutorial
      <a
        href="https://github.com/nhn/tui.grid/blob/master/packages/toast-ui.grid/docs/en/data-source.md"
        target="_blank"
        >here</a
      >.
      <br/>
      <strong>The example code can be slower than your environment because the code is transpiled by babel-standalone in runtime.</strong>
    </div>
    <div class="code-html contents">
      <div id="grid"></div>
    </div>
  </body>
  <script>
    // polyfill for below IE11
    Object.setPrototypeOf =
      Object.setPrototypeOf ||
      function(obj, proto) {
        obj.__proto__ = proto;
        return obj;
      };
  </script>
  <script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.min.js"></script>
  <script src="https://unpkg.com/xhr-mock/dist/xhr-mock.js"></script>
  <script src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
  	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
  <script type="text/javascript" src="./data/basic-dummy.js"></script>
  
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>	
  
  <script type="text/javascript">
    XHRMock.setup();
    XHRMock.get('/api/readData?perPage=5&page=1', {
      status: 200,
      body: JSON.stringify({
        result: true,
        data: {
          contents: gridData.slice(0, 5),
          pagination: {
            page: 1,
            totalCount: 20
          }
        }
      })
    })
      .get('/api/readData?perPage=5&page=2', {
        status: 200,
        body: JSON.stringify({
          result: true,
          data: {
            contents: gridData.slice(5, 10),
            pagination: {
              page: 2,
              totalCount: 20
            }
          }
        })
      })
      .get('/api/readData?perPage=5&page=3', {
        status: 200,
        body: JSON.stringify({
          result: true,
          data: {
            contents: gridData.slice(10, 15),
            pagination: {
              page: 3,
              totalCount: 20
            }
          }
        })
      })
      .get('/api/readData?perPage=5&page=4', {
        status: 200,
        body: JSON.stringify({
          result: true,
          data: {
            contents: gridData.slice(15, 20),
            pagination: {
              page: 4,
              totalCount: 20
            }
          }
        })
      });
  </script>
  <script type="text/babel" class="code-js">
    const grid = new tui.Grid({
      el: document.getElementById('grid'),
      data: {
        api: {
          readData: { url: '/api/readData', method: 'GET' }
        }
      },
      scrollX: false,
      scrollY: false,
      minBodyHeight: 30,
      rowHeaders: ['rowNum'],
      pageOptions: {
        perPage: 5
      },
      columns: [
        {
          header: 'Name',
          name: 'name'
        },
        {
          header: 'Artist',
          name: 'artist'
        },
        {
          header: 'Type',
          name: 'type'
        },
        {
          header: 'Release',
          name: 'release'
        },
        {
          header: 'Genre',
          name: 'genre'
        }
      ]
    });
  </script>
</html>