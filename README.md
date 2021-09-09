# Asp app + mysql 2019

1. Clone về

2. Nhảy vào trong thư mục vừa mới tải về.

3. docker build -t imdbserver . 
  Sau bước này sẽ tạo ra 2 image là imdbserver và 1 image ko có tên chỉ có ID (gọi là image2)

4. docker run -it -d -p 1433:1433 --name dbserver imdbserver
  Khởi tạo db container với container name là dbserver
5.docker run -it -d -p 9000:9000 --name webapp <image2>
  Khởi tạo webapp với container name webapp
6. docker create network Mynet1
7. docker network connect Mynet1 webapp
8. docker network connect Mynet1 dbserver
  Bước 6,7,8 là khởi tạo network và join các container vào chung 1 netnwork để app có thể gọi db bằng tên container thay cho IP (vì IP của DBserver thay đổi mỗi lần tạo khác nhau)
9. vào <ip host app>:9000 để vô web app

Đăng nhập :
- Tài khoản khách hàng: 
tk : Khach@gmail.com 
mk 12345678
- Tài khoản admin trang quản trị :
tk : Admin@gmail.com
mk : 12345678

Phân quyền quản trị và khách hàng

Bấm mua hàng : giỏ hàng sẽ cập nhật sản phẩm đã chọn.
Có thể chỉnh sửa giỏ hàng >
Chức năng đặt hàng chưa thực hiện xong :)).

Kích vào hình ảnh để xem chi tiết sản phẩm

Đăng nhập tài khoản admin để thêm sửa xóa sản phẩm và các danh mục khác.

Project làm đang còn trên mức độ tìm hiểu , tham khảo cho sinh viên. Chưa hoàn thiện .
