Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0933ED139;
	Thu, 23 Apr 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947716; cv=none; b=Ynop5B2OXHdNZzHT+wMrFxFr8LUQfu1sViVnHsiu2hfXoEBXktyPhrsDm6wLtgZhOzLjEZig1/deXGIJwRgPm6mc6dNrwP2f/5LA0nfpoOSP7Q5cNxKb0i3PPegZ+pFI5Egu8Y5x2+wuLdzKaPnTd++pOQYpft7phFZ0a8tZJzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947716; c=relaxed/simple;
	bh=QmOaVaCO6yQZZLCTYPdLnaIf5urQHC7ySX1Ebue2MIM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=WRW346XITc7aYD8JECZmcDIETkBXDZjJQIAoyjuGBGY0vT8THsWd7PRpC9yW5ngxYdX141V/rHCTWU/iREZYoJNV16byzKvModGnMWKMKDyo3exs6dnq/IoqQeAD/AQEFCz4wIaNeOx6mRhw4ZG01CB/FrPSBld8SvMEyHDGVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=16ksDa7t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="16ksDa7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114BEC2BCAF;
	Thu, 23 Apr 2026 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776947716;
	bh=QmOaVaCO6yQZZLCTYPdLnaIf5urQHC7ySX1Ebue2MIM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=16ksDa7tu9lATSTlZe3AzSEj3T1Hfi+ZMCzPzLLjjMnjPIbOYPwYqROY1owS5uX28
	 umOKo4R02yetgvQfTS9wp/M55zkTORvNc3UB/5IaDIYExrJ4nSydw2fX4ftrHx8ElA
	 42ZJM8lQ55kBx6/IqSjk5HCUmIAUWXo6Lq6hPjQY=
Subject: Patch "clocksource/drivers/arm_arch_timer: Do not use timer namespace for timer_shutdown() function" has been added to the 5.10-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org,zouyipeng@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 14:35:06 +0200
In-Reply-To: <20260219171310.118170-4-aha310510@gmail.com>
Message-ID: <2026042306-siberian-stowaway-659c@gregkh>
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

    clocksource/drivers/arm_arch_timer: Do not use timer namespace for timer_shutdown() function

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     clocksource-drivers-arm_arch_timer-do-not-use-timer-namespace-for-timer_shutdown-function.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From aha310510@gmail.com Thu Feb 19 18:13:28 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 20 Feb 2026 02:12:58 +0900
Subject: clocksource/drivers/arm_arch_timer: Do not use timer namespace for timer_shutdown() function
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, zouyipeng@huawei.com, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20260219171310.118170-4-aha310510@gmail.com>

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

[ Upstream commit 73737a5833ace25a8408b0d3b783637cb6bf29d1 ]

A new "shutdown" timer state is being added to the generic timer code. One
of the functions to change the timer into the state is called
"timer_shutdown()". This means that there can not be other functions
called "timer_shutdown()" as the timer code owns the "timer_*" name space.

Rename timer_shutdown() to arch_timer_shutdown() to avoid this conflict.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Link: https://lkml.kernel.org/r/20221106212702.002251651@goodmis.org
Link: https://lore.kernel.org/all/20221105060155.409832154@goodmis.org/
Link: https://lore.kernel.org/r/20221110064146.981725531@goodmis.org
Link: https://lore.kernel.org/r/20221123201624.574672568@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clocksource/arm_arch_timer.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -679,8 +679,8 @@ static irqreturn_t arch_timer_handler_vi
 	return timer_handler(ARCH_TIMER_MEM_VIRT_ACCESS, evt);
 }
 
-static __always_inline int timer_shutdown(const int access,
-					  struct clock_event_device *clk)
+static __always_inline int arch_timer_shutdown(const int access,
+					       struct clock_event_device *clk)
 {
 	unsigned long ctrl;
 
@@ -693,22 +693,22 @@ static __always_inline int timer_shutdow
 
 static int arch_timer_shutdown_virt(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_VIRT_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_VIRT_ACCESS, clk);
 }
 
 static int arch_timer_shutdown_phys(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_PHYS_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_PHYS_ACCESS, clk);
 }
 
 static int arch_timer_shutdown_virt_mem(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_MEM_VIRT_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_MEM_VIRT_ACCESS, clk);
 }
 
 static int arch_timer_shutdown_phys_mem(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_MEM_PHYS_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_MEM_PHYS_ACCESS, clk);
 }
 
 static __always_inline void set_next_event(const int access, unsigned long evt,


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
