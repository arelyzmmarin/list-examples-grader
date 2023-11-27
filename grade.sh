CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -f `student-submission/ListExamples` ]
then
    echo "found file"
else 
    echo "did not find file"
fi
cp student-submission/ListExamples.java grading-area
#cd grading-area
javac ListExamples.java TestListExamples.java
if [[$? -ne 0]]
then    
    echo "Compile Error"
    exit
else
    echo "Compile Successful"
fi
passed = 0
failed = 0
for test-file in grading-area
do
    result = `java ListExamples`
    expect = `java TestListExamples`
    if [[$expect == $result]]
    then
        passed = $(($passed+1))
    else
        failed = $(($failed+1))
    fi
done
    echo "$1: Test results: $passed passed, $failed failed" > result.txt





# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
