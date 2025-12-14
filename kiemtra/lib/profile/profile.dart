import 'package:flutter/material.dart';
// Đảm bảo đường dẫn này chính xác
import 'package:kiemtra/profile/user.dart';

class Profile extends StatefulWidget {
  final User user;

  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final u = widget.user;
    final theme = Theme.of(context);

    return Scaffold(
      // AppBar đơn giản hơn, chỉ chứa tiêu đề
      appBar: AppBar(
        title: const Text("Hồ sơ Cá nhân"),
        centerTitle: true,
        elevation: 0, // Bỏ đổ bóng để giao diện phẳng hơn
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // --- Phần Ảnh đại diện và Tên ---
            _buildProfileHeader(u, theme),

            const SizedBox(height: 30),

            // --- Phần Thông tin Chi tiết trong Card ---
            _buildInfoCard(u, theme),

            const SizedBox(height: 40),

            // --- Nút Logout ---
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  // Widget: Phần đầu Hồ sơ (Ảnh và Tên)
  Widget _buildProfileHeader(User u, ThemeData theme) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: theme.primaryColor.withOpacity(0.1),
          // Sử dụng ClipOval nếu muốn thêm border đẹp hơn
          child: ClipOval(
            child: Image.network(
              u.image,
              fit: BoxFit.cover,
              width: 120,
              height: 120,
              errorBuilder: (context, error, stackTrace) {
                // Xử lý khi không tải được ảnh
                return Icon(Icons.person, size: 60, color: theme.primaryColor);
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "${u.firstName} ${u.lastName}",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          u.username,
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  // Widget: Card chứa thông tin
  Widget _buildInfoCard(User u, ThemeData theme) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _infoTile(Icons.email, "Email", u.email, theme),
            _infoTile(
              Icons.person_outline,
              "Tên người dùng",
              u.username,
              theme,
            ),
            _infoTile(Icons.wc, "Giới tính", u.gender, theme),
            _infoTile(
              Icons.badge,
              "Họ và Tên",
              "${u.lastName} ${u.firstName}",
              theme,
            ),
          ],
        ),
      ),
    );
  }

  // Widget: Một dòng thông tin với Icon và tiêu đề/giá trị
  Widget _infoTile(IconData icon, String title, String value, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: theme.primaryColor, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  // Để đảm bảo dòng không bị tràn
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Nút Đăng xuất
  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.logout),
        label: const Text("Đăng xuất"),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // Thêm màu nền nổi bật hơn
          backgroundColor: Theme.of(context).colorScheme.error,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
