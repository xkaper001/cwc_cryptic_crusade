class AppConstants {
  // Ceaser Cipher
  // LOCATION : Lab Complex
  static const String level1Description =
      "The encrypted string uses a Caesar Cipher with a shift of ~(first 3 digit prime number).";
  static const String level1Flag = "key1";
//   static const String level1Flag = "th3g4m3b3g1n5";
  static const String level1Riddle =
      "Lq d jodvv wrzhu zkhuh lghdv ljqlwh, Odev iru wkh ixwxuh, d gdccolqj vljkw. Zkdw dp L, zkhuh nqrzohgjh hasdqgv, Lq uhdopv ri whfk fudiwhg eb vnloohg kdqgv?";

  // Vigenere Cipher
  // LOCATION : Architecture Building
  static const String level2Description =
      "The encrypted string uses a Vigenere Cipher, but who knows, what is the key? ;)";
  static const String level2Flag = "key2";
//   static const String level2Flag = "jum4nj14dv3ntur3";
  static const String level2Riddle =
      """W uafa ahtp zuzclsmo kelenn tjk akp, Fem jv beqlpkeutl ky sdaacaaz pewf taapr iwyt. Vhhslaz hxhk wbpoig eas pwsll, Xbt gk hrvdls hn joeqtnl hpnx eas awsll. Soam wt I, peah t jhmx poam ipseahdl, Soeka setnuigc oaillnl, poonco nh wycaeaevp setzz?""";
  static const String level2DecryptedRiddle =
      """A name that suggests design and art, Yet no blueprints or sketches play their part. Classes held within its walls, But no arches or columns line its halls. What am I, with a name that misleads, Where learning happens, though no architect leads?""";
  // DECRYPTED : A name that suggests design and art, Yet no blueprints or sketches play their part. Classes held within its walls, But no arches or columns line its halls. What am I, with a name that misleads, Where learning happens, though no architect leads?

  // Atbash Cipher
  // LOCATION : Lion's Statue
  static const String level3Description =
      """key the get to it Decode .Cipher Atbash uses string encrypted the that is ,easy what's But ?hard read to way this Isn't.""";
  static const String level3Flag = "key3";
//   static const String level3Flag = "w3lc0m3t0th3jungl3";
  static const String level3Riddle =
      """Nb gsilzg'h mlg hliv, Gsl R xzm mvevi ilzi. R hsrmv yirtsg wfirmt gsv wzb, R zn gsv hbnylo lu gsv qfmtov gszg b'zoo hzb.""";

  // Side Quest
  // LOCATION : AB 5th floor washroom.
  static const String sideQuestDescription =
      """First 6 letters of the sha256 hash of this is key to decode the riddle."""; // 1eb796
  static const String sideQuestFlag = "th3r0ck1sc00l";
  static const String sideQuestRiddle =
      """I drank too much water but I wish I was there on top of the fort. Because I didn't care what I did there to be, coz all I wanted is to pee.""";

  // No Cipher
  // LOCATION : Chemistry Lab
  static const String level4Description =
      """This is not an encrypted string. Tho the location can be decrypted using your common sense.""";
  static const String level4Flag = "f1ghtt0surv1v3";
  static const String level4Riddle =
      """CH4 + 2O2 -> CO2 + 2H2O. H2 + Cl2 -> 2HCl. CaCO3 -> CaO + CO2. 2Na + 2H2O -> 2NaOH + H2. N2 + 3H2 -> 2NH3. 2KClO3 -> 2KCl + 3O2. C6H12O6 + 6O2 -> 6CO2 + 6H2O. H2SO4 + 2NaOH -> Na2SO4 + 2H2O. Zn + 2HCl -> ZnCl2 + H2. 4Fe + 3O2 -> 2Fe2O3.""";

  // Rail Cipher
  // LOCATION :
  static const String level5Description = """""";
  static const String level5Flag = "";
  static const String level5Riddle = """""";

  // Morse Code
  static const String level6Description = """""";
  static const String level6Flag = "";
  static const String level6Riddle = """""";

  // Hash
  static const String level7Description = """The key is the first 8 letters of the sha512 hash of a string in the Auditorium.""";
  static const String level7Flag = "";
  static const String level7Riddle = """""";


  // th3g4m3b3g1n5 // Lab Complex Outside
  // welc0m3t0th3jungl3 // Lion's Den
  // th3r0ck1sc00l // Flag
  // f1ghtt0surv1v3 // Chemistry Lab
  // th3jungl3ch4ll3ng3 // Main entrance of the fort (Front of Academic Block)
  // p1ckupth3p1ec3s // Architecture building
  // jumanj1adv3ntur3 //
  // 15th15th33nd
}
