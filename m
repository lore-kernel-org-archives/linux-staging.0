Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C03E8C54;
	Thu, 23 Apr 2026 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947761; cv=none; b=C3rrfEghyM/eKBXsxbulNDdk0R4XVkk7E1n1tclUyxPCyO/7iTNaLwX1wM/aKWFeuTpvne/KNPnmObvLomVAsg7f5BK/EOFs/1WFFDBNgdq0ZVG1Cn80wiwJazJyWJU3PUy2bgp/U3rVnD0VX1yP8GIIOoAdg8COrlVYGlV4qj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947761; c=relaxed/simple;
	bh=Uoat1GYIj1Y9OKjV21gApoWNof9ipj1cidQswVEaudA=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=ipdhLBUDA7SXl9dDA74kuRoFOtHxeQW6iDvEviJjZr1cb2Ex3Im49a7EPeefi0oh0CgIB+sJtu0mxb/af6C+8Ek8YdKMsWXzRwwP8E8eAtRr2BVRBfVXFFRXfHIO+gxbS9P+20Jpt4wPWVd0ilvspjCzfmqMXKzFxNZOwyzH6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SMfrXQF0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SMfrXQF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81D0C2BCAF;
	Thu, 23 Apr 2026 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776947761;
	bh=Uoat1GYIj1Y9OKjV21gApoWNof9ipj1cidQswVEaudA=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=SMfrXQF0Z5ajCIMtnWfy0iZo0EJAN4ZpTXpA+oNXCxSip1obyiHvPs6E89SaT30IW
	 +zFB2qV+gd+Ywbf9mCs2LU8il1nkybp6gSU2lWj7LVdSMjg+Jm5cwntMFQ33ewSsMB
	 LuK8+ciIXbWzT8TN1xuhEpLPcdt2o2D34jLt19W4=
Subject: Patch "timers: Replace BUG_ON()s" has been added to the 5.10-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org,zouyipeng@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 14:35:08 +0200
In-Reply-To: <20260219171310.118170-7-aha310510@gmail.com>
Message-ID: <2026042308-washroom-poise-e0fe@gregkh>
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

    timers: Replace BUG_ON()s

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     timers-replace-bug_on-s.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From aha310510@gmail.com Thu Feb 19 18:13:41 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 20 Feb 2026 02:13:01 +0900
Subject: timers: Replace BUG_ON()s
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, zouyipeng@huawei.com, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20260219171310.118170-7-aha310510@gmail.com>

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit 82ed6f7ef58f9634fe4462dd721902c580f01569 ]

The timer code still has a few BUG_ON()s left which are crashing the kernel
in situations where it still can recover or simply refuse to take an
action.

Remove the one in the hotplug callback which checks for the CPU being
offline. If that happens then the whole hotplug machinery will explode in
colourful ways.

Replace the rest with WARN_ON_ONCE() and conditional returns where
appropriate.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201624.769128888@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/time/timer.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1155,7 +1155,8 @@ EXPORT_SYMBOL(timer_reduce);
  */
 void add_timer(struct timer_list *timer)
 {
-	BUG_ON(timer_pending(timer));
+	if (WARN_ON_ONCE(timer_pending(timer)))
+		return;
 	__mod_timer(timer, timer->expires, MOD_TIMER_NOTPENDING);
 }
 EXPORT_SYMBOL(add_timer);
@@ -1174,7 +1175,8 @@ void add_timer_on(struct timer_list *tim
 	struct timer_base *new_base, *base;
 	unsigned long flags;
 
-	BUG_ON(timer_pending(timer) || !timer->function);
+	if (WARN_ON_ONCE(timer_pending(timer) || !timer->function))
+		return;
 
 	new_base = get_timer_cpu_base(timer->flags, cpu);
 
@@ -1988,8 +1990,6 @@ int timers_dead_cpu(unsigned int cpu)
 	struct timer_base *new_base;
 	int b, i;
 
-	BUG_ON(cpu_online(cpu));
-
 	for (b = 0; b < NR_BASES; b++) {
 		old_base = per_cpu_ptr(&timer_bases[b], cpu);
 		new_base = get_cpu_ptr(&timer_bases[b]);
@@ -2006,7 +2006,8 @@ int timers_dead_cpu(unsigned int cpu)
 		 */
 		forward_timer_base(new_base);
 
-		BUG_ON(old_base->running_timer);
+		WARN_ON_ONCE(old_base->running_timer);
+		old_base->running_timer = NULL;
 
 		for (i = 0; i < WHEEL_SIZE; i++)
 			migrate_timer_list(new_base, old_base->vectors + i);


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
