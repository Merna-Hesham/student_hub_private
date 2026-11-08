import 'package:flutter/material.dart';
import 'package:flutter_online/screens/sign_up_screen.dart';
import 'package:flutter_online/widgets/custom_text_field.dart';
import '../utils/validators.dart';
import 'home_screen.dart';

class LogInScreen extends StatefulWidget{

  const LogInScreen({
    super.key,
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>{
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: scheme.onSurface,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 16,
                ),

                Text(
                  'Welcome back',
                  style: textTheme.headlineMedium?.copyWith(color: scheme.onSurface),
                ),

                const SizedBox(
                  height: 8,
                ),

                Text(
                  'Log in to see your courses and schedule.',
                  style: textTheme.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
                ),

                const SizedBox(
                  height: 16,
                ),

                CustomTextField(
                  label: 'University email',
                  icon: Icons.mail,
                  controller: _emailController,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  isPassword: false,
                ),

                const SizedBox(
                  height: 16,
                ),

                CustomTextField(
                  label: 'Password',
                  icon: Icons.lock,
                  controller: _passwordController,
                  validator: validatePassword,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),

                const SizedBox(
                  height: 16,
                ),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: _submit,
                    child: Text(
                      'Log in',
                      style: textTheme.labelLarge?.copyWith(color: scheme.onPrimary),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
                    ),

                    const SizedBox(
                      width: 4,
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: textTheme.labelLarge?.copyWith(color: scheme.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
