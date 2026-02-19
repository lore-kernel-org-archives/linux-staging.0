Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718F334F478
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521235; cv=none; b=DWhW9L9QLVpFD3w/W3G2XfToe7uMRpFyXEppJ4Uhy74atFnpQEJ89GJ1TwM3NbL4HBtWoQ2tbX9clg0BiQ65lDDJvCPpHctJZ/43hr3NoGcMulIeXsqapmcz9ns3oGgDTL1/zn2yRUREOmSbXKpORa62/4NR5srHVXyuBTCg9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521235; c=relaxed/simple;
	bh=A7NZvw6BwM3JH9LFTZM0pkj7MM2Mf/KMJNxtIByaxbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKJawA5ozW7+x/NpK3VbOErchS835CT7aU3v0BieAUIkg1ar94hDCi8ybkMDgzvERZoKQjxrprvgB09MDLbi3GqqhZE7cJMvk8H60siRqRDvaY+AnZ21ny8Mc7ojpSXZAJaj8vjD2Q8N5YKjUYUU16YrDKJSTsRHCCiTUhH4JeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlW6Mp/Z; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlW6Mp/Z"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c6e266a3572so399602a12.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521234; x=1772126034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIvAwaANSEMHidUC241SU/ATL2QFU3HABzkGaIq1H88=;
        b=AlW6Mp/ZOfmzuXzv0nV9q9ipgvGx4Hb43z5svHFoHet7kljokZ0dsuLMFblqGQu4vT
         GdWTFd0hPX0vr6vkW9VTVO5nsWzVe2N5HyBj61o3f+z2+Bzx0nIjjja9jQw5UtLvSXHs
         y8x1FgRu//2760BuX5gW3y2ONQ2kakrlAOOORb3+bOnlOyGGXOWKTeqpDIKqb9s2B9GI
         vr6voDayBb4SkQL6NajyJd6b0h0uqZR9o/zy1dA1OBArOlfsMyRr3Mmt9J22VDbM4w7c
         gYRTXYyMtIWsB1vs0dB60jJSIGbvxxBBfrQhwOYMo9K18YC5dUvW2USnn9V/gMVUG1+O
         mgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521234; x=1772126034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HIvAwaANSEMHidUC241SU/ATL2QFU3HABzkGaIq1H88=;
        b=Ih/fVyZ3eynVEkWFjYkmVT6tiltMtmsqIiyqX2EnG9yTMsBG3tXj5UfarFqcTNcACZ
         2X5NAeZYzaYXJJNliwMD+dwPRAVZCC5XsCkxUtEQ8zHuDpmQ1yAdH/0Vx+CJ1wzS6W8Q
         pPsbqRL4CgjVmlu4zPNbBbi6kD+PGEWmLtHnO3/AIibnc63bX/TkUSlWJHLEOaIC9SE9
         dTPrgZ5LzKhTuZswvIHx56ezqEHSJHXDLF7yuhO2dCNuGfe/BMMeMrcuC92D6iomgHIS
         VQE/hvIIE+shvgMyP2kPPN5SJLmdd18R9ZaCNHkoLLvaC33wqMKWhgjoINHt6a/X51wn
         omPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjUWRap0Lrqrn8A/zE8nvGNVxs+Spi8DWRiJKvlFTVKIDbDwopBrr4iO3EOD1YsffX7MXTFywu6o5GBILu@lists.linux.dev
X-Gm-Message-State: AOJu0YyMo6LVzzZXEiPxdrIgOz2SIvus1SW96bNG/FAgeegnSc4HmOk9
	bW6xOL4M08H+EYWwn+MaJMvebOEJ2OuhRdD3elZB1IalaD4tLtmriYX1
X-Gm-Gg: AZuq6aKUDvaqlBg0wt/VOwuR8sc3xF/sSPyAmhOXIbDgdUqpxUVpONnsX3vaa/gw2kx
	fFkJ/CCAD+5AAHsPtAdBpXZFSU4fDcZPTxjROHnmpfhxGCvKRiYxydz1YXeIwsMnRVaitkhjtKz
	XVgUxmK6UXeOr4b83PuAaLHlYI5omoKE5nuyiwNlDKTiMNqi6ks5mqLP/goF2YUITZQ27JNXlPj
	bmcL/llTp44YiFrq4bNeTQcsS0nF7HU9lBrzOWda62NpB9VBlVFzibnkaILK/XhrK9D+x9JXfvM
	sV6kZwBBsGYNGmceDMRrEMMbVz0uCmdo2ptnRj924AtuNpET+MYHfCAhQO8LLD/9LjjRrXVvBSG
	iaLTDSCCHnzb6Wu93cBOHZ34dYhHGE1dVawqLc+HYPJ7pJb2CVtH3+BOtjeurDNlpWzF49UsKR9
	7XqDDsQOZdBun4SbPDpXq0qeniBRaXvOysd9lJtOgHDJ4cIV+6HIExpsmp34ge
X-Received: by 2002:a17:902:db01:b0:2a0:d629:903f with SMTP id d9443c01a7336-2ad50e76db9mr47242025ad.9.1771521233834;
        Thu, 19 Feb 2026 09:13:53 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:52 -0800 (PST)
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
	zouyipeng@huawei.com,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.10.y 09/15] timers: Silently ignore timers with a NULL function
Date: Fri, 20 Feb 2026 02:13:04 +0900
Message-Id: <20260219171310.118170-10-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219171310.118170-1-aha310510@gmail.com>
References: <20260219171310.118170-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit d02e382cef06cc73561dd32dfdc171c00dcc416d ]

Tearing down timers which have circular dependencies to other
functionality, e.g. workqueues, where the timer can schedule work and work
can arm timers, is not trivial.

In those cases it is desired to shutdown the timer in a way which prevents
rearming of the timer. The mechanism to do so is to set timer->function to
NULL and use this as an indicator for the timer arming functions to ignore
the (re)arm request.

In preparation for that replace the warnings in the relevant code paths
with checks for timer->function == NULL. If the pointer is NULL, then
discard the rearm request silently.

Add debug_assert_init() instead of the WARN_ON_ONCE(!timer->function)
checks so that debug objects can warn about non-initialized timers.

The warning of debug objects does not warn if timer->function == NULL.  It
warns when timer was not initialized using timer_setup[_on_stack]() or via
DEFINE_TIMER(). If developers fail to enable debug objects and then waste
lots of time to figure out why their non-initialized timer is not firing,
they deserve it. Same for initializing a timer with a NULL function.

Co-developed-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home
Link: https://lore.kernel.org/all/20221110064101.429013735@goodmis.org
Link: https://lore.kernel.org/r/87wn7kdann.ffs@tglx
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 kernel/time/timer.c | 57 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 7094b916c854..3b6624cd9507 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1017,7 +1017,7 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
 	unsigned int idx = UINT_MAX;
 	int ret = 0;
 
-	BUG_ON(!timer->function);
+	debug_assert_init(timer);
 
 	/*
 	 * This is a common optimization triggered by the networking code - if
@@ -1044,6 +1044,14 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
 		 * dequeue/enqueue dance.
 		 */
 		base = lock_timer_base(timer, &flags);
+		/*
+		 * Has @timer been shutdown? This needs to be evaluated
+		 * while holding base lock to prevent a race against the
+		 * shutdown code.
+		 */
+		if (!timer->function)
+			goto out_unlock;
+
 		forward_timer_base(base);
 
 		if (timer_pending(timer) && (options & MOD_TIMER_REDUCE) &&
@@ -1070,6 +1078,14 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
 		}
 	} else {
 		base = lock_timer_base(timer, &flags);
+		/*
+		 * Has @timer been shutdown? This needs to be evaluated
+		 * while holding base lock to prevent a race against the
+		 * shutdown code.
+		 */
+		if (!timer->function)
+			goto out_unlock;
+
 		forward_timer_base(base);
 	}
 
@@ -1128,8 +1144,12 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
  * mod_timer_pending() is the same for pending timers as mod_timer(), but
  * will not activate inactive timers.
  *
+ * If @timer->function == NULL then the start operation is silently
+ * discarded.
+ *
  * Return:
- * * %0 - The timer was inactive and not modified
+ * * %0 - The timer was inactive and not modified or was in
+ *	  shutdown state and the operation was discarded
  * * %1 - The timer was active and requeued to expire at @expires
  */
 int mod_timer_pending(struct timer_list *timer, unsigned long expires)
@@ -1155,8 +1175,12 @@ EXPORT_SYMBOL(mod_timer_pending);
  * same timer, then mod_timer() is the only safe way to modify the timeout,
  * since add_timer() cannot modify an already running timer.
  *
+ * If @timer->function == NULL then the start operation is silently
+ * discarded. In this case the return value is 0 and meaningless.
+ *
  * Return:
- * * %0 - The timer was inactive and started
+ * * %0 - The timer was inactive and started or was in shutdown
+ *	  state and the operation was discarded
  * * %1 - The timer was active and requeued to expire at @expires or
  *	  the timer was active and not modified because @expires did
  *	  not change the effective expiry time
@@ -1176,8 +1200,12 @@ EXPORT_SYMBOL(mod_timer);
  * modify an enqueued timer if that would reduce the expiration time. If
  * @timer is not enqueued it starts the timer.
  *
+ * If @timer->function == NULL then the start operation is silently
+ * discarded.
+ *
  * Return:
- * * %0 - The timer was inactive and started
+ * * %0 - The timer was inactive and started or was in shutdown
+ *	  state and the operation was discarded
  * * %1 - The timer was active and requeued to expire at @expires or
  *	  the timer was active and not modified because @expires
  *	  did not change the effective expiry time such that the
@@ -1200,6 +1228,9 @@ EXPORT_SYMBOL(timer_reduce);
  * The @timer->expires and @timer->function fields must be set prior
  * to calling this function.
  *
+ * If @timer->function == NULL then the start operation is silently
+ * discarded.
+ *
  * If @timer->expires is already in the past @timer will be queued to
  * expire at the next timer tick.
  *
@@ -1228,7 +1259,9 @@ void add_timer_on(struct timer_list *timer, int cpu)
 	struct timer_base *new_base, *base;
 	unsigned long flags;
 
-	if (WARN_ON_ONCE(timer_pending(timer) || !timer->function))
+	debug_assert_init(timer);
+
+	if (WARN_ON_ONCE(timer_pending(timer)))
 		return;
 
 	new_base = get_timer_cpu_base(timer->flags, cpu);
@@ -1239,6 +1272,13 @@ void add_timer_on(struct timer_list *timer, int cpu)
 	 * wrong base locked.  See lock_timer_base().
 	 */
 	base = lock_timer_base(timer, &flags);
+	/*
+	 * Has @timer been shutdown? This needs to be evaluated while
+	 * holding base lock to prevent a race against the shutdown code.
+	 */
+	if (!timer->function)
+		goto out_unlock;
+
 	if (base != new_base) {
 		timer->flags |= TIMER_MIGRATING;
 
@@ -1252,6 +1292,7 @@ void add_timer_on(struct timer_list *timer, int cpu)
 
 	debug_timer_activate(timer);
 	internal_add_timer(base, timer);
+out_unlock:
 	raw_spin_unlock_irqrestore(&base->lock, flags);
 }
 EXPORT_SYMBOL_GPL(add_timer_on);
@@ -1541,6 +1582,12 @@ static void expire_timers(struct timer_base *base, struct hlist_head *head)
 
 		fn = timer->function;
 
+		if (WARN_ON_ONCE(!fn)) {
+			/* Should never happen. Emphasis on should! */
+			base->running_timer = NULL;
+			continue;
+		}
+
 		if (timer->flags & TIMER_IRQSAFE) {
 			raw_spin_unlock(&base->lock);
 			call_timer_fn(timer, fn, baseclk);
--
