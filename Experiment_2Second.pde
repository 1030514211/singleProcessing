Work[] work=new Work[4];

boolean SJF=false;
boolean FCFS=false;
boolean HRN=false;
boolean work0=false;
boolean work1=false;
boolean work2=false;
boolean work3=false;
boolean sort=false;

int[] a=new int[4];
int[] b=new int[4];
int[] xx=new int[4];
float[] yy=new float[4];
float[] Hrn=new float[4];

class Work
{
  PVector location;
  int r;
  char a;
  int rr;
  int atime;
  int endtime;
  int turnaroundTime;
  float wtime;
  int waitTime;
  
  Work(char name, int x, int y, int arrivetime, int runtime, int w)
  {
    location=new PVector(x, y);
    r=runtime;
    a=name;
    rr=w;
    atime=arrivetime;
  }

  void display1()
  {
    fill(rr, 140, 110);
    rect(location.x, location.y, 65, 65);
    textSize(20); 
    fill(0);
    text(a, location.x, location.y+20);
    textSize(30);
    text(r, location.x+24, location.y+50);
    textSize(20);
    text(atime, location.x+27, location.y+20);
    
  }  

  void display2()
  {
    fill(rr, 140, 110);
    rect(location.x, location.y+100, 65, 65);
    textSize(20); 
    fill(0);
    text(a, location.x, location.y+100+20);
    textSize(30);
    text(r, location.x+24, location.y+50+100);
    textSize(20);
    text(atime, location.x+27, location.y+100+20);
  }
}

//only run one time
void setup() {
  size(940, 600);
  background(255, 204, 0);


  pushStyle();
  rect(700, 520, 65, 65);
  textSize(20);    
  fill(0);
  text("sort", 715, 557); 
  popStyle();

  pushStyle();
  rect(700, 430, 65, 65);
  textSize(20);    
  fill(0);
  text("SJF", 718, 468); 
  popStyle();

  pushStyle();
  rect(700, 340, 65, 65);
  textSize(20);    
  fill(0);
  text("FCFS", 713, 377); 
  popStyle();

  pushStyle();
  rect(700, 250, 65, 65);
  textSize(20);    
  fill(0);
  text("HRN", 713, 287); 
  popStyle();

  pushStyle();
  fill(50, 190, 0);
  rect(30, 250, 72, 72);
  textSize(20);    
  fill(0);
  text("CPU", 45, 287); 
  popStyle();

  work[0]=new Work('A', 100, 50, 1, (int)random(1,5), 0);  
  work[1]=new Work('B', 200, 50, 2, (int)random(9,14), 145);   
  work[2]=new Work('C', 300, 50, 3, 9, 210); 
  work[3]=new Work('D', 400, 50, 4, (int)random(2,8), 255);
  for (int i=0; i<4; i++) {
    work[i].display1();
  }
  text("Before", 30, 90);
  if (SJF) {
    sort();
  }
  work0=true;
  //sort=false;
  for (int i=0; i<4; i++) {
    a[i]=work[i].r;
    b[i]=work[i].atime;
  }
}

//run repeatedly
void draw() {
}

void sort() {
  sort=true;
  for (int i=0; i<4; i++) {
    xx[i]=b[3]-b[i];
    yy[i]=(float)xx[i]/a[i];
    Hrn[i]=yy[i]+1;
  }
  if (SJF) {
    for (int i=3; i>0; --i) {
      for (int j=0; j<i; ++j) {
        if (work[j+1].r<work[j].r) {
          int tmp1=work[j].r;
          work[j].r=work[j+1].r;
          work[j+1].r=tmp1;

          char tmp2=work[j].a;
          work[j].a=work[j+1].a;
          work[j+1].a=tmp2;

          int tmp3=work[j].rr;
          work[j].rr=work[j+1].rr;
          work[j+1].rr=tmp3;

          int tmp4=work[j].atime;
          work[j].atime=work[j+1].atime;
          work[j+1].atime=tmp4;
        }
      }
    }
  }

  if (HRN) {
    for (int i=3; i>0; --i) {
      for (int j=0; j<i; ++j) {
        if (Hrn[j+1]>Hrn[j]) {
          int tmp1=work[j].r;
          work[j].r=work[j+1].r;
          work[j+1].r=tmp1;

          char tmp2=work[j].a;
          work[j].a=work[j+1].a;
          work[j+1].a=tmp2;

          int tmp3=work[j].rr;
          work[j].rr=work[j+1].rr;
          work[j+1].rr=tmp3;

          int tmp4=work[j].atime;
          work[j].atime=work[j+1].atime;
          work[j+1].atime=tmp4;
        }
      }
    }
  }
}

void mouseClicked() {
  if (mouseX>700 && mouseX<765 && mouseY>520 && mouseY<585) {//sort
    sort();
    
    for (int i=0; i<4; i++) {
      work[i].display2();
    }
    
    textSize(20);
      text("After", 35, 190);
    
  }

  //SJF
  if (mouseX>700 && mouseX<765 && mouseY>430 && mouseY<495) {
    SJF=true;
    FCFS=false;
    HRN=false;
  }

  //FCFS
  if (mouseX>700 && mouseX<765 && mouseY>340 && mouseY<405) {
    FCFS=true;
    SJF=false;
    HRN=false;
  }

  //HRN
  if (mouseX>700 && mouseX<765 && mouseY>250 && mouseY<315) {
    FCFS=false;
    SJF=false;
    HRN=true;
  }
}

void keyPressed() {
  if (SJF||FCFS||HRN) {
    sort=false;
    if ((key == 'A')||(key == 'a')) {
      if (work[0].r>0 && work0 && !work1 && !work2 && !work3) {
        work[0].location.x+=(30-work[0].location.x);
        work[0].location.y+=(250-work[0].location.y-100);
        work[0].display2();
        work[0].r-=1;
        work0=true;
        work1=false;
        work2=false;
        work3=false;
      } else if (work[0].r<=0 ) {
        work[0].location.x+=(400-work[0].location.x);
        work[0].location.y+=(260-work[0].location.y);
        work[0].display2();
        work0=false;
        work1=true;
        work2=false;
        work3=false;
      }
      if (work[1].r>0 && work1 && !work0 && !work2 && !work3) {
        work[1].location.x+=(30-work[1].location.x);
        work[1].location.y+=(250-work[1].location.y-100);
        work[1].display2();
        work[1].r-=1;
        work0=false;
        work1=true;
        work2=false;
        work3=false;
      } else if (work[1].r<=0) {
        work[1].location.x+=(300-work[1].location.x);
        work[1].location.y+=(260-work[1].location.y);
        work[1].display2();
        work0=false;
        work1=false;
        work2=true;
        work3=false;
      }
      if (work[2].r>0 && work2 && !work0 && !work1 && !work3) {
        work[2].location.x+=(30-work[2].location.x);
        work[2].location.y+=(250-work[2].location.y-100);
        work[2].display2();
        work[2].r-=1;
        work0=false;
        work1=false;
        work2=true;
        work3=false;
      } else if (work[2].r<=0) {
        work[2].location.x+=(200-work[2].location.x);
        work[2].location.y+=(260-work[2].location.y);
        work[2].display2();
        work0=false;
        work1=false;
        work2=false;
        work3=true;
      }

      if (work[3].r>0 && work3 && !work0 && !work1 && !work2) {
        work[3].location.x+=(30-work[3].location.x);
        work[3].location.y+=(250-work[3].location.y-100);
        work[3].display2();
        work[3].r-=1;
        work0=false;
        work1=false;
        work2=false;
        work3=true;
      } else if (work[3].r<=0) {
        work[3].location.x+=(100-work[3].location.x);
        work[3].location.y+=(260-work[3].location.y);
        work[3].display2();
        work0=false;
        work1=false;
        work2=false;
        work3=false;
        pushStyle();
        fill(50, 190, 0);
        rect(30, 250, 72, 72);
        textSize(20);    
        fill(0);
        text("CPU", 45, 287); 
        popStyle();
      }

      if (!work0 && !work1 && !work2 && !work3) {
        textSize(13);
        textSize(13);
        text("RN", 510, 55); 
        text("BeginTime", 570, 55); 
        text("EndTime", 660, 55); 
        text("TurnaroundTime", 730, 55); 
        text("WTime", 860, 55);
        sort=true;
        if (sort) {
          //seperate
          for (int i=0; i<4; i++) {
            if (i==0) {
              work[0].endtime=work[0].atime+a[0];
              work[0].turnaroundTime=work[0].atime+a[0]-work[0].atime;
              work[0].wtime=(float)(work[0].atime+a[0]-work[0].atime)/a[0];
              text(Hrn[i], 500, 80);
              text(work[0].a, 480, 80);
              text(work[0].atime, 600, 80);
              text(work[0].endtime, 680, 80);
              text(work[0].turnaroundTime, 780, 80);
              text(work[0].wtime, 860, 80);
            } else {
              work[i].endtime=work[i-1].endtime+a[i];
              work[i].turnaroundTime=work[i-1].endtime+a[i]-work[i].atime;
              work[i].wtime=(float)(work[i-1].endtime+a[i]-work[i].atime)/a[i];

              text(Hrn[i], 500, 80+20*i);
              text(work[i].a, 480, 80+20*i);
              text(work[i-1].endtime, 600, 80+20*i);
              text(work[i].endtime, 680, 80+20*i);
              text(work[i].turnaroundTime, 780, 80+20*i);
              text(work[i].wtime, 860, 80+20*i);
            }
          }

          //all
          text("AverageTime", 580, 180); 
          text((work[0].turnaroundTime+work[1].turnaroundTime+work[2].turnaroundTime+work[3].turnaroundTime)/4, 600, 200);
          text("WAverageTime", 680, 180); 
          text((work[0].wtime+work[1].wtime+work[2].wtime+work[3].wtime)/4, 700, 200);
        }
      }
    }
  }
}