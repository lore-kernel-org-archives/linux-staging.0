Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0172E330B3C
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346008; cv=none; b=X+a+hk0tKTLaSSYtyvVaFv/XSifbwmHdEnND1buj9cEkKsiYVHyxt5spjnoECYU5BIrvlP/ZQmhl2aYiNfzx35q+gA7Ot05OJYh1ynOt+KeMVZZDcH5/bdcpfQGbqJXiQ4wDqm/+NybcYwKOhzQFjQYV7wr/nknqofId/gngYqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346008; c=relaxed/simple;
	bh=7nNzz17kSCCmlWDu86ZhyMKFITWZeFxpgwAsgGFQJqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CAHrljeXk30W/80V8Z2cjt6tsfwCW2BJMXxoO+iwC5jFDJu7NxJ21x7H4sf2CSQuh/ao0pKGkqmmgA3JM45dYGclI1U+/N962m3iVGXMfGToxMPNq93g2eUOQ02tfZBvd+lwbluBXD0er+WOpUdMRfQuEnUnJXn8Mx8B0GyMKKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd/xQlRD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd/xQlRD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso2376256b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764346006; x=1764950806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1WOyKHAoHX8FrQxrc3Dl9TiChr0cIqUNlYEGeUOx2A=;
        b=Qd/xQlRDACug84frUj9hPj8dqCo/rQb1jS4onvG8nItW0ndsBcGabo04UL1gBJ0ReV
         Fvvto8JHKEED5tEmBvq4AHhJEVGnJ1Kmqb35av5YqIYl+xmtc4A6s796ocQ8s0wvOKTJ
         h9S0KQi7iQfHghrxuLO9XF9+2UQ8wrjUtNtE2S3tlQDFzfpOMCf9RpRpSpkcJ/ZmGVGe
         9HVJdLg2utebqoFEUyNII+Jlm8bQtkFHfodCFqsUqmYhxpJxOK9bMHRcyb2x02wM34lY
         e0VltFJNwNLnXbN6LoYYpTKYBuk4rohvvLmvu9WQT2gOeFvEd0iEiKJXfxGpKRSaff7K
         ofJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346006; x=1764950806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x1WOyKHAoHX8FrQxrc3Dl9TiChr0cIqUNlYEGeUOx2A=;
        b=THfmnqzEtyJQu9bSJSITq9VnR4r/GaSqpmaiLaJnIWNmv0JxzCxUPnikPVVVKg4OGJ
         H36sQWZAFLX+1YINDG7vnp4Hmg385O0RxFKvtCFOGicVdBElg6aH/i2CtQ3pgLeD1AXd
         rKFGSBf2Fe5HJtB1U9RGt0NcXkIGwFAEejUsE8uerx21+IldKv/cul4XpZM9Q4VlX7Ur
         0i0HOlD6XfB/Go7KDMSQH1dMfFqQDrWT/GLr6jeTs9Pd1D+Kfg58N/lPhs9KfYiKTZ7a
         tkTbgkc3m6D8N5uvZGfyj14803ficuuwxLn4QNaOt3f7IL4WbojbPlJr1MoRIdhUBex+
         E+pw==
X-Forwarded-Encrypted: i=1; AJvYcCXnn/NlvJOy8WUv9M5XfbA+vgtKVej7xb+CRyQFUm91yqKTRMXBujSDdbZ2ZRUbT6JxE0wSvymgMzz9VyH9@lists.linux.dev
X-Gm-Message-State: AOJu0YwIyfbV0+ukF8TtT7hVHgyp5EYNjFGCVxAX0zZUY0vH2buVfj/W
	gLJILwESrtKrhHtkMb64UnzqxDKUt4ZF5lbNPh9WQf3nRJlqf20bz9DX
X-Gm-Gg: ASbGncsvTYdLO4CUpy8NOPjMLHhZqBesmjrTk/62tYyh07o48rWdxsuR7GjWKzxYph6
	MO1NuBIJjuxElFJA5smVdMeOc3OfCmSOdE/XS5xvuonljczqidpKFl82B/PKoy3IUEqhPnB7kMN
	Fn9hp4Z02RZLKe/PA/jq6tlB/I8KFhjp6vzeuT+GdUTNNACeGDMB5t0Qm0KBbQBCcxVnmhh8kdF
	cfzwVcV1trOhWsH300b/av4kgtQWbJ3npVqkuNnCqHYgYq8bFD3dj9mssxx304SPmgSbYVgcICP
	S4XIGyL2fI0wxsiOEvgHLgx0X22ehSzh1KD4XrRIElTiUMD1LiUQ8cLF6AusFGnmr1kSkeDYVbW
	oGeC1hnOq38Ms20CSysQrtrYxfW2dOw+WvCxMkQ8GxppBoD1Jmmo2Dq+lEjEMjtnSZXLCtAP6UL
	Xb5N0WOAt9BYAilglUSWCldFIJAYI3s3ydgtiaKg==
X-Google-Smtp-Source: AGHT+IE3aYPKQhA3JTw9tSf5TPOec0+aL0hUx34xQqnLoed5SBOn8rW6c+/UgrHXUkcaMJPKba4Qkg==
X-Received: by 2002:a05:6a20:e291:b0:2df:8271:f095 with SMTP id adf61e73a8af0-3614ecbf7e9mr33783469637.24.1764346006160;
        Fri, 28 Nov 2025 08:06:46 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:45 -0800 (PST)
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
Subject: [PATCH 5.15.y 11/14] timers: Add shutdown mechanism to the internal functions
Date: Sat, 29 Nov 2025 01:05:36 +0900
Message-Id: <20251128160539.358938-12-aha310510@gmail.com>
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
---
 kernel/time/timer.c | 62 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 0b76a2ab42e3..b46614e14da1 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1300,12 +1300,19 @@ EXPORT_SYMBOL_GPL(add_timer_on);
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
@@ -1313,9 +1320,22 @@ static int __timer_delete(struct timer_list *timer)
 
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
 
@@ -1338,20 +1358,31 @@ static int __timer_delete(struct timer_list *timer)
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
@@ -1363,6 +1394,8 @@ static int __try_to_del_timer_sync(struct timer_list *timer)
 
 	if (base->running_timer != timer)
 		ret = detach_if_pending(timer, base, true);
+	if (shutdown)
+		timer->function = NULL;
 
 	raw_spin_unlock_irqrestore(&base->lock, flags);
 
@@ -1387,7 +1420,7 @@ static int __try_to_del_timer_sync(struct timer_list *timer)
  */
 int try_to_del_timer_sync(struct timer_list *timer)
 {
-	return __try_to_del_timer_sync(timer);
+	return __try_to_del_timer_sync(timer, false);
 }
 EXPORT_SYMBOL(try_to_del_timer_sync);
 
@@ -1468,12 +1501,25 @@ static inline void del_timer_wait_running(struct timer_list *timer) { }
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
 
@@ -1503,7 +1549,7 @@ static int __timer_delete_sync(struct timer_list *timer)
 		lockdep_assert_preemption_enabled();
 
 	do {
-		ret = __try_to_del_timer_sync(timer);
+		ret = __try_to_del_timer_sync(timer, shutdown);
 
 		if (unlikely(ret < 0)) {
 			del_timer_wait_running(timer);
@@ -1555,7 +1601,7 @@ static int __timer_delete_sync(struct timer_list *timer)
  */
 int timer_delete_sync(struct timer_list *timer)
 {
-	return __timer_delete_sync(timer);
+	return __timer_delete_sync(timer, false);
 }
 EXPORT_SYMBOL(timer_delete_sync);
 
--
