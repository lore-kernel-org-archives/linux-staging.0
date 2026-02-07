Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBFE2EE5FC;
	Sat,  7 Feb 2026 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478997; cv=none; b=SC9eq7zIJw+XNCHt/BWVITXj81huEpXx/a1QDxFpJUvFVZ+VMAC2qEh28BwNyo4QzFDv7G0dlIMntlfRCSQlZMcCySRde3ZYRgCRS+3Hmv0HjXPMPpuRZL0J3p7jWeoOutGU/Us+GHccWFT8hMp8n+idof3ZbK/KYCgjtuPSCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478997; c=relaxed/simple;
	bh=ST29tqc1a0KtuE6vrjydxbJitAuk0xAByXs5O6YBPts=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=vDepN2248r1dQbPFn8w+pNwc4veAlrzOp4Ha5x6B5oliKZmQ5qkSE77Sq+K4vJQC8opg0D2n8tDQIPCGWq+BR/pvHK2hewYtcXzqoM63wQZrODFtFLbf7d9UPRylDU9ic4qZl4+EhcF4iNVK9DdW1u5tARpJg81gUd0YlpeMAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AH/d/q/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AH/d/q/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E91C116D0;
	Sat,  7 Feb 2026 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770478996;
	bh=ST29tqc1a0KtuE6vrjydxbJitAuk0xAByXs5O6YBPts=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=AH/d/q/c88dE0Nb+Y3dL5OaSpIiRFpaPST2U9sJYjOCelQqPZ7/9JgTZ/2ua20PWT
	 oL406s4rUyhQucgKf0MT50KXYX+BxsLLPOwM+ZwLV+mK6Kt957ryCCQu0V+/cD1GqL
	 4bzn1akl8cA91kQlGQ0qx8NPhSf7QCh5tigOEkOc=
Subject: Patch "Documentation: Replace del_timer/del_timer_sync()" has been added to the 5.15-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 07 Feb 2026 16:43:01 +0100
In-Reply-To: <20251128160539.358938-9-aha310510@gmail.com>
Message-ID: <2026020701-reapply-snazzy-4ab3@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    Documentation: Replace del_timer/del_timer_sync()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     documentation-replace-del_timer-del_timer_sync.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-197610-greg=kroah.com@vger.kernel.org Fri Nov 28 17:08:45 2025
From: Jeongjun Park <aha310510@gmail.com>
Date: Sat, 29 Nov 2025 01:05:33 +0900
Subject: Documentation: Replace del_timer/del_timer_sync()
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20251128160539.358938-9-aha310510@gmail.com>

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit 87bdd932e85881895d4720255b40ac28749c4e32 ]

Adjust to the new preferred function names.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201625.075320635@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/RCU/Design/Requirements/Requirements.rst      |    2 +-
 Documentation/core-api/local_ops.rst                        |    2 +-
 Documentation/kernel-hacking/locking.rst                    |   11 +++++------
 Documentation/timers/hrtimers.rst                           |    2 +-
 Documentation/translations/it_IT/kernel-hacking/locking.rst |   10 +++++-----
 Documentation/translations/zh_CN/core-api/local_ops.rst     |    2 +-
 6 files changed, 14 insertions(+), 15 deletions(-)

--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1858,7 +1858,7 @@ unloaded. After a given module has been
 one of its functions results in a segmentation fault. The module-unload
 functions must therefore cancel any delayed calls to loadable-module
 functions, for example, any outstanding mod_timer() must be dealt
-with via del_timer_sync() or similar.
+with via timer_delete_sync() or similar.
 
 Unfortunately, there is no way to cancel an RCU callback; once you
 invoke call_rcu(), the callback function is eventually going to be
--- a/Documentation/core-api/local_ops.rst
+++ b/Documentation/core-api/local_ops.rst
@@ -191,7 +191,7 @@ Here is a sample module which implements
 
     static void __exit test_exit(void)
     {
-            del_timer_sync(&test_timer);
+            timer_delete_sync(&test_timer);
     }
 
     module_init(test_init);
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -970,7 +970,7 @@ you might do the following::
 
             while (list) {
                     struct foo *next = list->next;
-                    del_timer(&list->timer);
+                    timer_delete(&list->timer);
                     kfree(list);
                     list = next;
             }
@@ -984,7 +984,7 @@ the lock after we spin_unlock_bh(), and
 the element (which has already been freed!).
 
 This can be avoided by checking the result of
-del_timer(): if it returns 1, the timer has been deleted.
+timer_delete(): if it returns 1, the timer has been deleted.
 If 0, it means (in this case) that it is currently running, so we can
 do::
 
@@ -993,7 +993,7 @@ do::
 
                     while (list) {
                             struct foo *next = list->next;
-                            if (!del_timer(&list->timer)) {
+                            if (!timer_delete(&list->timer)) {
                                     /* Give timer a chance to delete this */
                                     spin_unlock_bh(&list_lock);
                                     goto retry;
@@ -1008,8 +1008,7 @@ do::
 Another common problem is deleting timers which restart themselves (by
 calling add_timer() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
-use del_timer_sync() (``include/linux/timer.h``) to
-handle this case.
+use timer_delete_sync() (``include/linux/timer.h``) to
 
 Locking Speed
 =============
@@ -1337,7 +1336,7 @@ lock.
 
 -  kfree()
 
--  add_timer() and del_timer()
+-  add_timer() and timer_delete()
 
 Mutex API reference
 ===================
--- a/Documentation/timers/hrtimers.rst
+++ b/Documentation/timers/hrtimers.rst
@@ -118,7 +118,7 @@ existing timer wheel code, as it is matu
 was not really a win, due to the different data structures. Also, the
 hrtimer functions now have clearer behavior and clearer names - such as
 hrtimer_try_to_cancel() and hrtimer_cancel() [which are roughly
-equivalent to del_timer() and del_timer_sync()] - so there's no direct
+equivalent to timer_delete() and timer_delete_sync()] - so there's no direct
 1:1 mapping between them on the algorithmic level, and thus no real
 potential for code sharing either.
 
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -998,7 +998,7 @@ potreste fare come segue::
 
             while (list) {
                     struct foo *next = list->next;
-                    del_timer(&list->timer);
+                    timer_delete(&list->timer);
                     kfree(list);
                     list = next;
             }
@@ -1011,7 +1011,7 @@ e prenderà il *lock* solo dopo spin_unl
 di eliminare il suo oggetto (che però è già stato eliminato).
 
 Questo può essere evitato controllando il valore di ritorno di
-del_timer(): se ritorna 1, il temporizzatore è stato già
+timer_delete(): se ritorna 1, il temporizzatore è stato già
 rimosso. Se 0, significa (in questo caso) che il temporizzatore è in
 esecuzione, quindi possiamo fare come segue::
 
@@ -1020,7 +1020,7 @@ esecuzione, quindi possiamo fare come se
 
                     while (list) {
                             struct foo *next = list->next;
-                            if (!del_timer(&list->timer)) {
+                            if (!timer_delete(&list->timer)) {
                                     /* Give timer a chance to delete this */
                                     spin_unlock_bh(&list_lock);
                                     goto retry;
@@ -1034,7 +1034,7 @@ esecuzione, quindi possiamo fare come se
 Un altro problema è l'eliminazione dei temporizzatori che si riavviano
 da soli (chiamando add_timer() alla fine della loro esecuzione).
 Dato che questo è un problema abbastanza comune con una propensione
-alle corse critiche, dovreste usare del_timer_sync()
+alle corse critiche, dovreste usare timer_delete_sync()
 (``include/linux/timer.h``) per gestire questo caso.
 
 Velocità della sincronizzazione
@@ -1380,7 +1380,7 @@ contesto, o trattenendo un qualsiasi *lo
 
 -  kfree()
 
--  add_timer() e del_timer()
+-  add_timer() e timer_delete()
 
 Riferimento per l'API dei Mutex
 ===============================
--- a/Documentation/translations/zh_CN/core-api/local_ops.rst
+++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
@@ -185,7 +185,7 @@ UP之间没有不同的行为，在你�
 
     static void __exit test_exit(void)
     {
-            del_timer_sync(&test_timer);
+            timer_delete_sync(&test_timer);
     }
 
     module_init(test_init);


Patches currently in stable-queue which might be from aha310510@gmail.com are

queue-5.15/timers-update-the-documentation-to-reflect-on-the-new-timer_shutdown-api.patch
queue-5.15/clocksource-drivers-arm_arch_timer-do-not-use-timer-namespace-for-timer_shutdown-function.patch
queue-5.15/timers-split-del_timer-to-prepare-for-shutdown-mode.patch
queue-5.15/arm-spear-do-not-use-timer-namespace-for-timer_shutdown-function.patch
queue-5.15/timers-add-shutdown-mechanism-to-the-internal-functions.patch
queue-5.15/timers-provide-timer_shutdown.patch
queue-5.15/timers-rename-del_timer-to-timer_delete.patch
queue-5.15/timers-replace-bug_on-s.patch
queue-5.15/bluetooth-hci_qca-fix-the-teardown-problem-for-real.patch
queue-5.15/documentation-replace-del_timer-del_timer_sync.patch
queue-5.15/documentation-remove-bogus-claim-about-del_timer_sync.patch
queue-5.15/timers-silently-ignore-timers-with-a-null-function.patch
queue-5.15/timers-get-rid-of-del_singleshot_timer_sync.patch
queue-5.15/clocksource-drivers-sp804-do-not-use-timer-namespace-for-timer_shutdown-function.patch
