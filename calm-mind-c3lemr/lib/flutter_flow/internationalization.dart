import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? hiText = '',
  }) =>
      [enText, esText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // StartPage
  {
    'dfy114ok': {
      'en': 'Your Companion for Clarity, Balance,\n and Peace.',
      'es': 'Su compañero para la claridad, el equilibrio y la paz.',
      'hi': 'स्पष्टता, संतुलन और शांति के लिए आपका साथी।',
    },
    'j8hk26n3': {
      'en': 'Start your journey to tomorrow now!',
      'es': '¡Comience su viaje hacia el mañana ahora!',
      'hi': 'कल के लिए अपनी यात्रा अभी शुरू करें!',
    },
    '8yoh0h45': {
      'en': 'Get Started',
      'es': 'Empezar',
      'hi': 'शुरू हो जाओ',
    },
    'ymnelq5a': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // HomePage
  {
    'l1azr1uv': {
      'en': '__',
      'es': '__',
      'hi': '__',
    },
  },
  // CreatePostPage
  {
    'emf6wkas': {
      'en': 'New Post',
      'es': 'Nueva publicación',
      'hi': 'नई पोस्ट',
    },
    '8yttqb2a': {
      'en': 'New Post',
      'es': '',
      'hi': '',
    },
    'x6i2em5f': {
      'en': 'PROMPT',
      'es': '',
      'hi': '',
    },
    'zd9j5o92': {
      'en': 'Add your post description here...',
      'es': '',
      'hi': '',
    },
    'eo2ppgux': {
      'en': 'Tag Users',
      'es': '',
      'hi': '',
    },
    '20fx0c6f': {
      'en': 'Tag Users',
      'es': '',
      'hi': '',
    },
    'gv34j8vz': {
      'en': 'Share post',
      'es': '',
      'hi': '',
    },
    't8mcp1qo': {
      'en': 'New Post',
      'es': '',
      'hi': '',
    },
    'adhopbyz': {
      'en': 'PROMPT',
      'es': '',
      'hi': '',
    },
    'a4x2bddk': {
      'en': 'Add your post description here...',
      'es': '',
      'hi': '',
    },
    'a9xqqmct': {
      'en': 'Tag Users',
      'es': '',
      'hi': '',
    },
    '18jvywyu': {
      'en': 'Tag Users',
      'es': '',
      'hi': '',
    },
    'e5dd9fz8': {
      'en': 'Share post',
      'es': '',
      'hi': '',
    },
    'nho4gn9l': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // ProfilePage
  {
    '9wpwqkx8': {
      'en': 'Profile',
      'es': 'Perfil',
      'hi': 'प्रोफ़ाइल',
    },
    'e9a8xeac': {
      'en': 'Elaine Edwards',
      'es': '',
      'hi': '',
    },
    '7rxrxrtj': {
      'en': 'elaine.edwards@google.com',
      'es': '',
      'hi': '',
    },
    'elrrt6hb': {
      'en': 'Switch to Dark Mode',
      'es': 'Cambiar al modo oscuro',
      'hi': 'डार्क मोड पर स्विच करें',
    },
    'h3qqk2e3': {
      'en': 'Switch to Light Mode',
      'es': 'Cambiar al modo de luz',
      'hi': 'लाइट मोड पर स्विच करें',
    },
    'joia5szx': {
      'en': 'Account Settings',
      'es': 'Configuraciones de la cuenta',
      'hi': 'अकाउंट सेटिंग',
    },
    'z28rltyf': {
      'en': 'Change Password',
      'es': 'Cambia la contraseña',
      'hi': 'पासवर्ड बदलें',
    },
    'ftwe1g1w': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'hi': 'प्रोफ़ाइल संपादित करें',
    },
    '4tpei1i6': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'hi': 'लॉग आउट',
    },
    'g4by1mf5': {
      'en': '__',
      'es': '__',
      'hi': '__',
    },
  },
  // EditProfile
  {
    'id3w77mr': {
      'en': 'Display Name',
      'es': 'Nombre para mostrar',
      'hi': 'प्रदर्शित होने वाला नाम',
    },
    '20cuw6f8': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'hi': 'उपयोगकर्ता नाम',
    },
    'yz681zxt': {
      'en': 'Update Profile',
      'es': 'Actualización del perfil',
      'hi': 'प्रोफ़ाइल को नवीनतम बनाओ',
    },
    '2smd85zc': {
      'en': 'Edit Profile',
      'es': '',
      'hi': '',
    },
    'uy63lxjb': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // chatpage
  {
    'yqf0iip6': {
      'en': 'AI Assistant',
      'es': '',
      'hi': '',
    },
    'l5mftf4n': {
      'en': 'Online',
      'es': '',
      'hi': '',
    },
    'h4xgaojs': {
      'en': 'Type your message...',
      'es': '',
      'hi': '',
    },
    'rybwdbjg': {
      'en': 'Conversations',
      'es': '',
      'hi': '',
    },
    '5f19er2a': {
      'en': 'Search conversations...',
      'es': '',
      'hi': '',
    },
    '2eqzu17i': {
      'en': 'AI',
      'es': '',
      'hi': '',
    },
    'v7i08ykf': {
      'en': 'Travel Planning',
      'es': '',
      'hi': '',
    },
    'eolxwkgi': {
      'en': 'Let\'s plan your next vacation!',
      'es': '',
      'hi': '',
    },
    '3pg11uzv': {
      'en': 'AI',
      'es': '',
      'hi': '',
    },
    'h571d4e2': {
      'en': 'Fitness Coach',
      'es': '',
      'hi': '',
    },
    '8drk3qmy': {
      'en': 'Your personalized workout plan',
      'es': '',
      'hi': '',
    },
    'nwtkg015': {
      'en': 'AI',
      'es': '',
      'hi': '',
    },
    'uugl353x': {
      'en': 'Recipe Assistant',
      'es': '',
      'hi': '',
    },
    'nhjz1y77': {
      'en': 'Cooking made easy!',
      'es': '',
      'hi': '',
    },
    'nzs3f8o1': {
      'en': '__',
      'es': '',
      'hi': '',
    },
  },
  // allChatsPage
  {
    'c3nmpbwr': {
      'en': 'Conversations',
      'es': '',
      'hi': '',
    },
    'drzraak3': {
      'en': 'Search conversations...',
      'es': '',
      'hi': '',
    },
    '74ws2fmx': {
      'en': 'AI',
      'es': '',
      'hi': '',
    },
    'kdmvruqi': {
      'en': 'Travel Planning',
      'es': '',
      'hi': '',
    },
    'w0ngrxfe': {
      'en': '__',
      'es': '',
      'hi': '',
    },
  },
  // AuthSheet
  {
    '0n19brqx': {
      'en': 'Sign In',
      'es': 'Registrarse',
      'hi': 'साइन इन करें',
    },
    'gyro46ff': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'rtj25ur3': {
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico',
      'hi': 'अपना ईमेल दर्ज करें',
    },
    's2vb9zvd': {
      'en': 'Password',
      'es': 'Clave',
      'hi': 'पासवर्ड',
    },
    'm8ysityp': {
      'en': 'Enter your password',
      'es': 'Ingresa tu contraseña',
      'hi': 'अपना पासवर्ड डालें',
    },
    'uczx858h': {
      'en': 'Don\'t have an account?',
      'es': '¿No tienes una cuenta?',
      'hi': 'खाता नहीं है?',
    },
    'ayjh6vgq': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'hi': 'साइन अप करें',
    },
    '6yqvvuss': {
      'en': 'Login',
      'es': 'Acceso',
      'hi': 'लॉग इन करें',
    },
    '6ybuvoop': {
      'en': 'Or use a social account to sign in',
      'es': 'O use una cuenta social para iniciar sesión',
      'hi': 'या साइन इन करने के लिए सोशल अकाउंट का उपयोग करें',
    },
    'cofw3l4f': {
      'en': 'Please enter your email',
      'es': 'Por favor introduzca su correo electrónico',
      'hi': 'अपना ईमेल दर्ज करें',
    },
    'nob7t76m': {
      'en': 'Please enter a correct email',
      'es': 'Por favor ingrese un correo electrónico correcto',
      'hi': 'कृपया एक सही ईमेल दर्ज करें',
    },
    '3fk10ebg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '1iwwt5rb': {
      'en': 'Please enter your password',
      'es': 'Por favor, introduzca su contraseña',
      'hi': 'अपना पासवर्ड दर्ज करें',
    },
    '378t4w15': {
      'en': 'Please enter a password having greater than 6 characters',
      'es': 'Ingrese una contraseña que tenga más de 6 caracteres',
      'hi': 'कृपया 6 वर्णों से अधिक का पासवर्ड दर्ज करें',
    },
    'r3ru546x': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'urj3a01o': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'hi': 'खाता बनाएं',
    },
    'nixsfpbd': {
      'en': 'Name',
      'es': 'Nombre',
      'hi': 'नाम',
    },
    'we3aclq8': {
      'en': 'Enter your name',
      'es': 'Introduzca su nombre',
      'hi': 'अपना नाम दर्ज करें',
    },
    'vj8jh8jm': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'n3v8wmqw': {
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico',
      'hi': 'अपना ईमेल दर्ज करें',
    },
    'qze6enr4': {
      'en': 'Password',
      'es': 'Clave',
      'hi': 'पासवर्ड',
    },
    'zwh9qj52': {
      'en': 'Enter your password',
      'es': 'Ingresa tu contraseña',
      'hi': 'अपना पासवर्ड डालें',
    },
    '3z5403hk': {
      'en': 'Confirm Password',
      'es': 'Confirmar contraseña',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
    },
    'q5r1r24f': {
      'en': 'Confirm your password',
      'es': 'Confirmar la contraseña',
      'hi': 'अपने पासवर्ड की पुष्टि करें',
    },
    'udpfrk4e': {
      'en': 'Already have an account?',
      'es': '¿Ya tienes una cuenta?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
    },
    '8bmfmq7n': {
      'en': 'Login',
      'es': 'Acceso',
      'hi': 'लॉग इन करें',
    },
    'f47xi40i': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'hi': 'साइन अप करें',
    },
    'cqgmhm43': {
      'en': 'Or use a social account to sign up',
      'es': 'O use una cuenta social para registrarse',
      'hi': 'या साइन अप करने के लिए सोशल अकाउंट का उपयोग करें',
    },
    '3fb482sl': {
      'en': 'Please enter your name',
      'es': 'por favor, escriba su nombre',
      'hi': 'अपना नाम दर्ज करें',
    },
    'nt6b7tt5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    '6ksfaaiw': {
      'en': 'Please enter your email',
      'es': 'Por favor introduzca su correo electrónico',
      'hi': 'अपना ईमेल दर्ज करें',
    },
    'ucqz0ad1': {
      'en': 'Please enter a correct email',
      'es': 'Por favor ingrese un correo electrónico correcto',
      'hi': 'कृपया एक सही ईमेल दर्ज करें',
    },
    '4vvv5avn': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'tcafayzn': {
      'en': 'Please enter a password',
      'es': 'porfavor ingrese una contraseña',
      'hi': 'कृपया पासवर्ड दर्ज करें',
    },
    '1o2gpbgp': {
      'en': 'Password should have at least 6 characters',
      'es': 'La contraseña debe tener al menos 6 caracteres',
      'hi': 'पासवर्ड में कम से कम 6 अक्षर होने चाहिए',
    },
    'e30i3tbo': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
    'dh3oorrf': {
      'en': 'Please confirm the password',
      'es': 'Por favor confirme la contraseña',
      'hi': 'कृपया पासवर्ड की पुष्टि करें',
    },
    'zx3mv395': {
      'en': 'Password should have at least 6 characters',
      'es': 'La contraseña debe tener al menos 6 caracteres',
      'hi': 'पासवर्ड में कम से कम 6 अक्षर होने चाहिए',
    },
    'fqvo56nd': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
    },
  },
  // WecomeMessage
  {
    '428l0fdf': {
      'en': 'Open up your',
      'es': 'Abre tu',
      'hi': 'अपना खोलो',
    },
    'pwb2nohv': {
      'en': 'creative boundries',
      'es': 'fronteras creativas',
      'hi': 'रचनात्मक सीमाएँ',
    },
  },
  // PreviewGeneratedArt
  {
    '5cas44jn': {
      'en': 'Generated Result',
      'es': '',
      'hi': '',
    },
    'l55bc2ge': {
      'en': 'Do you want to continue with this generated art?',
      'es': '¿Quieres seguir con este arte generado?',
      'hi': 'क्या आप इस सृजित कला को जारी रखना चाहते हैं?',
    },
    '3wlhbn3q': {
      'en': 'Continue',
      'es': 'Continuar',
      'hi': 'जारी रखना',
    },
    '4ciat98o': {
      'en': 'Regenerate',
      'es': 'Regenerado',
      'hi': 'पुनः जेनरेट',
    },
  },
  // PostCard
  {
    'bl7979tf': {
      'en': 'Like',
      'es': 'Me gusta',
      'hi': 'पसंद करना',
    },
  },
  // UpdatePhoto
  {
    'vjsdwm9h': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
      'hi': 'तस्वीर बदलिये',
    },
    'xck2hxm7': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'es':
          'Cargue una nueva foto a continuación para cambiar su avatar visto por otros.',
      'hi':
          'दूसरों द्वारा देखे गए अपने अवतार को बदलने के लिए नीचे एक नया फोटो अपलोड करें।',
    },
    '7uqtzvmm': {
      'en': 'Upload Image',
      'es': 'Cargar imagen',
      'hi': 'तस्विर अपलोड करना',
    },
    '1aljwn49': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'hi': 'परिवर्तनों को सुरक्षित करें',
    },
  },
  // modal_Post
  {
    'cooyk9ri': {
      'en': 'Comments',
      'es': '',
      'hi': '',
    },
    't6xjhq2q': {
      'en': 'Erica B.',
      'es': '',
      'hi': '',
    },
    '3qeditr0': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'es': '',
      'hi': '',
    },
    'lsg6ydef': {
      'en': 'Posted',
      'es': '',
      'hi': '',
    },
    '2ti0n71i': {
      'en': 'A few moments ago',
      'es': '',
      'hi': '',
    },
    'zduyg7ot': {
      'en': 'Elena Rodriguez',
      'es': '',
      'hi': '',
    },
    '776x1nph': {
      'en': 'Incredible work my friend.',
      'es': '',
      'hi': '',
    },
    '7iz57qlf': {
      'en': 'Posted',
      'es': '',
      'hi': '',
    },
    'xyhq2my2': {
      'en': 'A few moments ago',
      'es': '',
      'hi': '',
    },
    'p7oxrz47': {
      'en': 'Rod Stanton',
      'es': '',
      'hi': '',
    },
    '6vih546m': {
      'en': 'This is wonderful!',
      'es': '',
      'hi': '',
    },
    'lr65apr2': {
      'en': 'Posted',
      'es': '',
      'hi': '',
    },
    'kppgd708': {
      'en': 'A few moments ago',
      'es': '',
      'hi': '',
    },
  },
  // SideNav_2
  {
    '0ev7kbec': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
    'gxk63736': {
      'en': 'Chats',
      'es': '',
      'hi': '',
    },
    'qef6plls': {
      'en': 'Bookmarks',
      'es': '',
      'hi': '',
    },
    'rx6t162c': {
      'en': 'Andrew D.',
      'es': '',
      'hi': '',
    },
    'wl4q3bdr': {
      'en': 'Admin',
      'es': '',
      'hi': '',
    },
  },
  // loadingState
  {
    'wyrr1r6f': {
      'en': 'Generating image...',
      'es': '',
      'hi': '',
    },
    'mc71j9ti': {
      'en': 'Still working, your art will look fantastic...',
      'es': '',
      'hi': '',
    },
  },
  // EmptyList
  {
    '62932hqz': {
      'en': 'No Robot Art',
      'es': '',
      'hi': '',
    },
    '5r47o601': {
      'en':
          'You need to create some art!! Tap the button below in order to create posts.',
      'es': '',
      'hi': '',
    },
  },
  // botMessageComponent
  {
    '5my1x7hm': {
      'en': 'AI',
      'es': '',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'nmun44uk': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '2i3x1gxy': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'mex2uq7g': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'vvtzv20s': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'jcncc3xo': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '3lpdhc2m': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'k6smdlil': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'bueoyczw': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'vpdxilsw': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'hs5ae0fq': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'nuqiqycb': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'b7x3ldqu': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '6rq9khgn': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'heqrffsm': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'qf8h4b6d': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'lbzkpbzz': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'n74shr1d': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '4e1zc1rl': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '9vat02l9': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'pat7rwte': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '5nccv3io': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'lwgsqkhb': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'd7lg8q8c': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '5xhhvrp1': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'q427l1r3': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'p7q6gpxm': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '0vbs98ds': {
      'en': '',
      'es': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
