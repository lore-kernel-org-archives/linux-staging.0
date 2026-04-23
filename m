Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C593E6DC4;
	Thu, 23 Apr 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947737; cv=none; b=MvaygAsNI4nwF4wyQqsXPbe0CBenVs0T6RxwDc8EDwG/jqOV4Mp0UsOwrqj7USvtXNecwF10lt81ljGTOmZ5ouW70adeBEk0xzYhIPolzoLMXB2c2u0CD5O7uOdhPNbUDty/+hoy6AuOLslFsi8/NzGrwcqkt6SRyTYZTzcACso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947737; c=relaxed/simple;
	bh=EWw5a4xUQKsmYeY9NiqGfGBs6FmwHMZjfV9EfP/N4J4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=BvAL41CUFcd0bbh0oW6uw+QJhyUo2frQ7TLWhXqgkaQolTKCa8S6HkqtZl4eKMG82pznZEE3W6mKGRYdjwSP1AuQKI1vjUVLMxSyL+0xwuNX/yVNgwzRUrSASDS4udE8Xq939n4ZfxgBoGo/SnlYGqlkGbuDS8y1KszrbXwarlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NE9n/Jha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NE9n/Jha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11149C2BCAF;
	Thu, 23 Apr 2026 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776947737;
	bh=EWw5a4xUQKsmYeY9NiqGfGBs6FmwHMZjfV9EfP/N4J4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=NE9n/Jhaip/2myT5NZmCuH2nJUgAnMMgKj1AaRtDGdylu/WIR9xZo3iXunEEXbXEu
	 +HDryqD2uZHicIFZIkOM89pzSfzX/c0cNm2bhH36Q6bf6HM0oTxUWyYnbCMWKhRrd+
	 mCjdpbcClq/d4jgX1lDmllRj4ynXMnUC6IJL+I4Q=
Subject: Patch "timers: Add shutdown mechanism to the internal functions" has been added to the 5.10-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org,zouyipeng@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 14:35:07 +0200
In-Reply-To: <20260219171310.118170-12-aha310510@gmail.com>
Message-ID: <2026042307-deceiver-rockslide-b9b5@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    timers: Add shutdown mechanism to the internal functions

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     timers-add-shutdown-mechanism-to-the-internal-functions.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From aha310510@gmail.com Thu Feb 19 18:14:02 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 20 Feb 2026 02:13:06 +0900
Subject: timers: Add shutdown mechanism to the internal functions
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, zouyipeng@huawei.com, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20260219171310.118170-12-aha310510@gmail.com>

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit 0cc04e80458a822300b93f82ed861a513edde194 ]

Tearing down timers which have circular dependencies to other
functionality, e.g. workqueues, where the timer can schedule work and work
can arm timers, is not trivial.

In those cases it is desired to shutdown the timer in a way which prevents
rearming of the timer. The mechanism to do so is to set timer->function to
NULL and use this as an indicator for the timer arming functions to ignore
the (re)arm request.

Add a shutdown argument to the relevant internal functions which makes the
actual deactivation code set timer->function to NULL which in turn prevents
rearming of the timer.

Co-developed-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home
Link: https://lore.kernel.org/all/20221110064101.429013735@goodmis.org
Link: https://lore.kernel.org/r/20221123201625.253883224@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/time/timer.c |   62 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 8 deletions(-)

--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1247,12 +1247,19 @@ EXPORT_SYMBOL_GPL(add_timer_on);
 /**
  * __timer_delete - Internal function: Deactivate a timer
  * @timer:	The timer to be deactivated
+ * @shutdown:	If true, this indicates that the timer is about to be
+ *		shutdown permanently.
+ *
+ * If @shutdown is true then @timer->function is set to NULL under the
+ * timer base lock which prevents further rearming of the time. In that
+ * case any attempt to rearm @timer after this function returns will be
+ * silently ignored.
  *
  * Return:
  * * %0 - The timer was not pending
  * * %1 - The timer was pending and deactivated
  */
-static int __timer_delete(struct timer_list *timer)
+static int __timer_delete(struct timer_list *timer, bool shutdown)
 {
 	struct timer_base *base;
 	unsigned long flags;
@@ -1260,9 +1267,22 @@ static int __timer_delete(struct timer_l
 
 	debug_assert_init(timer);
 
-	if (timer_pending(timer)) {
+	/*
+	 * If @shutdown is set then the lock has to be taken whether the
+	 * timer is pending or not to protect against a concurrent rearm
+	 * which might hit between the lockless pending check and the lock
+	 * aquisition. By taking the lock it is ensured that such a newly
+	 * enqueued timer is dequeued and cannot end up with
+	 * timer->function == NULL in the expiry code.
+	 *
+	 * If timer->function is currently executed, then this makes sure
+	 * that the callback cannot requeue the timer.
+	 */
+	if (timer_pending(timer) || shutdown) {
 		base = lock_timer_base(timer, &flags);
 		ret = detach_if_pending(timer, base, true);
+		if (shutdown)
+			timer->function = NULL;
 		raw_spin_unlock_irqrestore(&base->lock, flags);
 	}
 
@@ -1285,20 +1305,31 @@ static int __timer_delete(struct timer_l
  */
 int timer_delete(struct timer_list *timer)
 {
-	return __timer_delete(timer);
+	return __timer_delete(timer, false);
 }
 EXPORT_SYMBOL(timer_delete);
 
 /**
  * __try_to_del_timer_sync - Internal function: Try to deactivate a timer
  * @timer:	Timer to deactivate
+ * @shutdown:	If true, this indicates that the timer is about to be
+ *		shutdown permanently.
+ *
+ * If @shutdown is true then @timer->function is set to NULL under the
+ * timer base lock which prevents further rearming of the timer. Any
+ * attempt to rearm @timer after this function returns will be silently
+ * ignored.
+ *
+ * This function cannot guarantee that the timer cannot be rearmed
+ * right after dropping the base lock if @shutdown is false. That
+ * needs to be prevented by the calling code if necessary.
  *
  * Return:
  * * %0  - The timer was not pending
  * * %1  - The timer was pending and deactivated
  * * %-1 - The timer callback function is running on a different CPU
  */
-static int __try_to_del_timer_sync(struct timer_list *timer)
+static int __try_to_del_timer_sync(struct timer_list *timer, bool shutdown)
 {
 	struct timer_base *base;
 	unsigned long flags;
@@ -1310,6 +1341,8 @@ static int __try_to_del_timer_sync(struc
 
 	if (base->running_timer != timer)
 		ret = detach_if_pending(timer, base, true);
+	if (shutdown)
+		timer->function = NULL;
 
 	raw_spin_unlock_irqrestore(&base->lock, flags);
 
@@ -1334,7 +1367,7 @@ static int __try_to_del_timer_sync(struc
  */
 int try_to_del_timer_sync(struct timer_list *timer)
 {
-	return __try_to_del_timer_sync(timer);
+	return __try_to_del_timer_sync(timer, false);
 }
 EXPORT_SYMBOL(try_to_del_timer_sync);
 
@@ -1415,12 +1448,25 @@ static inline void del_timer_wait_runnin
  * __timer_delete_sync - Internal function: Deactivate a timer and wait
  *			 for the handler to finish.
  * @timer:	The timer to be deactivated
+ * @shutdown:	If true, @timer->function will be set to NULL under the
+ *		timer base lock which prevents rearming of @timer
+ *
+ * If @shutdown is not set the timer can be rearmed later. If the timer can
+ * be rearmed concurrently, i.e. after dropping the base lock then the
+ * return value is meaningless.
+ *
+ * If @shutdown is set then @timer->function is set to NULL under timer
+ * base lock which prevents rearming of the timer. Any attempt to rearm
+ * a shutdown timer is silently ignored.
+ *
+ * If the timer should be reused after shutdown it has to be initialized
+ * again.
  *
  * Return:
  * * %0	- The timer was not pending
  * * %1	- The timer was pending and deactivated
  */
-static int __timer_delete_sync(struct timer_list *timer)
+static int __timer_delete_sync(struct timer_list *timer, bool shutdown)
 {
 	int ret;
 
@@ -1443,7 +1489,7 @@ static int __timer_delete_sync(struct ti
 	WARN_ON(in_irq() && !(timer->flags & TIMER_IRQSAFE));
 
 	do {
-		ret = __try_to_del_timer_sync(timer);
+		ret = __try_to_del_timer_sync(timer, shutdown);
 
 		if (unlikely(ret < 0)) {
 			del_timer_wait_running(timer);
@@ -1495,7 +1541,7 @@ static int __timer_delete_sync(struct ti
  */
 int timer_delete_sync(struct timer_list *timer)
 {
-	return __timer_delete_sync(timer);
+	return __timer_delete_sync(timer, false);
 }
 EXPORT_SYMBOL(timer_delete_sync);
 


Patches currently in stable-queue which might be from aha310510@gmail.com are

queue-5.10/timers-update-the-documentation-to-reflect-on-the-new-timer_shutdown-api.patch
queue-5.10/clocksource-drivers-arm_arch_timer-do-not-use-timer-namespace-for-timer_shutdown-function.patch
queue-5.10/timers-split-del_timer-to-prepare-for-shutdown-mode.patch
queue-5.10/arm-spear-do-not-use-timer-namespace-for-timer_shutdown-function.patch
queue-5.10/media-as102-fix-to-not-free-memory-after-the-device-is-registered-in-as102_usb_probe.patch
queue-5.10/timers-add-shutdown-mechanism-to-the-internal-functions.patch
queue-5.10/timers-provide-timer_shutdown.patch
queue-5.10/timers-rename-del_timer-to-timer_delete.patch
queue-5.10/timers-replace-bug_on-s.patch
queue-5.10/bluetooth-hci_qca-fix-the-teardown-problem-for-real.patch
queue-5.10/timers-fix-null-function-pointer-race-in-timer_shutdown_sync.patch
queue-5.10/documentation-replace-del_timer-del_timer_sync.patch
queue-5.10/documentation-remove-bogus-claim-about-del_timer_sync.patch
queue-5.10/timers-silently-ignore-timers-with-a-null-function.patch
queue-5.10/timers-get-rid-of-del_singleshot_timer_sync.patch
queue-5.10/media-hackrf-fix-to-not-free-memory-after-the-device-is-registered-in-hackrf_probe.patch
queue-5.10/clocksource-drivers-sp804-do-not-use-timer-namespace-for-timer_shutdown-function.patch
