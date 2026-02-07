Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB872EE5FC;
	Sat,  7 Feb 2026 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478983; cv=none; b=mxS/Jsa7UxEIsp3LwpKCeBKalZwgBJ+6op7GcposQVoOQCAE9zeF9WlakMXchS5onrcYY0a2bd3lWYNau484OZJg7BzZtIv/81mzrHO6nBwFnV5me0KEJYA0mG6DurD1V1774KWpUdtM4vaK18jbj/E9e3Tf+KPJ0IH8p7GHvVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478983; c=relaxed/simple;
	bh=uWddzdXZDJjlKMag6cpiYPM9iVyOE3o1fqhNmrvBFW4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=s6TDFxWDt3GfkvuUA+21Ovr/iVngtGfEu8zPbOGajCPecMy0zsOHD4PhUEOi67YcxQW4iPd7g+j6GTyxLSrmktCjEeEyetbpCbgN7FcqX4OXuF9upJTjQpNKwbygtcM5yl8RhyKvoYHoHvacnzpAUar317J4mHvI/Fihdn7sq58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MCk1YVM8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MCk1YVM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D312C116D0;
	Sat,  7 Feb 2026 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770478982;
	bh=uWddzdXZDJjlKMag6cpiYPM9iVyOE3o1fqhNmrvBFW4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=MCk1YVM8EcukUvL8dEPQm1QRmugk61iXm6Y58PRAzgxpQSi1EH5HmhHuchLB+4jo5
	 sn/KWe5bJ7Uj7mkV/29IRPVIgoPKyHPi7mqVslz+GMofhBUd1OQ1S6ZORaYVoSzfzf
	 v7EEFeDvxdhjrZ1FwE9+qIq0ZxpaPLbM4Qg92XsI=
Subject: Patch "ARM: spear: Do not use timer namespace for timer_shutdown() function" has been added to the 5.15-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 07 Feb 2026 16:42:59 +0100
In-Reply-To: <20251128160539.358938-3-aha310510@gmail.com>
Message-ID: <2026020759-decipher-earthen-606f@gregkh>
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

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-spear-do-not-use-timer-namespace-for-timer_shutdown-function.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-197604-greg=kroah.com@vger.kernel.org Fri Nov 28 17:06:56 2025
From: Jeongjun Park <aha310510@gmail.com>
Date: Sat, 29 Nov 2025 01:05:27 +0900
Subject: ARM: spear: Do not use timer namespace for timer_shutdown() function
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20251128160539.358938-3-aha310510@gmail.com>

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
@@ -90,7 +90,7 @@ static void __init spear_clocksource_ini
 		200, 16, clocksource_mmio_readw_up);
 }
 
-static inline void timer_shutdown(struct clock_event_device *evt)
+static inline void spear_timer_shutdown(struct clock_event_device *evt)
 {
 	u16 val = readw(gpt_base + CR(CLKEVT));
 
@@ -101,7 +101,7 @@ static inline void timer_shutdown(struct
 
 static int spear_shutdown(struct clock_event_device *evt)
 {
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	return 0;
 }
@@ -111,7 +111,7 @@ static int spear_set_oneshot(struct cloc
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	val = readw(gpt_base + CR(CLKEVT));
 	val |= CTRL_ONE_SHOT;
@@ -126,7 +126,7 @@ static int spear_set_periodic(struct clo
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	period = clk_get_rate(gpt_clk) / HZ;
 	period >>= CTRL_PRESCALER16;


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
