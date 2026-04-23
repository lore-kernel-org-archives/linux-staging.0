Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CABA3E8C54;
	Thu, 23 Apr 2026 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947755; cv=none; b=iQj/7/vG9mq9C6b/9rz735djyNcmZIUVY9a/H9My7N0E1PnELcXar0kq1xTYPvRuN+aJQk50rMW7IXNx/+9KkEXVwQQllogKh1fFiACvmfu+3DU/1HFnl8S2VheE4mBlPgjmnDc5G7OM/8g9g2HsyxE3w5m49EfbyZO1jERRvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947755; c=relaxed/simple;
	bh=6Bce1R+T0bTnJZo+y/K7wzFqBs2vnN1ICd2M0WJpW1o=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=TYiuQik0AwnpN3zZiEE8WVHmnjpZiinQTyxyDSWLhLyO07bBgomIQoJZpZr/0i6W+RgIOE6Ir5p+YYXtsrnJsb7iwtPmlUnHIbMGmHc5hexZl1sqiKccR080qD2YXIW/B5IgojQdX359ODrTli3b2jNf4B0v956tgzP5yDPXZ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PLNUNaWJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PLNUNaWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31276C2BCAF;
	Thu, 23 Apr 2026 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776947755;
	bh=6Bce1R+T0bTnJZo+y/K7wzFqBs2vnN1ICd2M0WJpW1o=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=PLNUNaWJ09e2GRdMDFuMKrHvBdkaZxj1VWXGoikIe0jocLELjoISLCU7U4X9Jf3sP
	 PW1WmI3r3+sEv3CDhwMH/sYKGMxJdA+JvUvPahAS/yxfQugqkpv2cBncrLE7ozNbyH
	 hsF5ekLSX80FGvE/hcLsc2H+JoGuZpo/RFL6HB5w=
Subject: Patch "timers: Split [try_to_]del_timer[_sync]() to prepare for shutdown mode" has been added to the 5.10-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org,zouyipeng@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 14:35:08 +0200
In-Reply-To: <20260219171310.118170-11-aha310510@gmail.com>
Message-ID: <2026042308-stencil-relay-aaff@gregkh>
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

    timers: Split [try_to_]del_timer[_sync]() to prepare for shutdown mode

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     timers-split-del_timer-to-prepare-for-shutdown-mode.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From aha310510@gmail.com Thu Feb 19 18:13:58 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 20 Feb 2026 02:13:05 +0900
Subject: timers: Split [try_to_]del_timer[_sync]() to prepare for shutdown mode
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, zouyipeng@huawei.com, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20260219171310.118170-11-aha310510@gmail.com>

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit 8553b5f2774a66b1f293b7d783934210afb8f23c ]

Tearing down timers which have circular dependencies to other
functionality, e.g. workqueues, where the timer can schedule work and work
can arm timers, is not trivial.

In those cases it is desired to shutdown the timer in a way which prevents
rearming of the timer. The mechanism to do so is to set timer->function to
NULL and use this as an indicator for the timer arming functions to ignore
the (re)arm request.

Split the inner workings of try_do_del_timer_sync(), del_timer_sync() and
del_timer() into helper functions to prepare for implementing the shutdown
functionality.

No functional change.

Co-developed-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home
Link: https://lore.kernel.org/all/20221110064101.429013735@goodmis.org
Link: https://lore.kernel.org/r/20221123201625.195147423@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/time/timer.c |  135 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 88 insertions(+), 47 deletions(-)

--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1245,20 +1245,14 @@ out_unlock:
 EXPORT_SYMBOL_GPL(add_timer_on);
 
 /**
- * timer_delete - Deactivate a timer
+ * __timer_delete - Internal function: Deactivate a timer
  * @timer:	The timer to be deactivated
  *
- * The function only deactivates a pending timer, but contrary to
- * timer_delete_sync() it does not take into account whether the timer's
- * callback function is concurrently executed on a different CPU or not.
- * It neither prevents rearming of the timer. If @timer can be rearmed
- * concurrently then the return value of this function is meaningless.
- *
  * Return:
  * * %0 - The timer was not pending
  * * %1 - The timer was pending and deactivated
  */
-int timer_delete(struct timer_list *timer)
+static int __timer_delete(struct timer_list *timer)
 {
 	struct timer_base *base;
 	unsigned long flags;
@@ -1274,25 +1268,37 @@ int timer_delete(struct timer_list *time
 
 	return ret;
 }
-EXPORT_SYMBOL(timer_delete);
 
 /**
- * try_to_del_timer_sync - Try to deactivate a timer
- * @timer:	Timer to deactivate
+ * timer_delete - Deactivate a timer
+ * @timer:	The timer to be deactivated
  *
- * This function tries to deactivate a timer. On success the timer is not
- * queued and the timer callback function is not running on any CPU.
+ * The function only deactivates a pending timer, but contrary to
+ * timer_delete_sync() it does not take into account whether the timer's
+ * callback function is concurrently executed on a different CPU or not.
+ * It neither prevents rearming of the timer.  If @timer can be rearmed
+ * concurrently then the return value of this function is meaningless.
  *
- * This function does not guarantee that the timer cannot be rearmed right
- * after dropping the base lock. That needs to be prevented by the calling
- * code if necessary.
+ * Return:
+ * * %0 - The timer was not pending
+ * * %1 - The timer was pending and deactivated
+ */
+int timer_delete(struct timer_list *timer)
+{
+	return __timer_delete(timer);
+}
+EXPORT_SYMBOL(timer_delete);
+
+/**
+ * __try_to_del_timer_sync - Internal function: Try to deactivate a timer
+ * @timer:	Timer to deactivate
  *
  * Return:
  * * %0  - The timer was not pending
  * * %1  - The timer was pending and deactivated
  * * %-1 - The timer callback function is running on a different CPU
  */
-int try_to_del_timer_sync(struct timer_list *timer)
+static int __try_to_del_timer_sync(struct timer_list *timer)
 {
 	struct timer_base *base;
 	unsigned long flags;
@@ -1309,6 +1315,27 @@ int try_to_del_timer_sync(struct timer_l
 
 	return ret;
 }
+
+/**
+ * try_to_del_timer_sync - Try to deactivate a timer
+ * @timer:	Timer to deactivate
+ *
+ * This function tries to deactivate a timer. On success the timer is not
+ * queued and the timer callback function is not running on any CPU.
+ *
+ * This function does not guarantee that the timer cannot be rearmed right
+ * after dropping the base lock. That needs to be prevented by the calling
+ * code if necessary.
+ *
+ * Return:
+ * * %0  - The timer was not pending
+ * * %1  - The timer was pending and deactivated
+ * * %-1 - The timer callback function is running on a different CPU
+ */
+int try_to_del_timer_sync(struct timer_list *timer)
+{
+	return __try_to_del_timer_sync(timer);
+}
 EXPORT_SYMBOL(try_to_del_timer_sync);
 
 #ifdef CONFIG_PREEMPT_RT
@@ -1385,6 +1412,49 @@ static inline void del_timer_wait_runnin
 #endif
 
 /**
+ * __timer_delete_sync - Internal function: Deactivate a timer and wait
+ *			 for the handler to finish.
+ * @timer:	The timer to be deactivated
+ *
+ * Return:
+ * * %0	- The timer was not pending
+ * * %1	- The timer was pending and deactivated
+ */
+static int __timer_delete_sync(struct timer_list *timer)
+{
+	int ret;
+
+#ifdef CONFIG_LOCKDEP
+	unsigned long flags;
+
+	/*
+	 * If lockdep gives a backtrace here, please reference
+	 * the synchronization rules above.
+	 */
+	local_irq_save(flags);
+	lock_map_acquire(&timer->lockdep_map);
+	lock_map_release(&timer->lockdep_map);
+	local_irq_restore(flags);
+#endif
+	/*
+	 * don't use it in hardirq context, because it
+	 * could lead to deadlock.
+	 */
+	WARN_ON(in_irq() && !(timer->flags & TIMER_IRQSAFE));
+
+	do {
+		ret = __try_to_del_timer_sync(timer);
+
+		if (unlikely(ret < 0)) {
+			del_timer_wait_running(timer);
+			cpu_relax();
+		}
+	} while (ret < 0);
+
+	return ret;
+}
+
+/**
  * timer_delete_sync - Deactivate a timer and wait for the handler to finish.
  * @timer:	The timer to be deactivated
  *
@@ -1425,36 +1495,7 @@ static inline void del_timer_wait_runnin
  */
 int timer_delete_sync(struct timer_list *timer)
 {
-	int ret;
-
-#ifdef CONFIG_LOCKDEP
-	unsigned long flags;
-
-	/*
-	 * If lockdep gives a backtrace here, please reference
-	 * the synchronization rules above.
-	 */
-	local_irq_save(flags);
-	lock_map_acquire(&timer->lockdep_map);
-	lock_map_release(&timer->lockdep_map);
-	local_irq_restore(flags);
-#endif
-	/*
-	 * don't use it in hardirq context, because it
-	 * could lead to deadlock.
-	 */
-	WARN_ON(in_irq() && !(timer->flags & TIMER_IRQSAFE));
-
-	do {
-		ret = try_to_del_timer_sync(timer);
-
-		if (unlikely(ret < 0)) {
-			del_timer_wait_running(timer);
-			cpu_relax();
-		}
-	} while (ret < 0);
-
-	return ret;
+	return __timer_delete_sync(timer);
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
