#include <types.h>
#include <lib.h>
#include <synchprobs.h>
#include <synch.h>

/* 
 * This simple default synchronization mechanism allows only creature at a time to
 * eat.   The globalCatMouseSem is used as a a lock.   We use a semaphore
 * rather than a lock so that this code will work even before locks are implemented.
 */

/* 
 * Replace this default synchronization mechanism with your own (better) mechanism
 * needed for your solution.   Your mechanism may use any of the available synchronzation
 * primitives, e.g., semaphores, locks, condition variables.   You are also free to 
 * declare other global variables if your solution requires them.
 */

/*
 * replace this with declarations of any synchronization and other variables you need here
 */

static volatile int bowl_number;
static volatile int cat; // if cat = 1 means currently there is cat eating or waiting , otherwise cat = 0
static volatile int mouse; // if mouse = 1 means currently there is mouse eating or waiting, otherwise cat = 0

static struct lock *bowl_lk; 
static struct cv *bowl_cv;
static volatile int *bowl_list; // an array of bowl number this is the critical section wants to be protect


/* 
 * The CatMouse simulation will call this function once before any cat or
 * mouse tries to each.
 *
 * You can use it to initialize synchronization and other variables.
 * 
 * parameters: the number of bowls
 */
void
catmouse_sync_init(int bowls)
{
/*init bowl_number , cat, and mouse */
  bowl_number = bowls; // the number of bowls
  cat = 0;
  mouse = 0;
  
  /*init the bowl list, make the all avaliable as init*/
  bowl_list = kmalloc(bowls*sizeof(int));
  if (bowl_list == NULL) {
    panic("initialize_bowls: unable to allocate space for %d bowls\n",bowls);
  }
  for(int i=1;i<=bowls;i++) {
    bowl_list[i] = 0;
  }
  
  bowl_cv = cv_create("bowl_cv");
  if (bowl_cv == NULL) {
    panic("could not create global CatMouse synchronization bowl_cv");
  }
  bowl_lk = lock_create("catmouse_lk");
  if (bowl_lk == NULL) {
    panic("could not create global CatMouse synchronization bowl_lk");
  }
  
  return;
}

/* 
 * The CatMouse simulation will call this function once after all cat
 * and mouse simulations are finished.
 *
 * You can use it to clean up any synchronization and other variables.
 *
 * parameters: the number of bowls
 */
void
catmouse_sync_cleanup(int bowls)
{
  (void)bowls; /* keep the compiler from complaining about unused parameters */
  cv_destroy(bowl_cv);
  lock_destroy(bowl_lk);
  if (bowl_list != NULL) {
      kfree ((void *)bowl_list);
      bowl_list = NULL;
  }
}


/*
 * The CatMouse simulation will call this function each time a cat wants
 * to eat, before it eats.
 * This function should cause the calling thread (a cat simulation thread)
 * to block until it is OK for a cat to eat at the specified bowl.
 *
 * parameter: the number of the bowl at which the cat is trying to eat
 *             legal bowl numbers are 1..NumBowls
 *
 * return value: none
 */

/*this func will acquire a the bowl lock first to enter the critical section,
 then set the cat flag as 1, tells mouse here is cat around. 
 then cat will check the if the number it picks is avaliable and is there mouse are around.
 if yes, then the cat will gonna wait both the bowl becomes avaliable or there is no mouse eating.
 if no, the cat will set the specified bowl number in bowl_list as 1,(means the bowl is been using).
 Then release the bowl lock, to allow other cats or mouse come and see if them have chance to eat ot not.
*/
void
cat_before_eating(unsigned int bowl) 
{
  lock_acquire(bowl_lk);
  cat = 1;
  while(bowl_list[bowl]!=0 || mouse != 0){
  	cv_wait(bowl_cv,bowl_lk);  	 
  }
  cat = 1; 
  bowl_list[bowl] = 1;
  lock_release(bowl_lk);
}

/*
 * The CatMouse simulation will call this function each time a cat finishes
 * eating.
 *
 * You can use this function to wake up other creatures that may have been
 * waiting to eat until this cat finished.
 *
 * parameter: the number of the bowl at which the cat is finishing eating.
 *             legal bowl numbers are 1..NumBowls
 *
 * return value: none
 */

/*after the cat finish eat, it needs to change the critical section again to make the bowl it just eat become avalible, 
and also need to weak up all the cat or mouse who are waiting on the critical section to have a chance to eat.
Go through all the bowls to check is it the last cat around, if yes, it will change the cat=0, 
to allow mouse comes in to eat. otherwise it just leave the bowl avalible and release the lock.
*/
void
cat_after_eating(unsigned int bowl) 
{
  lock_acquire(bowl_lk);  
  bowl_list[(int)bowl] = 0;
  for (int i = 0;i<bowl_number;i++){
  	if (bowl_list[i]==1) {
  		cat = 1;
  		break;
  	} else cat = 0;
  }
  cv_broadcast(bowl_cv,bowl_lk); 
  lock_release(bowl_lk);
}

/*
 * The CatMouse simulation will call this function each time a mouse wants
 * to eat, before it eats.
 * This function should cause the calling thread (a mouse simulation thread)
 * to block until it is OK for a mouse to eat at the specified bowl.
 *
 * parameter: the number of the bowl at which the mouse is trying to eat
 *             legal bowl numbers are 1..NumBowls
 *
 * return value: none
 */


//Same as cat before eating
void
mouse_before_eating(unsigned int bowl) 
{
  lock_acquire(bowl_lk);
  mouse = 1;
  while(bowl_list[bowl]!=0 || cat != 0){ 
  	cv_wait(bowl_cv,bowl_lk); 
  }
  mouse = 1;
  bowl_list[bowl] = 2;
  lock_release(bowl_lk);
}

/*
 * The CatMouse simulation will call this function each time a mouse finishes
 * eating.
 *
 * You can use this function to wake up other creatures that may have been
 * waiting to eat until this mouse finished.
 *
 * parameter: the number of the bowl at which the mouse is finishing eating.
 *             legal bowl numbers are 1..NumBowls
 *
 * return value: none
 */

//Same as cat after eating
void
mouse_after_eating(unsigned int bowl) 
{
  lock_acquire(bowl_lk);
  bowl_list[bowl] = 0;
  for (int i = 0;i<bowl_number;i++){
  	if (bowl_list[i]==2) {
  		mouse = 1;
  		break;
  	} else mouse = 0;
  }
  cv_broadcast(bowl_cv,bowl_lk);
  lock_release(bowl_lk);
}
