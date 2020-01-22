#include <list.h>
#include <proc/sched.h>
#include <mem/malloc.h>
#include <proc/proc.h>
#include <proc/switch.h>
#include <interrupt.h>
#include <device/console.h>

extern struct list level_que[QUE_LV_MAX];
extern struct list plist;
extern struct list slist;
extern struct process procs[PROC_NUM_MAX];
extern struct process *idle_process;

struct process *latest;

struct process* get_next_proc(struct list *rlist_target);
void proc_que_levelup(struct process *cur);
void proc_que_leveldown(struct process *cur);
struct process* sched_find_que(void);

int scheduling;

/*
	linux multilevelfeedback queue scheduler
	level 1 que policy is FCFS(First Come, First Served)
	level 2 que policy is RR(Round Robin).
*/

//sched_find_que find the next process from the highest queue that has proccesses.
struct process* sched_find_que(void) {
	int i,j;
	struct process * result = NULL;
	 
	proc_wake();

		/*TODO :check the queue whether it is empty or not  
		 and find each queue for the next process.
		*/
    if(!(list_empty(&level_que[1]))){
       result = get_next_proc(&(level_que[1]));
    }else if(!(list_empty(&level_que[2]))){
       result = get_next_proc(&level_que[2]);
    }
		
	return result;
}

struct process* get_next_proc(struct list *rlist_target) {
	struct list_elem *e;

	for(e = list_begin (rlist_target); e != list_end (rlist_target);
		e = list_next (e))
	{
		struct process* p = list_entry(e, struct process, elem_stat);

		if(p->state == PROC_RUN)
		   return p;
        
	}
	return NULL;
}

void schedule(void)
{
	struct process *cur;
	struct process *next;
	struct process *tmp;
	struct list_elem *ele;
	int i = 0, printed = 0;

	scheduling = 1;	
	cur = cur_process;
	/*TODO : if current process is idle_process(pid 0), schedule() choose the next process (not pid 0).
	when context switching, you can use switch_process().  
	if current process is not idle_process, schedule() choose the idle process(pid 0).
	complete the schedule() code below.
	*/
  
	if ((cur -> pid) != 0) {
	   /*0이 아닌 process idel process로 switch_process*/
       latest = cur_process;
       cur_process = idle_process;
       next = cur_process;
       scheduling = 0;
       intr_disable();
       switch_process(cur,next);
       intr_enable();
      return;
	}
    

	switch (latest -> que_level){
       case 1:
          /*latest가 I/O면 I/o처리 아니면 2번 큐로*/
          if(latest -> state != PROC_STOP) proc_que_leveldown(latest);
          else 
          { 
             printk("PROC %d I/O at %lu \n", latest-> pid, latest->time_used);
             proc_que_levelup(latest);
          }

          break;
       case 2:
          /*latest가 I/O 상태면 I/O상태 처리 아니면 2번 큐 뒤로*/
          if(latest -> state == PROC_STOP)
          {
             printk("PROC %d I/O at %lu \n", latest-> pid, latest->time_used);
             proc_que_levelup(latest);
          }
          else list_push_back(&level_que[2] , &latest->elem_stat);
          break;
       default:
          /*초기 latest변수 초기화*/
          latest = sched_find_que();
          break;
	}
	
	proc_wake(); //wake up the processes 
    
    intr_disable();//출력시 int 발생하지 않도록
	//print the info of all 10 proc.
	for (ele = list_begin(&plist); ele != list_end(&plist); ele = list_next(ele)) {
		tmp = list_entry (ele, struct process, elem_all);
		if ((tmp -> state == PROC_ZOMBIE) || 
			//(tmp -> state == PROC_BLOCK) || 
			//	(tmp -> state == PROC_STOP) ||
					(tmp -> pid == 0)) 	continue;
			if (!printed) {	
				printk("#=%2d t=%3d u=%3d ", tmp -> pid, tmp -> time_slice, tmp -> time_used);
				printk("q=%3d\n", tmp->que_level);
				printed = 1;			
			}
			else {
				printk(", #=%2d t=%3d u=%3d ", tmp -> pid, tmp -> time_slice, tmp->time_used);
				printk("q=%3d\n", tmp->que_level);
			}
			
	}
    intr_enable();//출력끝날때.
   

	if (printed)
		printk("\n");

	if ((next = sched_find_que()) != NULL) {
		printk("Selected process : %d\n", next -> pid);
        /*switch_proces 하는 부분*/
        cur_process = next;
        cur_process -> time_slice = 0;
        scheduling = 0;
        intr_disable();
        switch_process(cur,next);
        intr_enable();
		return;
	}
	return;
}

void proc_que_levelup(struct process *cur)
{
	/*TODO : change the queue lv2 to queue lv1.*/
     printk("proc %d 's que is %d \n" , cur->pid, cur->que_level);
     printk("proc%d change the queue (2->1) \n",cur -> pid);
     if(cur->que_level == 2) cur->que_level--;
}

void proc_que_leveldown(struct process *cur)
{
	/*TODO : change the queue lv1 to queue lv2.*/
   if(cur -> que_level == 1)
   {
       printk("proc%d change the queue (1->2) \n", cur -> pid);
       cur-> que_level ++;
       list_push_back(&level_que[2] , &cur->elem_stat);
   }
}
