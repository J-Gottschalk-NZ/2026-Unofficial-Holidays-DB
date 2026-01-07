-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 07, 2026 at 05:59 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `00_l3_shakespeare_2026`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Play_Cat` varchar(7) NOT NULL,
  `Category_Icon` varchar(75) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `Play_Cat`, `Category_Icon`) VALUES
(1, 'Comedy', 'cat_comedy.png'),
(2, 'History', 'cat_history.png'),
(3, 'Tragedy', 'cat_tragedy.png');

-- --------------------------------------------------------

--
-- Table structure for table `cod_action`
--

DROP TABLE IF EXISTS `cod_action`;
CREATE TABLE IF NOT EXISTS `cod_action` (
  `COD_ActionID` int NOT NULL AUTO_INCREMENT,
  `Action` varchar(18) NOT NULL,
  `Action_Icon` varchar(75) NOT NULL,
  PRIMARY KEY (`COD_ActionID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cod_action`
--

INSERT INTO `cod_action` (`COD_ActionID`, `Action`, `Action_Icon`) VALUES
(1, 'Alive', 'COD_alive.png'),
(2, 'Accident', 'COD_accident.png'),
(3, 'Death in battle', 'COD_battle.png'),
(4, 'Execution', 'COD_execution.png'),
(5, 'Murder', 'COD_murder.png'),
(6, 'Natural causes', 'COD_natural_causes.png'),
(7, 'Suicide', 'COD_suicide.png'),
(8, 'Supernatural death', 'COD_supernatural.png');

-- --------------------------------------------------------

--
-- Table structure for table `cod_method`
--

DROP TABLE IF EXISTS `cod_method`;
CREATE TABLE IF NOT EXISTS `cod_method` (
  `COD_MethodID` int NOT NULL AUTO_INCREMENT,
  `Method` varchar(20) NOT NULL,
  `Method_Icon` varchar(75) NOT NULL,
  PRIMARY KEY (`COD_MethodID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cod_method`
--

INSERT INTO `cod_method` (`COD_MethodID`, `Method`, `Method_Icon`) VALUES
(1, 'Alive', 'COD_alive_method.png'),
(2, 'arrow', 'COD_arrow.png'),
(3, 'beheading', 'COD_beheading.png'),
(4, 'bludgeoning', 'COD_bludgeon.png'),
(5, 'burning', 'COD_burning.png'),
(6, 'drowning', 'COD_drowning.png'),
(7, 'fall', 'COD_falling.png'),
(8, 'ghost/curse', 'COD_ghost_curse.png'),
(9, 'hanging', 'COD_hanging.png'),
(10, 'illness', 'COD_sickness.png'),
(11, 'old age', 'COD_oldage.png'),
(12, 'poisoning', 'COD_poison.png'),
(13, 'unknown means', 'COD_unknown.png'),
(14, 'stabbing', 'COD_stabbing.png'),
(15, 'starvation', 'COD_starvation.png'),
(16, 'strangulation', 'COD_strangulation.png');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Character_name` varchar(128) NOT NULL,
  `PlayID` int NOT NULL,
  `RoleID` int NOT NULL,
  `GenderID` int NOT NULL,
  `Moral_AlignmentID` int NOT NULL,
  `Trait_1ID` int NOT NULL,
  `Trait_2ID` int NOT NULL,
  `Trait_3ID` int NOT NULL,
  `COD_ActionID` int NOT NULL,
  `COD_MethodID` int NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Featured_Image` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`ID`, `Character_name`, `PlayID`, `RoleID`, `GenderID`, `Moral_AlignmentID`, `Trait_1ID`, `Trait_2ID`, `Trait_3ID`, `COD_ActionID`, `COD_MethodID`, `Description`, `Featured_Image`) VALUES
(1, 'Romeo Montague', 32, 1, 1, 1, 107, 73, 139, 7, 12, 'A young Montague deeply in love with Juliet; his impulsive actions lead to tragic consequences.', '01_romeo_v2.png'),
(2, 'Juliet Capulet', 32, 1, 2, 1, 76, 34, 98, 7, 14, 'A young Capulet who defies her family to be with Romeo; her love and determination are central to the play\'s tragic events.', '02_juliet_v2.png'),
(3, 'Hamlet', 27, 1, 1, 1, 92, 113, 74, 5, 14, 'Prince of Denmark who seeks to avenge his father\'s murder; his introspection and hesitation define his character.', '03_hamlet_v2.png'),
(4, 'Othello', 31, 1, 1, 1, 101, 81, 163, 7, 14, 'A Moorish general in the Venetian army; his tragic flaw of jealousy leads to devastating outcomes.', '04_othello_v2.png'),
(5, 'Lady Macbeth', 30, 1, 2, 3, 1, 90, 60, 7, 13, 'Macbeth\'s wife who spurs his ambition to become king; her descent into madness reflects her overwhelming guilt.', ''),
(6, 'King Lear', 29, 1, 1, 2, 125, 52, 161, 6, 10, 'Aging king who divides his kingdom among his daughters, leading to his downfall and madness.', ''),
(7, 'Iago', 31, 3, 1, 3, 31, 46, 90, 4, 9, 'Othello\'s ensign who orchestrates his downfall through deceit and manipulation.', ''),
(8, 'Desdemona', 31, 3, 2, 1, 76, 47, 55, 5, 16, 'Othello\'s loving and faithful wife, falsely accused of infidelity; her innocence leads to her tragic death.', ''),
(9, 'Macbeth', 30, 1, 1, 3, 1, 141, 60, 3, 14, 'Scottish nobleman whose ambition leads him to murder and tyranny; his reign ends with his death in battle.', ''),
(10, 'Cordelia', 29, 3, 2, 1, 66, 88, 19, 5, 9, 'Lear\'s youngest and most loyal daughter; her honesty and integrity contrast with her sisters\' deceit.', ''),
(11, 'Rosalind', 2, 1, 2, 1, 176, 137, 80, 1, 1, 'Disguised as Ganymede, she navigates the Forest of Arden with wit and charm, ultimately finding love.', ''),
(12, 'Shylock', 6, 1, 1, 3, 169, 57, 125, 1, 1, 'Jewish moneylender who seeks a pound of flesh as repayment; his insistence on revenge leads to his downfall.', ''),
(13, 'Portia', 6, 1, 2, 1, 80, 44, 137, 1, 1, 'Disguised as a male lawyer, she saves Antonio and demonstrates wit and intelligence.', ''),
(14, 'Cleopatra', 24, 1, 2, 1, 13, 107, 125, 7, 12, 'Queen of Egypt; her intense relationship with Antony and political maneuvers define her legacy.', '05_cleopatra.png'),
(15, 'Brutus', 28, 1, 1, 1, 67, 149, 71, 7, 14, 'Roman senator who joins the conspiracy against Caesar, believing it\'s for the greater good; his internal conflict is central to the play.', ''),
(16, 'Julius Caesar', 28, 1, 1, 2, 1, 4, 13, 5, 14, 'Roman general and statesman whose assassination leads to the downfall of the Republic.', ''),
(17, 'Bottom', 8, 1, 1, 2, 6, 16, 72, 1, 1, 'A weaver who is transformed into a donkey and becomes the focus of Titania\'s enchantment.', ''),
(18, 'Demetrius', 8, 1, 1, 2, 81, 33, 118, 1, 1, 'Initially loves Hermia but ends up enchanted and falls for Helena.', ''),
(19, 'Egeus', 8, 3, 1, 2, 4, 152, 160, 1, 1, 'Hermia\'s father, insists she marry Demetrius or face severe punishment.', ''),
(20, 'Flute', 8, 2, 1, 2, 159, 132, 76, 1, 1, 'A bellows-mender who plays the female role of Thisbe in the play within the play.', ''),
(21, 'Helena', 8, 1, 2, 1, 34, 77, 111, 1, 1, 'In love with Demetrius, even when he scorns her, and ultimately wins his heart.', ''),
(22, 'Hermia', 8, 1, 2, 1, 75, 128, 88, 1, 1, 'Defies her father\'s wishes to marry Demetrius, eloping with Lysander instead.', ''),
(23, 'Hippolyta', 8, 3, 2, 2, 131, 20, 125, 1, 1, 'Queen of the Amazons, engaged to Theseus, brings a sense of authority to the play.', ''),
(24, 'Lysander', 8, 1, 1, 1, 139, 7, 88, 1, 1, 'Deeply in love with Hermia and willing to defy the law for her.', ''),
(25, 'Oberon', 8, 1, 1, 2, 119, 81, 90, 1, 1, 'King of the Fairies, uses magic to control others\' affections.', ''),
(26, 'Philostrate', 8, 2, 1, 2, 42, 88, 134, 1, 1, 'Theseus’ master of revels, responsible for organizing the entertainment at the wedding feast.', ''),
(27, 'Puck', 8, 1, 1, 2, 94, 14, 115, 1, 1, 'Oberon\'s jester and a trickster spirit who causes chaos with his magic, leading to confusion.', ''),
(28, 'Snug', 8, 2, 1, 2, 148, 159, 24, 1, 1, 'A craftsman who plays the lion in the play, worried his acting might scare the ladies.', ''),
(29, 'Starveling', 8, 2, 1, 2, 91, 100, 42, 1, 1, 'A tailor who plays Moonshine, concerned about following the rules in the play.', ''),
(30, 'Theseus', 8, 1, 1, 1, 4, 82, 101, 1, 1, 'Duke of Athens, engaged to Hippolyta, upholds law but shows mercy to the young lovers.', ''),
(31, 'Titania', 8, 1, 2, 2, 125, 152, 87, 1, 1, 'Queen of the fairies, argues with Oberon over a changeling boy, falls under a love spell.', '06_titania.png'),
(32, 'Parolles', 1, 3, 1, 3, 25, 6, 30, 1, 1, 'A soldier who pretends to be brave but is revealed as a coward, ultimately disgraced.', ''),
(33, 'Widow', 1, 3, 2, 2, 124, 147, 12, 1, 1, 'Diana\'s mother, helps Helena with her plan to trick Bertram into fulfilling his vows.', ''),
(34, 'Agrippa', 24, 2, 1, 2, 88, 150, 103, 1, 1, 'A loyal follower of Octavius, a Roman general who supports the move against Antony.', ''),
(35, 'Antony', 24, 1, 1, 1, 107, 125, 150, 7, 14, 'A Roman general torn between duty to Rome and love for Cleopatra, leading to his downfall.', ''),
(36, 'Charmian', 24, 3, 2, 2, 88, 176, 124, 7, 12, 'Cleopatra’s maid, devoted to her mistress, takes her own life following Cleopatra’s death.', ''),
(37, 'Dolabella', 24, 2, 1, 2, 42, 66, 155, 1, 1, 'An officer under Octavius who shows sympathy for Cleopatra after Antony’s death.', ''),
(38, 'Enobarbus', 24, 3, 1, 2, 29, 88, 78, 6, 10, 'Antony’s loyal follower who deserts him, then dies from guilt and heartbreak.', ''),
(39, 'Eros', 24, 2, 1, 1, 88, 8, 42, 7, 14, 'Antony’s servant who, unable to kill his master, takes his own life instead.', ''),
(40, 'Iras', 24, 3, 2, 2, 88, 45, 34, 7, 12, 'Cleopatra’s maid, follows her mistress in death, showing unwavering loyalty.', ''),
(41, 'Lepidus', 24, 2, 1, 2, 37, 108, 88, 1, 1, 'A member of the Roman triumvirate, politically outmaneuvered by Octavius and Antony.', ''),
(42, 'Octavius Caesar', 24, 1, 1, 1, 1, 150, 15, 1, 1, 'Future Emperor Augustus, Octavius is politically astute and decisive in his quest for power.', ''),
(43, 'Celia', 2, 1, 2, 1, 88, 19, 176, 1, 1, 'The daughter of Duke Frederick, follows Rosalind into exile, showing love and loyalty.', ''),
(44, 'Duke Frederick', 2, 1, 1, 3, 165, 81, 63, 1, 1, 'The usurper Duke who banishes his brother and Rosalind, ruling with fear and suspicion.', ''),
(45, 'Duke Senior', 2, 1, 1, 1, 175, 83, 101, 1, 1, 'The rightful Duke living in exile in the Forest of Arden, embodying calm wisdom and fairness.', ''),
(46, 'Jaques', 2, 1, 1, 2, 92, 113, 104, 1, 1, 'A nobleman in exile, known for his reflective nature and famous \"All the world\'s a stage\" speech.', ''),
(47, 'Oliver', 2, 1, 1, 3, 26, 46, 133, 1, 1, 'Orlando\'s older brother, initially abusive but later redeems himself through love and guilt.', ''),
(48, 'Orlando', 2, 1, 1, 1, 8, 139, 88, 1, 1, 'A young nobleman who defies injustice and wins Rosalind\'s heart with courage and devotion.', ''),
(49, 'Phoebe', 2, 3, 2, 2, 125, 39, 168, 1, 1, 'A shepherdess who scorns Silvius’ love, fixating instead on Ganymede (Rosalind in disguise).', ''),
(50, 'Silvius', 2, 3, 1, 1, 34, 52, 139, 1, 1, 'A lovesick shepherd hopelessly devoted to Phoebe, showcasing the extremes of romantic pursuit.', ''),
(51, 'Touchstone', 2, 3, 1, 2, 176, 29, 14, 1, 1, 'The court jester who provides comic relief and sharp commentary on life and love.', ''),
(52, 'Aufidius', 25, 1, 1, 3, 169, 125, 50, 5, 14, 'The leader of the Volscians, Aufidius is Coriolanus’ bitter enemy and eventual killer.', ''),
(53, 'Cominius', 25, 1, 1, 1, 88, 37, 101, 1, 1, 'A Roman general and friend to Coriolanus, known for his reasoned and steady leadership.', ''),
(54, 'Coriolanus', 25, 1, 1, 1, 125, 8, 3, 5, 14, 'A Roman warrior whose disdain for the common people leads to his downfall.', ''),
(55, 'Menenius', 25, 1, 1, 2, 175, 112, 88, 1, 1, 'A Roman senator who tries to mediate between Coriolanus and the public.', ''),
(56, 'Sicinius', 25, 3, 1, 3, 90, 1, 9, 1, 1, 'A tribune of the people who works against Coriolanus’ interests.', ''),
(57, 'Titus Lartius', 25, 3, 1, 1, 8, 88, 38, 1, 1, 'A Roman general who supports Coriolanus in his military campaigns.', ''),
(58, 'Virgilia', 25, 3, 2, 2, 88, 126, 87, 1, 1, 'Coriolanus’ wife, a gentle and devoted figure who contrasts with his fierce mother.', ''),
(59, 'Volumnia', 25, 1, 2, 2, 125, 90, 109, 1, 1, 'A powerful matriarch who pushes Coriolanus to seek political power, shaping his fate.', ''),
(60, 'Young Martius', 25, 2, 1, 2, 8, 98, 88, 1, 1, 'The young son of Coriolanus, representing innocence and future potential.', ''),
(61, 'Arviragus', 26, 1, 1, 1, 8, 88, 101, 1, 1, 'One of Cymbeline\'s sons, raised in secret but ultimately a key figure in restoring justice.', ''),
(62, 'Belarius', 26, 1, 1, 1, 175, 124, 88, 1, 1, 'A banished nobleman who raises Cymbeline\'s sons in secret, acting as a father figure.', ''),
(63, 'Caius Lucius', 26, 3, 1, 2, 37, 101, 10, 1, 1, 'A Roman general who negotiates with Cymbeline and represents imperial authority.', ''),
(64, 'Cloten', 26, 1, 1, 3, 3, 52, 170, 5, 3, 'The Queen\'s son, a violent and foolish antagonist whose actions lead to his downfall.', ''),
(65, 'Cornelius', 26, 3, 1, 2, 175, 88, 12, 1, 1, 'A physician who helps Cymbeline and resists the Queen’s attempts at poisoning.', ''),
(66, 'Cymbeline', 26, 1, 1, 2, 125, 152, 101, 1, 1, 'The King of Britain, whose poor decisions are eventually corrected by his children.', ''),
(67, 'Guiderius', 26, 1, 1, 1, 8, 88, 50, 5, 3, 'Cymbeline\'s son, raised in secrecy, ultimately avenges injustice and helps restore order.', ''),
(68, 'Iachimo', 26, 1, 1, 3, 27, 90, 30, 1, 1, 'The main antagonist, whose schemes test the loyalty and virtue of Imogen.', ''),
(69, 'Imogen', 26, 1, 2, 1, 171, 88, 8, 1, 1, 'The daughter of Cymbeline, known for her courage and faithfulness despite many trials.', ''),
(70, 'Jupiter', 26, 2, 1, 2, 119, 40, 18, 1, 1, 'A Roman god who appears in a vision to Posthumus, offering reassurance.', ''),
(71, 'Lady', 26, 3, 2, 3, 31, 90, 143, 1, 1, 'Cymbelineâ€™s Queen, a deceitful stepmother who plots against Imogen.', ''),
(72, 'Philario', 26, 2, 1, 2, 88, 164, 154, 1, 1, 'A friend of Posthumus who provides shelter and counsel in Rome.', ''),
(73, 'Posthumus', 26, 1, 1, 1, 67, 8, 47, 1, 1, 'A nobleman banished by Cymbeline, proving his loyalty through trials.', ''),
(74, 'Sicilius Leonatus', 26, 2, 1, 2, 8, 88, 101, 6, 11, 'Deceased father of Posthumus; appears as a spirit to offer encouragement.', ''),
(75, 'Claudius', 27, 1, 1, 3, 90, 1, 31, 5, 14, 'The antagonist of Hamlet, Claudius murders the king to claim the throne.', ''),
(76, 'Gertrude', 27, 3, 2, 2, 87, 22, 99, 1, 12, 'Queen of Denmark, caught between loyalty to her son and new husband.', ''),
(77, 'Ghost of Hamlet\'s Father', 27, 3, 1, 1, 169, 101, 96, 8, 8, 'Former king whose ghost urges Hamlet to avenge his murder.', ''),
(78, 'Guildenstern', 27, 3, 1, 2, 103, 167, 42, 4, 9, 'Messenger sent to England with Hamlet, executed upon arrival.', ''),
(79, 'Horatio', 27, 3, 1, 1, 88, 175, 10, 1, 1, 'Hamlet’s trusted friend and confidant, survives to tell the tale.', ''),
(80, 'Laertes', 27, 3, 1, 2, 169, 73, 67, 3, 12, 'Seeks revenge for his father\'s and sister\'s deaths, duels Hamlet.', ''),
(81, 'Ophelia', 27, 3, 2, 2, 76, 103, 58, 7, 6, 'Young noblewoman driven to madness after her father\'s death.', ''),
(82, 'Polonius', 27, 3, 1, 2, 157, 143, 102, 5, 14, 'Court advisor who is accidentally killed by Hamlet while spying.', ''),
(83, 'Rosencrantz', 27, 3, 1, 2, 103, 23, 42, 4, 9, 'Sent with Hamlet to England, unknowingly carries his own death orders.', ''),
(84, 'Sailor', 27, 2, 1, 2, 88, 65, 166, 1, 1, 'A minor character who brings Hamlet\'s letter after his escape.', ''),
(85, 'Duke of Clarence', 23, 3, 1, 2, 163, 117, 172, 5, 6, 'Brother to kings, imprisoned and killed by drowning in a wine butt.', ''),
(86, 'Lady Percy', 15, 3, 2, 2, 21, 88, 151, 1, 1, 'Wife of Hotspur, tries to persuade him from reckless decisions.', ''),
(87, 'Prince Hal', 15, 1, 1, 1, 13, 128, 80, 1, 1, 'Heir to the throne who transforms from a wayward prince to a responsible leader.', ''),
(88, 'Falstaff', 15, 3, 1, 2, 16, 84, 14, 6, 10, 'A comical knight known for drinking, wit, and cowardice in battle.', ''),
(89, 'Henry V', 17, 1, 1, 1, 101, 150, 79, 6, 11, 'King of England who led troops to victory at Agincourt, famed for speeches.', ''),
(90, 'Joan la Pucelle', 18, 1, 2, 3, 27, 13, 90, 4, 5, 'Also known as Joan of Arc, she leads the French against the English but is eventually captured and executed.', ''),
(91, 'Suffolk', 18, 3, 1, 3, 1, 31, 120, 5, 3, 'A scheming nobleman responsible for bringing Queen Margaret to England.', ''),
(92, 'Talbot', 18, 1, 1, 1, 8, 88, 156, 3, 2, 'A fearless English commander who fights valiantly against the French but dies in battle.', ''),
(93, 'Margaret', 18, 1, 2, 3, 141, 1, 120, 1, 1, 'A strong and determined queen, known for her political maneuvering and fierce nature.', ''),
(94, 'Warwick', 18, 1, 1, 2, 150, 88, 122, 5, 14, 'A key figure in the Wars of the Roses, switching sides multiple times.', ''),
(95, 'Clifford', 18, 3, 1, 3, 169, 88, 26, 5, 14, 'A nobleman who seeks revenge against the House of York.', ''),
(96, 'Edward IV', 18, 1, 1, 1, 13, 150, 8, 6, 11, 'The Yorkist king who takes the throne from Henry VI during the Wars of the Roses.', ''),
(97, 'Richard, Duke of Gloucester', 18, 1, 1, 3, 1, 27, 31, 1, 1, 'The future Richard III, a scheming and ruthless nobleman.', ''),
(98, 'Archibald, Earl of Douglas', 15, 3, 1, 3, 8, 129, 125, 3, 14, 'A Scottish nobleman and warrior who allies with the Percies against King Henry IV.', ''),
(99, 'Thomas, Duke of Clarence', 15, 2, 1, 2, 88, 42, 134, 1, 1, 'Younger brother of Prince Hal, he remains loyal to his family and the crown.', ''),
(100, 'Lady Percy', 15, 3, 2, 2, 34, 21, 107, 1, 1, 'Hotspur\'s wife, deeply concerned about her husband\'s involvement in rebellion.', ''),
(101, 'Prince John of Lancaster', 15, 3, 1, 1, 8, 88, 150, 1, 1, 'Younger son of King Henry IV, known for his courage and loyalty.', ''),
(102, 'Sir Walter Blunt', 15, 3, 1, 1, 47, 8, 37, 3, 14, 'A nobleman and close ally of King Henry IV, serving as a commander in his army.', ''),
(103, 'Henry Percy (Hotspur)', 15, 1, 1, 3, 73, 8, 70, 3, 14, 'Fiery and valiant nobleman, leading the rebellion against King Henry IV.', ''),
(104, 'Edmund Mortimer', 15, 3, 1, 2, 37, 88, 12, 1, 1, 'A claimant to the English throne, captured by Glendower and married his daughter.', ''),
(105, 'Owen Glendower', 15, 3, 1, 3, 97, 125, 44, 1, 1, 'Welsh nobleman and leader, believed to have magical powers, leading a rebellion against England.', ''),
(106, 'Bardolph', 15, 3, 1, 2, 16, 88, 41, 4, 9, 'A comical character known for his red face and association with Falstaff.', ''),
(107, 'Sir John Falstaff', 15, 1, 1, 2, 176, 56, 25, 1, 1, 'A fat, witty, and corrupt knight, serving as a companion to Prince Hal.', ''),
(108, 'King Henry IV', 15, 1, 1, 1, 131, 162, 4, 6, 10, 'The ruling King of England, dealing with rebellion and his son\'s wayward behavior.', ''),
(109, 'Mistress Quickly', 15, 3, 2, 2, 69, 62, 157, 1, 1, 'The hostess of the Boar\'s Head Tavern, known for her hospitality and naivety.', ''),
(110, 'Edward Poins', 15, 3, 1, 2, 94, 14, 88, 1, 1, 'A close companion of Prince Hal, involved in various pranks and schemes.', ''),
(111, 'Prince Hal (Henry, Prince of Wales)', 15, 1, 1, 1, 13, 128, 80, 1, 1, 'Heir to the throne who transforms from a wayward prince to a responsible leader.', ''),
(112, 'Charles VI', 17, 2, 1, 2, 89, 140, 32, 6, 10, 'King of France depicted as mentally unstable, contributing to weak leadership.', ''),
(113, 'Bardolph', 17, 3, 1, 2, 41, 88, 17, 4, 9, 'Comic relief character who follows Henry but is hanged for theft.', ''),
(114, 'Dauphin', 17, 3, 1, 3, 3, 125, 95, 3, 2, 'French prince who mocks Henry and dies in battle at Agincourt.', ''),
(115, 'Exeter', 17, 3, 1, 1, 37, 88, 8, 1, 1, 'Trusted advisor and ambassador for Henry V during the war in France.', ''),
(116, 'Fluellen', 17, 3, 1, 1, 110, 8, 88, 1, 1, 'Welsh officer in Henry’s army, known for his discipline and odd manner of speech.', ''),
(117, 'Gower', 17, 2, 1, 1, 88, 121, 66, 1, 1, 'English captain who works with Fluellen, often providing commentary on events.', ''),
(118, 'Henry V', 17, 1, 1, 1, 13, 150, 8, 6, 10, 'Once a wayward prince, he becomes a decisive and inspiring king and warrior.', ''),
(119, 'Katherine', 17, 3, 2, 2, 116, 28, 37, 1, 1, 'French princess who becomes queen through her marriage to Henry V.', ''),
(120, 'Montjoy', 17, 2, 1, 2, 53, 138, 88, 1, 1, 'French herald who delivers messages with dignity between Henry and the French court.', ''),
(121, 'Nym', 17, 3, 1, 2, 29, 59, 142, 4, 9, 'A disgruntled former soldier known for his curt speech and bitterness.', ''),
(122, 'Pistol', 17, 3, 1, 2, 6, 17, 25, 1, 1, 'Comic character full of bluster, who pretends to be brave but avoids danger.', ''),
(123, 'Duke of York', 17, 3, 1, 1, 8, 101, 109, 3, 14, 'English nobleman who dies heroically at the Battle of Agincourt.', ''),
(124, 'Henry VI', 18, 1, 1, 2, 114, 174, 98, 5, 14, 'Gentle and devout king whose reign is marred by civil war and his own fragility.', ''),
(125, 'Brutus', 28, 1, 1, 1, 68, 22, 127, 7, 14, 'Roman senator who kills Caesar for the Republic but later dies by his own hand.', ''),
(126, 'Calpurnia', 28, 2, 2, 2, 153, 11, 88, 1, 1, 'Caesar\'s wife who dreams of his death and pleads with him to stay home.', ''),
(127, 'Casca', 28, 3, 1, 3, 29, 121, 142, 7, 14, 'One of Caesar’s assassins, known for delivering the first stab.', ''),
(128, 'Cassius', 28, 1, 1, 3, 90, 81, 80, 7, 14, 'Leader of the conspiracy against Caesar, driven by envy and political motives.', ''),
(129, 'Cicero', 28, 3, 1, 2, 175, 86, 12, 4, 3, 'Orator and statesman who is executed during the power struggles after Caesar’s death.', ''),
(130, 'Cinna', 28, 3, 1, 3, 43, 88, 2, 5, 4, 'Mistaken for another Cinna, he is killed by an angry mob after Caesar’s death.', ''),
(131, 'Decius Brutus', 28, 3, 1, 3, 112, 90, 31, 4, 14, 'A Roman senator and member of the conspiracy against Julius Caesar; he persuades Caesar to attend the Senate on the Ides of March.', ''),
(132, 'Ligarius', 28, 2, 1, 3, 88, 33, 177, 4, 14, 'Despite being ill, Ligarius joins the conspiracy against Caesar, demonstrating his commitment to the cause.', ''),
(133, 'Lucilius', 28, 3, 1, 1, 88, 8, 145, 3, 14, 'A loyal officer to Brutus who attempts to protect him during the battle by impersonating him, showing his dedication.', ''),
(134, 'Metellus Cimber', 28, 2, 1, 3, 90, 150, 31, 4, 14, 'He distracts Caesar by pleading for his brother\'s repeal, allowing the conspirators to attack.', ''),
(135, 'Mark Antony', 28, 1, 1, 2, 13, 27, 1, 1, 1, 'A skilled orator and politician, Antony avenges Caesar\'s death and seeks power in Rome.', ''),
(136, 'Louis the Dauphin', 20, 3, 1, 3, 1, 105, 33, 1, 1, 'Seizes the opportunity to claim the English throne, leading French forces against England.', ''),
(137, 'Antipholus of Syracuse', 3, 1, 1, 1, 23, 33, 88, 1, 1, 'One of two twin brothers separated in childhood; his misidentification drives the farcical misunderstandings.', ''),
(138, 'Octavius Caesar', 28, 1, 1, 1, 1, 4, 150, 6, 11, 'Caesar\'s adopted son and heir; he rises to power after Caesar\'s assassination.', ''),
(139, 'Berowne (Biron)', 4, 1, 1, 2, 176, 144, 139, 1, 1, 'A clever and witty member of the King’s court who values learning and love, often using humour to mask uncertainty.', ''),
(140, 'Pindarus', 28, 2, 1, 2, 88, 103, 132, 7, 14, 'Cassius\'s bondman who assists in his suicide and then gains his freedom.', ''),
(141, 'Isabella', 5, 1, 2, 1, 171, 35, 136, 1, 1, 'A novice about to enter a convent whose moral strength and pleas for justice challenge the Duke\'s deputy.', ''),
(142, 'Strato', 28, 2, 1, 2, 88, 19, 42, 7, 14, 'Holds Brutus\'s sword for him to commit suicide, showing loyalty to his master.', ''),
(143, 'Mistress Ford', 7, 1, 2, 2, 121, 14, 124, 1, 1, 'A married woman who conspires with Mistress Page to expose Falstaff’s advances, using wit and resourcefulness.', ''),
(144, 'Titinius', 28, 2, 1, 2, 88, 8, 67, 7, 14, 'After finding Cassius dead, he takes his own life out of loyalty and grief.', ''),
(145, 'Beatrice', 9, 1, 2, 1, 146, 176, 75, 1, 1, 'An intelligent and outspoken woman who sparrs verbally with Benedick before recognizing her love for him.', ''),
(146, 'Arthur', 20, 3, 1, 1, 76, 172, 163, 1, 7, 'A young prince with a claim to the throne, whose tragic fate is central to the play\'s conflict.', ''),
(147, 'Katherina (Kate)', 10, 1, 2, 2, 64, 51, 125, 1, 1, 'A spirited and quick-tempered woman whose relationship with Petruchio explores themes of marriage and social roles.', ''),
(148, 'Cardinal Pandulph', 20, 3, 1, 2, 90, 4, 112, 1, 1, 'The Pope\'s representative who excommunicates King John and plays a key role in the political dynamics.', ''),
(149, 'Prospero', 11, 1, 1, 1, 85, 169, 124, 1, 1, 'The rightful Duke of Milan who uses magic to restore his daughter and reclaim his dukedom, balancing revenge with mercy.', ''),
(150, 'Constance', 20, 3, 2, 2, 107, 58, 33, 1, 1, 'Fiercely advocates for her son\'s right to the throne, displaying intense emotion and resolve.', ''),
(151, 'Viola', 12, 1, 2, 1, 137, 88, 104, 1, 1, 'Shipwrecked and disguised as a young man, she navigates Illyria’s romantic entanglements and shows courage and wit.', ''),
(152, 'Hubert', 20, 3, 1, 2, 88, 19, 22, 1, 1, 'Tasked with harming Arthur, he ultimately shows mercy, revealing his inner conflict.', ''),
(153, 'Proteus', 13, 1, 1, 2, 49, 139, 61, 1, 1, 'A friend who betrays his companion and pursues another man\'s love, embodying the play’s conflicts of friendship and desire.', ''),
(154, 'King John', 20, 1, 1, 2, 1, 77, 4, 8, 12, 'His reign is marked by political turmoil and personal challenges, leading to his demise.', ''),
(155, 'Leontes', 14, 1, 1, 3, 81, 106, 152, 1, 1, 'A king whose irrational jealousy destroys relationships and sets in motion loss and eventual repentance and restoration.', ''),
(156, 'King Henry IV', 16, 1, 1, 1, 162, 131, 130, 6, 10, 'The aging king struggles with illness, guilt over rebellion, and the consequences of his reign as he nears death.', ''),
(157, 'Peter of Pomfret', 20, 2, 1, 2, 123, 48, 66, 4, 9, 'A prophet who foretells John\'s downfall, leading to his execution.', ''),
(158, 'Queen Katherine (Katherine of Aragon)', 19, 1, 2, 1, 36, 114, 135, 1, 1, 'The virtuous first wife of Henry VIII whose steadfast conduct during marital and political turmoil defines her role.', ''),
(159, 'Richard II', 22, 1, 1, 2, 131, 77, 158, 5, 16, 'The deposed king whose loss of authority, pride, and poetic sensibility lead to his downfall and violent end.', ''),
(160, 'Timon of Athens', 33, 1, 1, 2, 54, 5, 93, 7, 15, 'A wealthy Athenian whose extreme generosity is repaid with ingratitude; he retreats into misanthropy and dies alone.', ''),
(161, 'Titus Andronicus', 34, 1, 1, 1, 149, 169, 68, 5, 14, 'A Roman general whose cycle of revenge and brutality leads to horrific personal losses and violent reprisals.', ''),
(162, 'Cressida', 35, 1, 2, 2, 173, 107, 22, 1, 1, 'A Trojan woman whose changing affections and the complex ethics of love and honour are central to the play\'s ambiguity.', ''),
(165, 'Tybalt\'s description', 32, 2, 1, 3, 70, 184, 184, 5, 14, 'Tybalt\'s Description Edited again', '');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `GenderID` int NOT NULL AUTO_INCREMENT,
  `M_or_F` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender_Icon` varchar(75) NOT NULL,
  PRIMARY KEY (`GenderID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`GenderID`, `M_or_F`, `Gender_Icon`) VALUES
(1, 'Male', 'gender_male_icon.png'),
(2, 'Female', 'gender_female_icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `key_traits`
--

DROP TABLE IF EXISTS `key_traits`;
CREATE TABLE IF NOT EXISTS `key_traits` (
  `TraitID` int NOT NULL AUTO_INCREMENT,
  `Trait` varchar(40) NOT NULL,
  PRIMARY KEY (`TraitID`)
) ENGINE=MyISAM AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `key_traits`
--

INSERT INTO `key_traits` (`TraitID`, `Trait`) VALUES
(1, 'Ambitious'),
(2, 'Anxious'),
(3, 'Arrogant'),
(4, 'Authoritative'),
(5, 'Bitter'),
(6, 'Boastful'),
(7, 'Bold'),
(8, 'Brave'),
(9, 'Calculating'),
(10, 'Calm'),
(11, 'Caring'),
(12, 'Cautious'),
(13, 'Charismatic'),
(14, 'Clever'),
(15, 'Cold'),
(16, 'Comedic'),
(17, 'Comic'),
(18, 'Commanding'),
(19, 'Compassionate'),
(20, 'Composed'),
(21, 'Concerned'),
(22, 'Conflicted'),
(23, 'Confused'),
(24, 'Cooperative'),
(25, 'Cowardly'),
(26, 'Cruel'),
(27, 'Cunning'),
(28, 'Curious'),
(29, 'Cynical'),
(30, 'Deceitful'),
(31, 'Deceptive'),
(32, 'Delusional'),
(33, 'Determined'),
(34, 'Devoted'),
(35, 'Devout'),
(36, 'Dignified'),
(37, 'Diplomatic'),
(38, 'Disciplined'),
(39, 'Dismissive'),
(40, 'Divine'),
(41, 'Drunken'),
(42, 'Dutiful'),
(43, 'Eager'),
(44, 'Eloquent'),
(45, 'Emotional'),
(46, 'Envious'),
(47, 'Faithful'),
(48, 'Fearless'),
(49, 'Fickle'),
(50, 'Fierce'),
(51, 'Fiery'),
(52, 'Foolish'),
(53, 'Formal'),
(54, 'Generous'),
(55, 'Gentle'),
(56, 'Gluttonous'),
(57, 'Greedy'),
(58, 'Grieving'),
(59, 'Grumpy'),
(60, 'Guilt-ridden'),
(61, 'Guilty'),
(62, 'Gullible'),
(63, 'Harsh'),
(64, 'Headstrong'),
(65, 'Helpful'),
(66, 'Honest'),
(67, 'Honorable'),
(68, 'Honourable'),
(69, 'Hospitable'),
(70, 'Hot-headed'),
(71, 'Idealistic'),
(72, 'Imaginative'),
(73, 'Impulsive'),
(74, 'Indecisive'),
(75, 'Independent'),
(76, 'Innocent'),
(77, 'Insecure'),
(78, 'Insightful'),
(79, 'Inspirational'),
(80, 'Intelligent'),
(81, 'Jealous'),
(82, 'Just'),
(83, 'Kind'),
(84, 'Lazy'),
(85, 'Learned'),
(86, 'Logical'),
(87, 'Loving'),
(88, 'Loyal'),
(89, 'Mad'),
(90, 'Manipulative'),
(91, 'Meek'),
(92, 'Melancholic'),
(93, 'Misanthropic'),
(94, 'Mischievous'),
(95, 'Mocking'),
(96, 'Mournful'),
(97, 'Mystical'),
(98, 'Naive'),
(99, 'Naïve'),
(100, 'Nervous'),
(101, 'Noble'),
(102, 'Nosy'),
(103, 'Obedient'),
(104, 'Observant'),
(105, 'Opportunistic'),
(106, 'Paranoid'),
(107, 'Passionate'),
(108, 'Passive'),
(109, 'Patriotic'),
(110, 'Pedantic'),
(111, 'Persistent'),
(112, 'Persuasive'),
(113, 'Philosophical'),
(114, 'Pious'),
(115, 'Playful'),
(116, 'Polite'),
(117, 'Political'),
(118, 'Possessive'),
(119, 'Powerful'),
(120, 'Power-hungry'),
(121, 'Practical'),
(122, 'Pragmatic'),
(123, 'Prophetic'),
(124, 'Protective'),
(125, 'Proud'),
(126, 'Quiet'),
(127, 'Rational'),
(128, 'Rebellious'),
(129, 'Reckless'),
(130, 'Reflective'),
(131, 'Regal'),
(132, 'Reluctant'),
(133, 'Repentant'),
(134, 'Reserved'),
(135, 'Resilient'),
(136, 'Resolute'),
(137, 'Resourceful'),
(138, 'Respectful'),
(139, 'Romantic'),
(140, 'Royal'),
(141, 'Ruthless'),
(142, 'Sarcastic'),
(143, 'Scheming'),
(144, 'Scholarly'),
(145, 'Selfless'),
(146, 'Sharp-tongued'),
(147, 'Shrewd'),
(148, 'Simple'),
(149, 'Stoic'),
(150, 'Strategic'),
(151, 'Strong-willed'),
(152, 'Stubborn'),
(153, 'Superstitious'),
(154, 'Supportive'),
(155, 'Sympathetic'),
(156, 'Tactician'),
(157, 'Talkative'),
(158, 'Theatrical'),
(159, 'Timid'),
(160, 'Traditional'),
(161, 'Tragic'),
(162, 'Troubled'),
(163, 'Trusting'),
(164, 'Trustworthy'),
(165, 'Tyrannical'),
(166, 'Unnamed'),
(167, 'Unsuspecting'),
(168, 'Vain'),
(169, 'Vengeful'),
(170, 'Violent'),
(171, 'Virtuous'),
(172, 'Vulnerable'),
(173, 'Wavering'),
(174, 'Weak'),
(175, 'Wise'),
(176, 'Witty'),
(177, 'Zealous'),
(178, 'Generous'),
(179, 'Loyal'),
(180, 'Melancholic'),
(181, 'Generous'),
(182, 'Loyal'),
(183, 'Melancholic'),
(184, 'n/a');

-- --------------------------------------------------------

--
-- Table structure for table `moral_alignment`
--

DROP TABLE IF EXISTS `moral_alignment`;
CREATE TABLE IF NOT EXISTS `moral_alignment` (
  `Moral_AlignmentID` int NOT NULL AUTO_INCREMENT,
  `Alignment` varchar(40) NOT NULL,
  `Moral_Icon` varchar(75) NOT NULL,
  PRIMARY KEY (`Moral_AlignmentID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `moral_alignment`
--

INSERT INTO `moral_alignment` (`Moral_AlignmentID`, `Alignment`, `Moral_Icon`) VALUES
(1, 'Hero', 'Moral_Hero.png'),
(2, 'Neutral', 'Moral_Neutral.png'),
(3, 'Villain', 'Moral_villain.png');

-- --------------------------------------------------------

--
-- Table structure for table `ms_role`
--

DROP TABLE IF EXISTS `ms_role`;
CREATE TABLE IF NOT EXISTS `ms_role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `Role` varchar(31) NOT NULL,
  `Role_Icon` varchar(75) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ms_role`
--

INSERT INTO `ms_role` (`RoleID`, `Role`, `Role_Icon`) VALUES
(1, 'Major', 'role_major_v2.png'),
(2, 'Minor', 'role_minor_v2.png'),
(3, 'Supporting', 'role_support_v2.png');

-- --------------------------------------------------------

--
-- Table structure for table `play_name`
--

DROP TABLE IF EXISTS `play_name`;
CREATE TABLE IF NOT EXISTS `play_name` (
  `PlayID` int NOT NULL AUTO_INCREMENT,
  `Play` varchar(128) NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`PlayID`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `play_name`
--

INSERT INTO `play_name` (`PlayID`, `Play`, `CategoryID`) VALUES
(1, 'All\'s Well That Ends Well', 1),
(2, 'As You Like It', 1),
(3, 'Comedy of Errors', 1),
(4, 'Love\'s Labour\'s Lost', 1),
(5, 'Measure for Measure', 1),
(6, 'The Merchant of Venice', 1),
(7, 'Merry Wives of Windsor', 1),
(8, 'A Midsummer Night\'s Dream', 1),
(9, 'Much Ado about Nothing', 1),
(10, 'Taming of the Shrew', 1),
(11, 'Tempest', 1),
(12, 'Twelfth Night', 1),
(13, 'Two Gentlemen of Verona', 1),
(14, 'Winter\'s Tale', 1),
(15, 'Henry IV, Part I', 2),
(16, 'Henry IV, Part II', 2),
(17, 'Henry V', 2),
(18, 'Henry VI', 2),
(19, 'Henry VIII', 2),
(20, 'King John', 2),
(21, 'Pericles', 2),
(22, 'Richard II', 2),
(23, 'Richard III', 2),
(24, 'Antony and Cleopatra', 3),
(25, 'Coriolanus', 3),
(26, 'Cymbeline', 3),
(27, 'Hamlet', 3),
(28, 'Julius Caesar', 3),
(29, 'King Lear', 3),
(30, 'Macbeth', 3),
(31, 'Othello', 3),
(32, 'Romeo and Juliet', 3),
(33, 'Timon of Athens', 3),
(34, 'Titus Andronicus', 3),
(35, 'Troilus and Cressida', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `username`, `password`) VALUES
(1, 'admin', '$2a$12$UBHY0flikPBH.5Z2MB1VMOWi8SvZJPkBv0KF7zxIJs2s6vfSoYiu.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
