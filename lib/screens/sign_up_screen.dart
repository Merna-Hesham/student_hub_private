import 'package:flutter/material.dart';
import 'package:flutter_online/screens/home_screen.dart';
import 'package:flutter_online/screens/log_in_screen.dart';
import 'package:flutter_online/utils/validators.dart';
import 'package:flutter_online/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget{

  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _agree = false;

  @override
  void dispose(){
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit(){
    if (!_formKey.currentState!.validate()){
      return;
    }
    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the terms to continue')),);
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
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

               Text.rich(
                 TextSpan(
                   text: 'Create account',
                   style: textTheme.headlineMedium?.copyWith(color: scheme.onSurface),
                   children: [
                      TextSpan(
                       text: '\nJoin Student Hub with your university email.',
                       style: textTheme.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
                     ),
                   ],
                 ),
               ),

               const SizedBox(
                 height: 16,
               ),

               CustomTextField(
                 label: 'Full name',
                 icon: Icons.person,
                 controller: _fullNameController,
                 isPassword: false,
                 keyboardType: TextInputType.name,
                 validator: validateName,
               ),

               const SizedBox(
                 height: 16,
               ),

               CustomTextField(
                 label: 'University email',
                 icon: Icons.mail,
                 controller: _emailController,
                 isPassword: false,
                 keyboardType: TextInputType.emailAddress,
                 validator: validateEmail,
               ),

               const SizedBox(
                 height: 16,
               ),

               CustomTextField(
                 label: 'Password',
                 icon: Icons.lock,
                 controller: _passwordController,
                 isPassword: true,
                 keyboardType: TextInputType.visiblePassword,
                 validator: validatePassword,
               ),

               const SizedBox(
                 height: 16,
               ),

               CustomTextField(
                 label: 'Confirm password',
                 icon: Icons.lock,
                 controller: _confirmPasswordController,
                 isPassword: true,
                 keyboardType: TextInputType.visiblePassword,
                 validator: (value) {
                   if (value != _passwordController.text){
                     return 'Passwords do not match';
                   }
                   return null;
                   },
               ),

               const SizedBox(
                 height: 16,
               ),

               Row(
                 children: [
                   Checkbox(
                     value: _agree,
                     onChanged: (value) {
                       setState(() {
                         _agree = value ?? false;
                       });
                     },
                   ),
                   Expanded(
                     child: Text(
                       'I agree to the Terms of Service and Privacy Policy',
                       style: textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
                     ),
                   ),
                 ],
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
                     'Sign up',
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
                     'Already have an account?',
                     style: textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
                   ),

                   const SizedBox(
                     width: 4,
                   ),

                   TextButton(
                     onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const LogInScreen()),
                       );
                     },
                     child: Text(
                       'Log in',
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
