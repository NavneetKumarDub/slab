#include<stdio.h>
#define MAX 3
int stack[MAX];
int top = -1;
void push(int x){
    if(top == MAX-1){
        printf("Stack overflow\n");
    }
    else{
        stack[++top] = x;
        printf("%d is pushed into the stack",x);
    }
}
int pop(){
    if(top == -1){
        printf("Stack Undeflow\n");
    }
    else{
        int temp = stack[top--];
        printf("Top element = %d delteted \n",temp);
        return temp;
    }
}
int peek(){
    if(top == -1){
        printf("Stack is empty\n");
    }
    else{
        printf("Top element = %d\n",stack[top]);
    }
}
void display(){
    if(top == -1){
        printf("Stack is empty");
    }
    else{
        printf("Elements of stack are : \n");
        for(int i = 0;i<=top;i++){
            printf("%d,",stack[i]);
        }
    }

}
int main(){
    int value;
    int choice;
    while(1){
        printf("\n Enter your choice : \n");
        printf("1.push,2.pop,3.peek,4.display,5.exit : ");
        scanf("%d",&choice);

        switch(choice){
            case 1:
                printf("Enter the value to push : ");
                scanf("%d",&value);
                push(value);
                break;
            case 2:
                printf("%d is delted from top",pop());
                break;
            case 3:
                peek();
                break;
            case 4:
                display();
                break;
            case 5:
                printf("Exiting.....");
                return 0;
            default :
                printf("Wrong choice enter again\n");
                break;
        }
    }
    return 0;
}
