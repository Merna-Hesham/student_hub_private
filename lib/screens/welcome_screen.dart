import 'package:flutter/material.dart';
import 'package:flutter_online/screens/log_in_screen.dart';
import 'package:flutter_online/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget{

  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(
           horizontal: 24,
           vertical: 8,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(32),
               ),
               width: double.infinity,
               child: Image.asset(
                 'lib/assets/images/welcome_image.png',
               ),
             ),

             const SizedBox(
               height: 24,
             ),

             Text(
               'Your campus life, \nin one place',
               textAlign: TextAlign.center,
               style: textTheme.headlineMedium?.copyWith(color: scheme.onSurface),
             ),

             const SizedBox(
               height: 12,
             ),

             Text(
               'Track courses, schedules and grades. Create an account to get started.',
               textAlign: TextAlign.center,
               style: textTheme.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
             ),

             Expanded(
               child: const SizedBox(
                 height: 24,
               ),
             ),

             SizedBox(
               width: double.infinity,
               height: 48,
               child: FilledButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const SignUpScreen()),
                   );
                 },
                 child: Text(
                   'Create account',
                   style: textTheme.labelLarge?.copyWith(color: scheme.onPrimary),
                 ),
               ),
             ),

             const SizedBox(height: 12),

             SizedBox(
               width: double.infinity,
               height: 48,
               child: OutlinedButton(
                 onPressed: () {
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
             ),
           ],
         ),
       ),
     ),
   );
  }
}
