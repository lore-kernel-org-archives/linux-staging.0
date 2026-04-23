Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A263C73D0;
	Thu, 23 Apr 2026 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947708; cv=none; b=IZH0XiO+1jbXmizRUAGoqjuQZVZzS3e8iYvehJQUVF4bmtsRu8laa7+3hUC+1BgZx9HAhr5mZejdRLvW3dcdzU7GzNpFL/ZdSUmeJsP8h6kR3VQZTdC3MglLi63KL9NlkdY7DTjUko4B+lSGbE2w2n3ecobQ5REB9wa0lTpe1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947708; c=relaxed/simple;
	bh=B2QPrnnXkiKyftMkqV2djKPHD3JlstdFiaOsmoKebWU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=IugTAIT8a8wrgez7hOiQWkXPPZsxJ5lgUTfj39CCj3p9pVYW+0U46Zx5Xc6smdyFoWAWbx2PAq808qySbX0VHC2zIC0XZ4XAVJwfHKRqRFh3yIwq3ANLjW8CHXUQHBxJj8vazSIo5ehGTQK51U9XaCRoz+ir6ry9sQ3rRQ8UTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hVKbYcOD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hVKbYcOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1F1C2BCAF;
	Thu, 23 Apr 2026 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776947708;
	bh=B2QPrnnXkiKyftMkqV2djKPHD3JlstdFiaOsmoKebWU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=hVKbYcODJIFidkTLthYPQSoRBFnL0tKg+VZOf06n3QfQMmuHedzbAkGvmfOMSbkIX
	 GWJiGqEc4hFODH42LFGPxpyqhXLhjRl0wBqxTYWxSi7OsD8NY3NJ4zWD9gIR5Axm14
	 Ar3uD5FlZ29e5a8TpMjvc20iie7Ygu4RHyFCBjqY=
Subject: Patch "ARM: spear: Do not use timer namespace for timer_shutdown() function" has been added to the 5.10-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org,zouyipeng@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 14:35:05 +0200
In-Reply-To: <20260219171310.118170-3-aha310510@gmail.com>
Message-ID: <2026042305-jimmy-issuing-4729@gregkh>
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

    ARM: spear: Do not use timer namespace for timer_shutdown() function

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-spear-do-not-use-timer-namespace-for-timer_shutdown-function.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From aha310510@gmail.com Thu Feb 19 18:13:24 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 20 Feb 2026 02:12:57 +0900
Subject: ARM: spear: Do not use timer namespace for timer_shutdown() function
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, zouyipeng@huawei.com, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20260219171310.118170-3-aha310510@gmail.com>

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

[ Upstream commit 80b55772d41d8afec68dbc4ff0368a9fe5d1f390 ]

A new "shutdown" timer state is being added to the generic timer code. One
of the functions to change the timer into the state is called
"timer_shutdown()". This means that there can not be other functions called
"timer_shutdown()" as the timer code owns the "timer_*" name space.

Rename timer_shutdown() to spear_timer_shutdown() to avoid this conflict.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Link: https://lkml.kernel.org/r/20221106212701.822440504@goodmis.org
Link: https://lore.kernel.org/all/20221105060155.228348078@goodmis.org/
Link: https://lore.kernel.org/r/20221110064146.810953418@goodmis.org
Link: https://lore.kernel.org/r/20221123201624.513863211@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/mach-spear/time.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -93,7 +93,7 @@ static void __init spear_clocksource_ini
 		200, 16, clocksource_mmio_readw_up);
 }
 
-static inline void timer_shutdown(struct clock_event_device *evt)
+static inline void spear_timer_shutdown(struct clock_event_device *evt)
 {
 	u16 val = readw(gpt_base + CR(CLKEVT));
 
@@ -104,7 +104,7 @@ static inline void timer_shutdown(struct
 
 static int spear_shutdown(struct clock_event_device *evt)
 {
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	return 0;
 }
@@ -114,7 +114,7 @@ static int spear_set_oneshot(struct cloc
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	val = readw(gpt_base + CR(CLKEVT));
 	val |= CTRL_ONE_SHOT;
@@ -129,7 +129,7 @@ static int spear_set_periodic(struct clo
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	period = clk_get_rate(gpt_clk) / HZ;
 	period >>= CTRL_PRESCALER16;


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
