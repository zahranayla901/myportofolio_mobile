import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  static const Color _navy = Color(0xFF33415C);

  final _formKey = GlobalKey<FormState>();

  String _title = " ";
  String _description = " ";
  String _technology = " ";
  String _projectUrl = " ";
  String _thumbnail = " ";
  bool _isSubmitting = false;

  String? _validateRequired(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  String? _validateUrl(String? value, {required bool isRequired}) {
    final text = value?.trim() ?? " ";
    if (text.isEmpty) {
      return isRequired ? 'URL tidak boleh kosong!' : null;
    }
    final uri = Uri.tryParse(text);
    final isValid =
        uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
    return isValid
        ? null
        : 'Masukkan URL yang valid (diawali http:// atau https://).';
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final loggedIn = await ensureLoggedIn(context);
    if (!loggedIn || !mounted) return;

    final authState = context.read<AuthState>();
    final apiClient = context.read<ApiClient>();
    final token = authState.token;
    if (token == null) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      await apiClient.createProject(
        Project(
          title: _title.trim(),
          description: _description.trim(),
          technology: _technology.trim(),
          projectUrl: _projectUrl.trim(),
          thumbnail: _thumbnail.trim(),
        ),
        token: token,
      );
      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Proyek berhasil ditambahkan!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      _formKey.currentState?.reset();
    } on ApiException catch (error) {
      if (!mounted) return;
      if (error.statusCode == 401) {
        // Token dicabut atau kedaluwarsa: hapus sesi dan minta login ulang.
        await authState.logout();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sesi habis. Silakan login ulang.')),
        );
      } else if (error.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data proyek tidak valid. Periksa isian.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan proyek (${error.statusCode}).'),
          ),
        );
      }
    } on Exception {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak dapat terhubung ke server.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Widget _textField({
    required String label,
    required String hint,
    required ValueChanged<String> onChanged,
    String? Function(String?)? validator,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Project Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: _navy,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textField(
                label: 'Nama Proyek',
                hint: 'Nama Proyek',
                onChanged: (value) => _title = value,
                validator: (value) =>
                    _validateRequired(value, 'Nama proyek tidak boleh kosong!'),
              ),
              _textField(
                label: 'Deskripsi Proyek',
                hint: 'Deskripsi Proyek',
                maxLines: 5,
                onChanged: (value) => _description = value,
                validator: (value) => _validateRequired(
                  value,
                  'Deskripsi proyek tidak boleh kosong!',
                ),
              ),
              _textField(
                label: 'Teknologi yang Digunakan',
                hint: 'Contoh: Flutter, Django, Figma',
                onChanged: (value) => _technology = value,
                validator: (value) =>
                    _validateRequired(value, 'Teknologi tidak boleh kosong!'),
              ),
              _textField(
                label: 'Tautan Proyek',
                hint: 'https://...',
                keyboardType: TextInputType.url,
                onChanged: (value) => _projectUrl = value,
                validator: (value) => _validateUrl(value, isRequired: true),
              ),
              _textField(
                label: 'Gambar Proyek (opsional)',
                hint: 'https://... (kosongkan jika tidak ada)',
                keyboardType: TextInputType.url,
                onChanged: (value) => _thumbnail = value,
                validator: (value) => _validateUrl(value, isRequired: false),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _navy,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Save'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
