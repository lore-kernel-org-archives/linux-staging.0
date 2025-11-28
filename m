Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8A330B0F
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346003; cv=none; b=SiQckZYpkoBcWXCx4A1p7NtLSAy/Q9Z80DzMffSitcXBHBpSNfHBB8QKTKhp/lIr1DV3EO1pBkrk6z/5vcIPoM6Y32SPlE8y0G4HsB1wiV1FA2gWhmvmyA57puyAeZx90NqC9Fpj4Qw87F9MpOJN4GjC0xuwl86UMoNY4TWQ1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346003; c=relaxed/simple;
	bh=FfeWAFL01yrxGNZ9KQqmQL8U/+v/91/EffrzfYdxZZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZjXVirkBrmW24jcwKIurNMDkFAWpDrkBUBvJTXySXe1MPGHFT8/o7NUl9VCA3xoDkyKibYVpKr+0Ml/rzudHfc/ar2h5eoy/v1V175SKwNBCXdMS01T1OonWmQICyLPs12BNdTdKESlLx+XOlW1RwoQbHMzIFOvi33FxflNc4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBQofLpI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBQofLpI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343ea89896eso1978031a91.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764346001; x=1764950801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0bNeek1LW81/KG2/Q/uicdT1bV3tR+ITFKGtccSqSg=;
        b=RBQofLpI2RyRo7udhJIJplq/iId7IRzyyKO91W5IMaVNAqs6avM1mASHGgChq1Fgau
         0S4b72LYPk551j+zVJNFWwxl7shgBu42MXVHEZyoNYzsssbZl4y+GY4VYHGdBWWkyr4v
         FIB4CBMvWX/TkUty7jknduZHKQdow0+D8JBa9WHcuYYyWmNkURTnQ9yzpm2ziCejenHv
         ExMVrZ3DpOnboqmWDI9H4ZRCHoQEQyFUm30FveYooJaDGlVOLmmmCc4ul/FBFbGvCA8B
         R0gXCHHLJGTxLdoxGhjbLn+DLkdkM2gRe/izykU1qHpKzHj0idO86tR4ELe/49lNwhWp
         byMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346001; x=1764950801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0bNeek1LW81/KG2/Q/uicdT1bV3tR+ITFKGtccSqSg=;
        b=LkDjK3Ftb5wOTxm2fBXhuSJ6hIGdkp7OmuTacLuAUeJ6KfG7+zudKw/jEh1P9sUjBM
         kpDlpjtDYWiovBaiGgS9WDthY/pOa9BuH1G2TPLUU+HBM85VwhjjQaW7gxBriYwGUmoq
         Z4CcJUHyPrWL9nhqRufRVs+l0Q/BpS5+hmmUw3OcK56WjprVOeh6RFn4r0xeq0EA+Oqh
         8cAnY7yB9uim2S+nrK7BRC6wj/8wFeyLNZ3XFQbry/7VZZogd5sOZ3qD1JoJx2b4vVaV
         ands9PH8J9MAjYt6iHUmT4V/H6hOXutoqFrqztaHE4NjzRX72EN/0eP4s3WcobaH8/EJ
         jYow==
X-Forwarded-Encrypted: i=1; AJvYcCV0GPJ/xHZRH0VWH8B+r6LyYqbAtc+Q3IZetDY59hfESMMQ+jSihtPV7y/wKsmEX2w3osm3qAn2QulHlI0o@lists.linux.dev
X-Gm-Message-State: AOJu0YzjW2YJqWPdqVdB4HSivIfp7fMEFjrWjvjHa1uWZWoUwNwCyXl2
	jRaYrtMwdt+4iwS0ZZbgIYiF+nuNBm6Rla+jlx8S84XQwZBHfRzFDWKG
X-Gm-Gg: ASbGncuqDo4pFiFDPyyu2DeX76tsULS/9PjjhaMopy2JeTFkMN1L+x+PiY4nz5hjBvF
	43VKlaaXCPEFruNatZ6PBVLJGxZr+sKeulCxPoZVb1wQePg154CR9DP0XDvfpff8+4mt9iSe3xi
	Hk2vc6Hm4TSnGxZW4VuRLK2D1qbvn9oTjKKfHJEgnl4pcsSVU/EYRPoHbst1YjMqORXj+Y1+AIu
	u5+yj98qkprR/aLzUAVfWL8gHmR5DJrpfKzezyzNcDeOXBRGhIIsG1QwwAfUjIBX63tuHlms/Iy
	43bXgW7d3gF9bkzUoygJy7GsSNwe+wDA1rtZ1zIox3EhcQKaRcBBFQzoaFGUzopt9zzJNh2E1+q
	SweQ1mnsXNPw00R9V4NRf9oMhCTVIqKVokVy0j6pYeNB2c7EqwzQbzHRYjvHZ6pcLXrnPZENQ5l
	Amb0A4zIOq9m5SlpbdrEfo+7fjgC2HiVZ6i3b3wQ==
X-Google-Smtp-Source: AGHT+IGMMK/ksK1xGTlKIL49CG15hI1qCc5kwWuiMLMNCyhPjSNUAFybYnQmIenfoilVz4fFQ6RaXg==
X-Received: by 2002:a17:90b:1c86:b0:33f:eca0:47c6 with SMTP id 98e67ed59e1d1-34733f23531mr24238024a91.30.1764346000442;
        Fri, 28 Nov 2025 08:06:40 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:39 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	Julia.Lawall@inria.fr,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	arnd@arndb.de,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	maz@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sboyd@kernel.org,
	viresh.kumar@linaro.org,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.15.y 10/14] timers: Split [try_to_]del_timer[_sync]() to prepare for shutdown mode
Date: Sat, 29 Nov 2025 01:05:35 +0900
Message-Id: <20251128160539.358938-11-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128160539.358938-1-aha310510@gmail.com>
References: <20251128160539.358938-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 kernel/time/timer.c | 143 ++++++++++++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 51 deletions(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 3b6624cd9507..0b76a2ab42e3 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1298,20 +1298,14 @@ void add_timer_on(struct timer_list *timer, int cpu)
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
@@ -1327,25 +1321,37 @@ int timer_delete(struct timer_list *timer)
 
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
@@ -1362,6 +1368,27 @@ int try_to_del_timer_sync(struct timer_list *timer)
 
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
@@ -1438,45 +1465,15 @@ static inline void del_timer_wait_running(struct timer_list *timer) { }
 #endif
 
 /**
- * timer_delete_sync - Deactivate a timer and wait for the handler to finish.
+ * __timer_delete_sync - Internal function: Deactivate a timer and wait
+ *			 for the handler to finish.
  * @timer:	The timer to be deactivated
  *
- * Synchronization rules: Callers must prevent restarting of the timer,
- * otherwise this function is meaningless. It must not be called from
- * interrupt contexts unless the timer is an irqsafe one. The caller must
- * not hold locks which would prevent completion of the timer's callback
- * function. The timer's handler must not call add_timer_on(). Upon exit
- * the timer is not queued and the handler is not running on any CPU.
- *
- * For !irqsafe timers, the caller must not hold locks that are held in
- * interrupt context. Even if the lock has nothing to do with the timer in
- * question.  Here's why::
- *
- *    CPU0                             CPU1
- *    ----                             ----
- *                                     <SOFTIRQ>
- *                                       call_timer_fn();
- *                                       base->running_timer = mytimer;
- *    spin_lock_irq(somelock);
- *                                     <IRQ>
- *                                        spin_lock(somelock);
- *    timer_delete_sync(mytimer);
- *    while (base->running_timer == mytimer);
- *
- * Now timer_delete_sync() will never return and never release somelock.
- * The interrupt on the other CPU is waiting to grab somelock but it has
- * interrupted the softirq that CPU0 is waiting to finish.
- *
- * This function cannot guarantee that the timer is not rearmed again by
- * some concurrent or preempting code, right after it dropped the base
- * lock. If there is the possibility of a concurrent rearm then the return
- * value of the function is meaningless.
- *
  * Return:
  * * %0	- The timer was not pending
  * * %1	- The timer was pending and deactivated
  */
-int timer_delete_sync(struct timer_list *timer)
+static int __timer_delete_sync(struct timer_list *timer)
 {
 	int ret;
 
@@ -1506,7 +1503,7 @@ int timer_delete_sync(struct timer_list *timer)
 		lockdep_assert_preemption_enabled();
 
 	do {
-		ret = try_to_del_timer_sync(timer);
+		ret = __try_to_del_timer_sync(timer);
 
 		if (unlikely(ret < 0)) {
 			del_timer_wait_running(timer);
@@ -1516,6 +1513,50 @@ int timer_delete_sync(struct timer_list *timer)
 
 	return ret;
 }
+
+/**
+ * timer_delete_sync - Deactivate a timer and wait for the handler to finish.
+ * @timer:	The timer to be deactivated
+ *
+ * Synchronization rules: Callers must prevent restarting of the timer,
+ * otherwise this function is meaningless. It must not be called from
+ * interrupt contexts unless the timer is an irqsafe one. The caller must
+ * not hold locks which would prevent completion of the timer's callback
+ * function. The timer's handler must not call add_timer_on(). Upon exit
+ * the timer is not queued and the handler is not running on any CPU.
+ *
+ * For !irqsafe timers, the caller must not hold locks that are held in
+ * interrupt context. Even if the lock has nothing to do with the timer in
+ * question.  Here's why::
+ *
+ *    CPU0                             CPU1
+ *    ----                             ----
+ *                                     <SOFTIRQ>
+ *                                       call_timer_fn();
+ *                                       base->running_timer = mytimer;
+ *    spin_lock_irq(somelock);
+ *                                     <IRQ>
+ *                                        spin_lock(somelock);
+ *    timer_delete_sync(mytimer);
+ *    while (base->running_timer == mytimer);
+ *
+ * Now timer_delete_sync() will never return and never release somelock.
+ * The interrupt on the other CPU is waiting to grab somelock but it has
+ * interrupted the softirq that CPU0 is waiting to finish.
+ *
+ * This function cannot guarantee that the timer is not rearmed again by
+ * some concurrent or preempting code, right after it dropped the base
+ * lock. If there is the possibility of a concurrent rearm then the return
+ * value of the function is meaningless.
+ *
+ * Return:
+ * * %0	- The timer was not pending
+ * * %1	- The timer was pending and deactivated
+ */
+int timer_delete_sync(struct timer_list *timer)
+{
+	return __timer_delete_sync(timer);
+}
 EXPORT_SYMBOL(timer_delete_sync);
 
 static void call_timer_fn(struct timer_list *timer,
--
