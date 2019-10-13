import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_app/pages/match_result_page.dart';

class SelectSignsPage extends StatefulWidget {
  @override
  _SelectSignsPageState createState() => _SelectSignsPageState();
}

class _SelectSignsPageState extends State<SelectSignsPage> {
  /// sizedbox height between rows in the list of signs
  final double _signSBHeight = 30;

  /// icon size for male and female
  final double _iconSize = 15;

  /// opacity for selected sign
  final double _signSelOpacity = 1;

  /// opacity for not selected sign
  final double _signNotSelOpacity = 0.3;

  /// color for selected sign box in the list of signs
  final Color _colorSelSignBox = Color(0xffe52270);

  /// color for not selected sign box in the list of signs
  final Color _colorNotSelSignBox = Color(0xff2a2446);

  /// color for borders in the selected sign box in the list of signs
  final Color _colorSelSignBord = Color(0xffe52270);

  /// color for borders in the not selected sign box in the list of signs
  final Color _colorNotSelSignBord = Colors.white;

  /// color for selected sign name in the list of signs
  final Color _colorSelSignNameSB = Color(0xffe52270);

  /// color for unselected sign name in the list of signs
  final Color _colorNotSelSignNameSB = Colors.white;

  /// color for selected sign name
  final Color _colorSelSignName = Color(0xff696677);

  /// current edit sex is male?
  bool _isSelectingMale = true;

  /// current edit mode is female?
  bool _isSelectingFemale = false;

  /// current id in the list of signs
  String _selectedSignId;

  /// selected sign id for male
  String _selectedSignIdMale;

  /// selected sign for female
  String _selectedSignIdFemale;

  /// default image, when user did not select sign
  static Image _defaultSignImg = Image.asset('assets/icons/question.png');

  /// selected sign icon for male
  Image _selectedSignImgMale = _defaultSignImg;

  /// selected sign icon for female
  Image _selectedSignImgFemale = _defaultSignImg;

  /// selected sign name for male
  String _selectedSignNameMale = '- -';

  /// selected sign name for female
  String _selectedSignNameFemale = '- -';

  /// user selected signs for matching?
  bool _isSignsSelected = false;

  /// id for Aquarius (0)
  final String _idAquarius = 'aquarius';

  /// id for Pisces (1)
  final String _idPisces = 'pisces';

  /// id for Aries (2)
  final String _idAries = 'aries';

  /// id for Taurus (3)
  final String _idTaurus = 'Taurus';

  /// id for Gemini (4)
  final String _idGemini = 'gemini';

  /// id for Cancer (5)
  final String _idCancer = 'cancer';

  /// id for Leo (6)
  final String _idLeo = 'leo';

  /// id for Virgo (7)
  final String _idVirgo = 'virgo';

  /// id for Libra (8)
  final String _idLibra = 'libra';

  /// id for Scorpio (9)
  final String _idScorpio = 'scorpio';

  /// id for Sagitarius (10)
  final String _idSagitarius = 'sagitarius';

  /// id for Capricorn (11)
  final String _idCapricorn = 'capricorn';

  /// image for Aquarius (0)
  final Image _imageAquarius = Image.asset('assets/icons/aquarius.png');

  /// image for Pisces (1)
  final Image _imagePisces = Image.asset('assets/icons/pisces.png');

  /// image for Aries (2)
  final Image _imageAries = Image.asset('assets/icons/aries.png');

  /// image for Taurus (3)
  final Image _imageTaurus = Image.asset('assets/icons/taurus.png');

  /// image for Gemini (4)
  final Image _imageGemini = Image.asset('assets/icons/gemini.png');

  /// image for Cancer (5)
  final Image _imageCancer = Image.asset('assets/icons/cancer.png');

  /// image for Leo (6)
  final Image _imageLeo = Image.asset('assets/icons/leo.png');

  /// image for Virgo (7)
  final Image _imageVirgo = Image.asset('assets/icons/virgo.png');

  /// image for Libra (8)
  final Image _imageLibra = Image.asset('assets/icons/libra.png');

  /// image for Scorpio (9)
  final Image _imageScorpio = Image.asset('assets/icons/scorpio.png');

  /// image for Sagitarius (10)
  final Image _imageSagitarius = Image.asset('assets/icons/sagitarius.png');

  /// image for Capricorn (11)
  final Image _imageCapricorn = Image.asset('assets/icons/capricorn.png');

  /// title for Aquarius (0)
  final String _titleAquarius = 'Aquarius';

  /// title for Pisces (1)
  final String _titlePisces = 'Pisces';

  /// title for Aries (2)
  final String _titleAries = 'Aries';

  /// title for Taurus (3)
  final String _titleTaurus = 'Taurus';

  /// title for Gemini (4)
  final String _titleGemini = 'Gemini';

  /// title for Cancer (5)
  final String _titleCancer = 'Cancer';

  /// title for Leo (6)
  final String _titleLeo = 'Leo';

  /// title for Virgo (7)
  final String _titleVirgo = 'Virgo';

  /// title for Libra (8)
  final String _titleLibra = 'Libra';

  /// title for Scorpio (9)
  final String _titleScorpio = 'Scorpio';

  /// title for Sagitarius (10)
  final String _titleSagitarius = 'Sagitarius';

  /// title for Capricorn (11)
  final String _titleCapricorn = 'Capricorn';

  /// dates for Aquarius (0)
  final String _datesAquarius = '01/20-02/18';

  /// dates for Pisces (1)
  final String _datesPisces = '02/19-03/20';

  /// dates for Aries (2)
  final String _datesAries = '03/21-04/19';

  /// dates for Taurus (3)
  final String _datesTaurus = '04/20-05/20';

  /// dates for Gemini (4)
  final String _datesGemini = '05/21-06/21';

  /// dates for Cancer (5)
  final String _datesCancer = '06/22-07/22';

  /// dates for Leo (6)
  final String _datesLeo = '07/23-08/22';

  /// dates for Virgo (7)
  final String _datesVirgo = '08/23-09/22';

  /// dates for Libra (8)
  final String _datesLibra = '09/23-10/22';

  /// dates for Scorpio (9)
  final String _datesScorpio = '10/23-11/21';

  /// dates for Sagitarius (10)
  final String _datesSagitarius = '11/22-12/21';

  /// dates for Capricorn (11)
  final String _datesCapricorn = '12/22-01/19';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select signs to match'),
          backgroundColor: Color(0xff0f0b26),
        ),
        body: Column(
          children: <Widget>[
            /// top panel for selected sign icons, name, triangles
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xff0f0b26),
                child:

                    /// selected signs for male and female
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /// selected male sign, icon, triangle
                    Row(
                      children: <Widget>[
                        /// male icon
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Opacity(
                            opacity: _isSelectingMale
                                ? _signSelOpacity
                                : _signNotSelOpacity,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xff35aefd),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/icons/male.png',
                                    height: _iconSize,
                                  ),
                                )),
                          ),
                        ),

                        /// selected male sign icon, name and triangle
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),

                            /// selected male sign icon
                            Transform.rotate(
                                angle: pi / 4,
                                child: Opacity(
                                  opacity: _isSelectingMale
                                      ? _signSelOpacity
                                      : _signNotSelOpacity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffaa5cf0),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: <Widget>[
                                        Transform.rotate(
                                          angle: -pi / 4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                                icon: _selectedSignImgMale,
                                                onPressed: _selectingSignsMale),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(height: 8),

                            /// selected male sign name
                            Opacity(
                              opacity: _isSelectingMale
                                  ? _signSelOpacity
                                  : _signNotSelOpacity,
                              child: Text(_selectedSignNameMale,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _colorSelSignName)),
                            ),

                            /// male triangle
                            Icon(
                              _isSelectingMale ? Icons.keyboard_arrow_up : null,
                              color: Color(0xff2a2446),
                              size: 40,
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// love icon
                    Image.asset('assets/icons/love.png', height: 80),

                    /// selected female sign, icon, triangle
                    Row(
                      children: <Widget>[
                        /// selected female sign icon, name and triangle
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),

                            /// selected female sign icon
                            Transform.rotate(
                                angle: pi / 4,
                                child: Opacity(
                                  opacity: _isSelectingFemale
                                      ? _signSelOpacity
                                      : _signNotSelOpacity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffaa5cf0),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: <Widget>[
                                        Transform.rotate(
                                          angle: -pi / 4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                                icon: _selectedSignImgFemale,
                                                onPressed:
                                                    _selectingSignsFemale),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            /// female sign name
                            Opacity(
                                opacity: _isSelectingFemale
                                    ? _signSelOpacity
                                    : _signNotSelOpacity,
                                child: Text(
                                  _selectedSignNameFemale,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _colorSelSignName),
                                )),

                            /// female triangle
                            Icon(
                              _isSelectingFemale
                                  ? Icons.keyboard_arrow_up
                                  : null,
                              size: 40,
                              color: Color(0xff2a2446),
                            ),
                          ],
                        ),

                        /// female icon
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Opacity(
                            opacity: _isSelectingFemale
                                ? _signSelOpacity
                                : _signNotSelOpacity,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xfffe4086),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/icons/female.png',
                                    height: _iconSize,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// bottom panel for the list of signs
            Expanded(
                flex: 5,
                child: Container(
                  color: _colorNotSelSignBox,

                  /// the list of signs
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: _signSBHeight,
                            ),

                            /// Aquarius, Pisces, Aries signs (0, 1, 2)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                /// Aquarius (0)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity:
                                              _selectedSignId == _idAquarius
                                                  ? _signSelOpacity
                                                  : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: _selectedSignId ==
                                                        _idAquarius
                                                    ? _colorSelSignBox
                                                    : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idAquarius
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageAquarius,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idAquarius,
                                                                _imageAquarius,
                                                                _titleAquarius)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idAquarius
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleAquarius,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idAquarius
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                        opacity: _selectedSignId == _idAquarius
                                            ? _signSelOpacity
                                            : _signNotSelOpacity,
                                        child: Text(_datesAquarius,
                                            style: TextStyle(
                                                color: _selectedSignId ==
                                                        _idAquarius
                                                    ? _colorSelSignNameSB
                                                    : _colorNotSelSignNameSB))),
                                  ],
                                ),

                                /// Pisces(1)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idPisces
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedSignId == _idPisces
                                                        ? _colorSelSignBox
                                                        : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idPisces
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imagePisces,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idPisces,
                                                                _imagePisces,
                                                                _titlePisces)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idPisces
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titlePisces,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idPisces
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idPisces
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesPisces,
                                          style: TextStyle(
                                              color: _selectedSignId ==
                                                      _idPisces
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                ),

                                /// Aries (2)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idAries
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedSignId == _idAries
                                                        ? _colorSelSignBox
                                                        : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idAries
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageAries,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idAries,
                                                                _imageAries,
                                                                _titleAries)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idAries
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleAries,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId == _idAries
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idAries
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesAries,
                                          style: TextStyle(
                                              color: _selectedSignId == _idAries
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: _signSBHeight,
                            ),

                            /// Taurus, Gemini, Cancer signs (3, 4, 5)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                /// Taurus (3)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idTaurus
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedSignId == _idTaurus
                                                        ? _colorSelSignBox
                                                        : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idTaurus
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageTaurus,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idTaurus,
                                                                _imageTaurus,
                                                                _titleTaurus)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idTaurus
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleTaurus,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idTaurus
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idTaurus
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesTaurus,
                                          style: TextStyle(
                                              color: _selectedSignId ==
                                                      _idTaurus
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                ),

                                /// Gemini(4)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idGemini
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedSignId == _idGemini
                                                        ? _colorSelSignBox
                                                        : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idGemini
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageGemini,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idGemini,
                                                                _imageGemini,
                                                                _titleGemini)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idGemini
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleGemini,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idGemini
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idGemini
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesGemini,
                                          style: TextStyle(
                                              color: _selectedSignId ==
                                                      _idGemini
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                ),

                                /// Cancer(5)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idCancer
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedSignId == _idCancer
                                                        ? _colorSelSignBox
                                                        : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idCancer
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageCancer,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idCancer,
                                                                _imageCancer,
                                                                _titleCancer)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idCancer
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleCancer,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idCancer
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idCancer
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesCancer,
                                          style: TextStyle(
                                              color: _selectedSignId ==
                                                      _idCancer
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: _signSBHeight,
                            ),

                            /// Leo, Virgo, Libra (6, 7, 8)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                /// Leo (6)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idLeo
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: _selectedSignId == _idLeo
                                                    ? _colorSelSignBox
                                                    : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idLeo
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageLeo,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idLeo,
                                                                _imageLeo,
                                                                _titleLeo)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idLeo
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleLeo,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId == _idLeo
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idLeo
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesLeo,
                                          style: TextStyle(
                                              color: _selectedSignId == _idLeo
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                ),

                                /// Virgo (7)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idVirgo
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedSignId == _idVirgo
                                                        ? _colorSelSignBox
                                                        : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idVirgo
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageVirgo,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idVirgo,
                                                                _imageVirgo,
                                                                _titleVirgo)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idVirgo
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleVirgo,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId == _idVirgo
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idVirgo
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesVirgo,
                                          style: TextStyle(
                                              color: _selectedSignId == _idVirgo
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                ),

                                /// Libra (8)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idLibra
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedSignId == _idLibra
                                                        ? _colorSelSignBox
                                                        : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idLibra
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageLibra,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idLibra,
                                                                _imageLibra,
                                                                _titleLibra)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idLibra
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleLibra,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId == _idLibra
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idLibra
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesLibra,
                                          style: TextStyle(
                                              color: _selectedSignId == _idLibra
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: _signSBHeight,
                            ),

                            /// Scorpio, Sagitarius, Capricorn(9, 10, 11)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                /// Scorpio(9)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity: _selectedSignId == _idScorpio
                                              ? _signSelOpacity
                                              : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: _selectedSignId ==
                                                        _idScorpio
                                                    ? _colorSelSignBox
                                                    : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idScorpio
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageScorpio,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idScorpio,
                                                                _imageScorpio,
                                                                _titleScorpio)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idScorpio
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleScorpio,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idScorpio
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idScorpio
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesScorpio,
                                          style: TextStyle(
                                              color: _selectedSignId ==
                                                      _idScorpio
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                ),

                                /// Sagitarius(10)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity:
                                              _selectedSignId == _idSagitarius
                                                  ? _signSelOpacity
                                                  : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: _selectedSignId ==
                                                        _idSagitarius
                                                    ? _colorSelSignBox
                                                    : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idSagitarius
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageSagitarius,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idSagitarius,
                                                                _imageSagitarius,
                                                                _titleSagitarius)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idSagitarius
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleSagitarius,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idSagitarius
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idSagitarius
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesSagitarius,
                                          style: TextStyle(
                                              color: _selectedSignId ==
                                                      _idSagitarius
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                ),

                                /// Capricorn(11)
                                Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                        angle: pi / 4,
                                        child: Opacity(
                                          opacity:
                                              _selectedSignId == _idCapricorn
                                                  ? _signSelOpacity
                                                  : _signNotSelOpacity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: _selectedSignId ==
                                                        _idCapricorn
                                                    ? _colorSelSignBox
                                                    : _colorNotSelSignBox,
                                                border: Border.all(
                                                    color: _selectedSignId ==
                                                            _idCapricorn
                                                        ? _colorSelSignBord
                                                        : _colorNotSelSignBord,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: -pi / 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: IconButton(
                                                        icon: _imageCapricorn,
                                                        onPressed: () =>
                                                            _selectSignFromList(
                                                                _idCapricorn,
                                                                _imageCapricorn,
                                                                _titleCapricorn)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idCapricorn
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_titleCapricorn,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selectedSignId ==
                                                      _idCapricorn
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                    Opacity(
                                      opacity: _selectedSignId == _idCapricorn
                                          ? _signSelOpacity
                                          : _signNotSelOpacity,
                                      child: Text(_datesCapricorn,
                                          style: TextStyle(
                                              color: _selectedSignId ==
                                                      _idCapricorn
                                                  ? _colorSelSignNameSB
                                                  : _colorNotSelSignNameSB)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        bottomNavigationBar: Container(
            color: _colorNotSelSignBox,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                      child: Text('MATCH NOW'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      disabledColor: Color(0xff742457),
                      disabledTextColor: Colors.grey,
                      color: Color(0xffe52270),
                      height: 50,
                      minWidth: 250,
                      onPressed: _isSignsSelected
                          ? () => _navigateToMatchResult(context)
                          : null),
                ),
              ],
            )));
  }

  /// select signs for male
  void _selectingSignsMale() {
    setState(() {
      if (_isSelectingMale) {
        _isSelectingFemale = false;
      } else {
        _isSelectingFemale = false;
        _isSelectingMale = true;
      }

      /// highlight selected sign for a male in the list
      _selectedSignId = _selectedSignIdMale;
    });
  }

  /// selecting signs for female
  void _selectingSignsFemale() {
    setState(() {
      if (_isSelectingFemale) {
        _isSelectingMale = false;
      } else {
        _isSelectingMale = false;
        _isSelectingFemale = true;
      }

      /// highlight selected sign for a female in the list
      _selectedSignId = _selectedSignIdFemale;
    });
  }

  /// select sign from lists
  void _selectSignFromList(String _signId, Image _signImage, String _signName) {
    setState(() {
      _selectedSignId = _signId;

      /// if current profile is male then change selected sign icon and name
      if (_isSelectingMale) {
        _selectedSignImgMale = _signImage;
        _selectedSignNameMale = _signName;
        _selectedSignIdMale = _signId;

        /// if user does not select icon for female let's switch to this mode
        if (_selectedSignImgFemale == _defaultSignImg) {
          _isSelectingMale = false;
          _isSelectingFemale = true;

          /// clear selected signs in the list when switch to female mode
          _selectedSignId = null;
        }
      }

      /// if current profile is female then change selected sign icon and name
      else {
        _selectedSignImgFemale = _signImage;
        _selectedSignNameFemale = _signName;
        _selectedSignIdFemale = _signId;

        /// if user does not select icon for male let's switch to this mode
        if (_selectedSignImgMale == _defaultSignImg) {
          _isSelectingFemale = false;
          _isSelectingMale = true;

          /// clear selected signs in the list when switch to female mode
          _selectedSignId = null;
        }
      }

      /// if user selected signs for male and female make button active
      if (_selectedSignImgMale != _defaultSignImg) {
        if (_selectedSignImgFemale != _defaultSignImg) {
          _isSignsSelected = true;
        }
      }
    });
  }

  /// navigate to page match_result
  void _navigateToMatchResult(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => MatchResultPage(
                  imgMale: _selectedSignImgMale,
                  nameMale: _selectedSignNameMale,
                  idMale: _selectedSignIdMale,
                  imgFemale: _selectedSignImgFemale,
                  nameFemale: _selectedSignNameFemale,
                  idFemale: _selectedSignIdFemale,
                )));
  }
}
