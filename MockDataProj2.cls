public class MockDataProj2 {
    public static void dataInput() {
        
        //quiz mock data
        list<Quiz__c> quizList = new list<Quiz__c>();
        
        		quizList.add(new quiz__c(Name='Math 101',
                                        Category__c	='Math'));
                quizList.add(new quiz__c(Name='English 101',
                                        Category__c	='English'));
                quizList.add(new quiz__c(Name='History 101',
                                        Category__c	='History'));
                quizList.add(new quiz__c(Name='Science 101',
                                        Category__c	='Science'));
       
        //inserting into the database for quiz
         database.insert(quizList);
        
        ////////////////////////////////////////////////
        
        //query through the quiz to get name and id
        list<Quiz__c> queryQuiz = [Select Name, Id From Quiz__c];
        
        //creating questions
        list<Question__c> questionList = new list<Question__c>();
        //looping through and connecting quiz to questions
        for(Quiz__c getQuizID: queryQuiz) {
            if(getQuizID.Name == 'Math 101') {
                questionList.add(new question__c(Question__c='1+1=',
                                                A__c='1',
                                                B__c='2',
                                                C__c='3',
                                                D__c='4',
                                                Answer__c='B',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='2x2=',
                                                A__c='1',
                                                B__c='2',
                                                C__c='3',
                                                D__c='4',
                                                Answer__c='D',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='9x9=',
                                                A__c='101',
                                                B__c='91',
                                                C__c='81',
                                                D__c='71',
                                                Answer__c='C',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='7x8=',
                                                A__c='49',
                                                B__c='56',
                                                C__c='64',
                                                D__c='54',
                                                Answer__c='B',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='5x6=',
                                                A__c='35',
                                                B__c='30',
                                                C__c='25',
                                                D__c='40',
                                                Answer__c='B',
                                                Quiz__c=getQuizID.id));
            } else if(getQuizID.Name == 'English 101') {
                questionList.add(new question__c(Question__c='PRO_ECT 2',
                                                A__c='A',
                                                B__c='O',
                                                C__c='J',
                                                D__c='E',
                                                Answer__c='C',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='SKEL_TON',
                                                A__c='E',
                                                B__c='C',
                                                C__c='L',
                                                D__c='E',
                                                Answer__c='C',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='S_LVER',
                                                A__c='I',
                                                B__c='C',
                                                C__c='P',
                                                D__c='M',
                                                Answer__c='A',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='QUESTI_NS',
                                                A__c='T',
                                                B__c='P',
                                                C__c='D',
                                                D__c='O',
                                                Answer__c='D',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='DEVE_OPER',
                                                A__c='O',
                                                B__c='P',
                                                C__c='A',
                                                D__c='L',
                                                Answer__c='D',
                                                Quiz__c=getQuizID.id));
            } else if(getQuizID.Name == 'History 101') {
                questionList.add(new question__c(Question__c='Declaration of Independence was created',
                                                A__c='1722',
                                                B__c='1726',
                                                C__c='1776',
                                                D__c='1774',
                                                Answer__c='C',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='First Thanksgiving was celebrated on',
                                                A__c='1621',
                                                B__c='1524',
                                                C__c='1660',
                                                D__c='1702',
                                                Answer__c='A',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='Hitler was in the ____ war',
                                                A__c='First World',
                                                B__c='Second World',
                                                C__c='Vietnam World',
                                                D__c='Iraq World',
                                                Answer__c='A',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='World War 2 began on',
                                                A__c='1945',
                                                B__c='1939',
                                                C__c='1922',
                                                D__c='1930',
                                                Answer__c='B',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='World War 2 ended on',
                                                A__c='1945',
                                                B__c='1939',
                                                C__c='1922',
                                                D__c='1930',
                                                Answer__c='A',
                                                Quiz__c=getQuizID.id));
            } else if(getQuizID.Name == 'Science 101') {
                questionList.add(new question__c(Question__c='Water is',
                                                A__c='H20',
                                                B__c='C02',
                                                C__c='H1',
                                                D__c='HC02',
                                                Answer__c='A',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='Atoms is composed of a ___',
                                                A__c='Picometers',
                                                B__c='Nucleus',
                                                C__c='Isotop',
                                                D__c='Ultron',
                                                Answer__c='B',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='Neutron is a ___',
                                                A__c='Reactor',
                                                B__c='Ionizing Particle',
                                                C__c='Transmutation',
                                                D__c='Subatomic Particle',
                                                Answer__c='D',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='20% of Earths oxygen is produced by ____',
                                                A__c='Amazon Rainforest',
                                                B__c='Atlantic Ocean',
                                                C__c='Buildings',
                                                D__c='a Garden',
                                                Answer__c='A',
                                                Quiz__c=getQuizID.id));
                questionList.add(new question__c(Question__c='Hawaii moves 7.5cm closer to ____ every year',
                                                A__c='Alaska',
                                                B__c='New York',
                                                C__c='Mexico',
                                                D__c='Cuba',
                                                Answer__c='A',
                                                Quiz__c=getQuizID.id));
            }
        }
        
        //inserting into the database for questions
        database.insert(questionList);
        
        ////////////////////////////////////////////////
        
        //creating teams
        list<Team__c> nTeam = new list<Team__c>();
        nTeam.add(new team__c(Name='Winner'));
        nTeam.add(new team__c(Name='Loser'));
        
        //inserting team into database
        database.insert(nTeam);
        
        ////////////////////////////////////////////////
        
        //querying teams
        list<Team__c> queryTeam = [Select id, Name From Team__c];
       
        //inserting players
        list<Player__c> nPlayer = new list<Player__c>();
        for(Team__c loopTeam: queryTeam) {
            if (loopTeam.Name == 'Winner') {
                nPlayer.add(new player__c(Name='Joe',
                                         Team__c=loopTeam.Id, Rank__c=100, Quiz_Average__c=100, Points__c=1000));
            } else if (loopTeam.Name == 'Loser') {
                nPlayer.add(new player__c(Name='Frank',
                                         Team__c=loopTeam.Id, Rank__c=0, Quiz_Average__c=0, Points__c=0));
                nPlayer.add(new player__c(Name='Jabed',
                                         Team__c=loopTeam.Id, Rank__c=0, Quiz_Average__c=0, Points__c=0));
                nPlayer.add(new player__c(Name='Auroiah',
                                         Team__c=loopTeam.Id, Rank__c=0, Quiz_Average__c=0, Points__c=0));
                nPlayer.add(new player__c(Name='Farkhod',
                                         Team__c=loopTeam.Id, Rank__c=0, Quiz_Average__c=0, Points__c=0));
                nPlayer.add(new player__c(Name='Ben',
                                         Team__c=loopTeam.Id, Rank__c=0, Quiz_Average__c=0, Points__c=0));
            }
        }
        //inserting players into database
        database.insert(nPlayer);
        
        ////////////////////////////////////////////////
        
        //creating attempts
        list<Attempt__c> nAttempt = new list<Attempt__c>();
        
        //querying the quiz and player to add into attempt
        list<Quiz__c> queryQuiz2 = [Select id, Name From Quiz__c];
        list<Player__c> queryPlayer2 = [Select id, Name From Player__c];
        
        //inserting attempts
        for(Player__c loopingPlayer: queryPlayer2) {
            for(Quiz__c loopingQuiz: queryQuiz2) {
                nAttempt.add(new Attempt__c(Quiz__c=loopingQuiz.Id, Player__c=loopingPlayer.id));
            }
        }
        //inserting attempt into the database
        database.insert(nAttempt);
        
        ////////////////////////////////////////////////
    }
}
