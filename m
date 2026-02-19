Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8334EF0E
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521248; cv=none; b=M3AfEb2lET1J6tzhdxASmT6rtNgPIp3ELJnxY2zPwjjxZ3coqqgOA3WIe/5+9sb1ZBvZydYjb+2LcLaDW0q+dnTKcWQfV2Bt4TfPx+t6sTb+nkjiHJ7XvsWAErXnRNwRVu3OJ5L3B9AcZ9LhSQCPJgnurFW2lZV7dMiFbmbTKbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521248; c=relaxed/simple;
	bh=J7+paRiPLaCD/c+KTz8seNjK8t39KhNj40mTnjX9HD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GM266T1m7TfCNJ/rOfaIHqBU9fAj7KzTkKiTe1dB6IgBjU9eCPm0+c/6Zg7QUtrq6SMrdCXhzQpLCPfBCBmk0SKDdVlP2aRt+BDqtQJOp+QH0vJE/9nsDF5wOhImLrycK2wOgemPGjBedt43IJQlMomRq5q5HcE6p+oX6Jafr/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtfdG3Cn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtfdG3Cn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8230c839409so1111488b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521246; x=1772126046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkZJqZ3kQT2WglZ48UatqwsWbUOwu2gzPSjhRt06PHw=;
        b=CtfdG3Cn78fwAP5HeG6U56jTwuFLGrejpaE0nygn4cHLuS7vjTufpFw4UDuaxVn/Vp
         EgWYqafjrR0zSJC8UM7Emttr0Nttpxe0kdYaCVquNd4UO9fBlqYgqggaJZUzK7S+uhss
         xE9/xW9SJA4ga6tc6EkF/NivlMBpKrCHAbid06CzbvNoLhaKajoiOSQzGi26UKNOD/WB
         alOG4YN6I5xWuOFFsYfCMFubOGvzBUzu4cNV3DYy/2LZSj8+w0X4iweIGl7MklMnhIVW
         dacyZQUzNBn3braTN0HgeygDcfttTA7Wha8BLGAgheC9e5EBf9YmOI6rQ/FSfFtMPtSH
         LkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521246; x=1772126046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkZJqZ3kQT2WglZ48UatqwsWbUOwu2gzPSjhRt06PHw=;
        b=hM0H1zProlXl7l4jXM+TbbassKFxR5tSFhBdZdnpJZap6QiLV64oEY+skkGKUGEmb/
         4XhjXrwF57kTpTs7jXCmKjHNq4mv6D2BNTbt9JlkT8dDQOIGAhNFV9UnSjv3tctX25rn
         GjLEAMcJ+p9x6nf9FJPwGG9kSRIEQK7AVK0YxRVFwpU7qxDF6sNgFdETBY4d+CAybPI4
         cdK4v4fM/F/N8vY7n/siL+K9s+wJVi1wcZYVN1vMDigvlCJ2gpL1S5kKvpdFdWgoM04w
         sFiojZ0C9kd941tLSS9FiPJJZ+vQL8pcHaGvZpJUJM5PdPIEO7JWWfDSRScKrV0iJOxu
         rBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyzvFY6eab3LrsbJ4jM/KOFAgC/GZTJPXs25v/7diFmiExK6DjQ14KgbDA2f15U0GiT0Nh3jukB3CVRuuU@lists.linux.dev
X-Gm-Message-State: AOJu0YzPhvHkbXBAgYBRsWfhJH6VQU3/pw43yB1LVWjnWhFGEYuD1fmr
	97du7CxRzLvY1hEwMAw9bI3/d5moLleJYUS4RAkzkvDtrED/cLEQ91bn
X-Gm-Gg: AZuq6aJRcmgpLb4/0CZcKO3sWe+wa1IyxWv23Brft3r6PuujnrTDWUNmnJU61WseaWi
	17I3R1eHAb1fxv3yV1z3LH1YgasYB/ckBPWQp94zfeMyqRTp0bb69kWUitf9uxw3bCrLZSj0R26
	TwLYfU6vlrJL653m2JMQzkZusvcsHGaHPsEgV+fQZVjhxxXGhXqSipTsfRIfnV/ShpTeqaPrq5+
	moOJkPkXHKrzk7YoLnJBNh0tLMGaPghCHnGbf/WfmEolxyQiPL3eiRTsjv1Z/sepGHQZEo6lzqe
	3ZauzeJj1s2+G4hDH9rrn5/idhEjU9/HXOFfkHmaX2eBT34BzvmSp4Q9vrWq9Oj7OC6A+76WkrJ
	Z5p53H6og4oFr34OcGSICOXx+Y4ReAFPQ8yzI2dry84LGPYjH0HDRf95III2CvYngYJ/r8DzW68
	YnvITJezlk+XSrzdNMfX97PrxW/Smm+vxbUv4PVo1JW8rjUz6AVg==
X-Received: by 2002:a05:6a21:2982:b0:394:662e:89ab with SMTP id adf61e73a8af0-394fc24ddc9mr5454817637.23.1771521246359;
        Thu, 19 Feb 2026 09:14:06 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:14:05 -0800 (PST)
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
Subject: [PATCH 5.10.y 12/15] timers: Provide timer_shutdown[_sync]()
Date: Fri, 20 Feb 2026 02:13:07 +0900
Message-Id: <20260219171310.118170-13-aha310510@gmail.com>
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

[ Upstream commit f571faf6e443b6011ccb585d57866177af1f643c ]

Tearing down timers which have circular dependencies to other
functionality, e.g. workqueues, where the timer can schedule work and work
can arm timers, is not trivial.

In those cases it is desired to shutdown the timer in a way which prevents
rearming of the timer. The mechanism to do so is to set timer->function to
NULL and use this as an indicator for the timer arming functions to ignore
the (re)arm request.

Expose new interfaces for this: timer_shutdown_sync() and timer_shutdown().

timer_shutdown_sync() has the same functionality as timer_delete_sync()
plus the NULL-ification of the timer function.

timer_shutdown() has the same functionality as timer_delete() plus the
NULL-ification of the timer function.

In both cases the rearming of the timer is prevented by silently discarding
rearm attempts due to timer->function being NULL.

Co-developed-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home
Link: https://lore.kernel.org/all/20221110064101.429013735@goodmis.org
Link: https://lore.kernel.org/r/20221123201625.314230270@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 include/linux/timer.h |  2 ++
 kernel/time/timer.c   | 66 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index e338e173ce8b..9162f275819a 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -184,6 +184,8 @@ extern void add_timer(struct timer_list *timer);
 extern int try_to_del_timer_sync(struct timer_list *timer);
 extern int timer_delete_sync(struct timer_list *timer);
 extern int timer_delete(struct timer_list *timer);
+extern int timer_shutdown_sync(struct timer_list *timer);
+extern int timer_shutdown(struct timer_list *timer);
 
 /**
  * del_timer_sync - Delete a pending timer and wait for a running callback
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index b46614e14da1..4f39025ac933 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1362,6 +1362,27 @@ int timer_delete(struct timer_list *timer)
 }
 EXPORT_SYMBOL(timer_delete);
 
+/**
+ * timer_shutdown - Deactivate a timer and prevent rearming
+ * @timer:	The timer to be deactivated
+ *
+ * The function does not wait for an eventually running timer callback on a
+ * different CPU but it prevents rearming of the timer. Any attempt to arm
+ * @timer after this function returns will be silently ignored.
+ *
+ * This function is useful for teardown code and should only be used when
+ * timer_shutdown_sync() cannot be invoked due to locking or context constraints.
+ *
+ * Return:
+ * * %0 - The timer was not pending
+ * * %1 - The timer was pending
+ */
+int timer_shutdown(struct timer_list *timer)
+{
+	return __timer_delete(timer, true);
+}
+EXPORT_SYMBOL_GPL(timer_shutdown);
+
 /**
  * __try_to_del_timer_sync - Internal function: Try to deactivate a timer
  * @timer:	Timer to deactivate
@@ -1595,6 +1616,9 @@ static int __timer_delete_sync(struct timer_list *timer, bool shutdown)
  * lock. If there is the possibility of a concurrent rearm then the return
  * value of the function is meaningless.
  *
+ * If such a guarantee is needed, e.g. for teardown situations then use
+ * timer_shutdown_sync() instead.
+ *
  * Return:
  * * %0	- The timer was not pending
  * * %1	- The timer was pending and deactivated
@@ -1605,6 +1629,48 @@ int timer_delete_sync(struct timer_list *timer)
 }
 EXPORT_SYMBOL(timer_delete_sync);
 
+/**
+ * timer_shutdown_sync - Shutdown a timer and prevent rearming
+ * @timer: The timer to be shutdown
+ *
+ * When the function returns it is guaranteed that:
+ *   - @timer is not queued
+ *   - The callback function of @timer is not running
+ *   - @timer cannot be enqueued again. Any attempt to rearm
+ *     @timer is silently ignored.
+ *
+ * See timer_delete_sync() for synchronization rules.
+ *
+ * This function is useful for final teardown of an infrastructure where
+ * the timer is subject to a circular dependency problem.
+ *
+ * A common pattern for this is a timer and a workqueue where the timer can
+ * schedule work and work can arm the timer. On shutdown the workqueue must
+ * be destroyed and the timer must be prevented from rearming. Unless the
+ * code has conditionals like 'if (mything->in_shutdown)' to prevent that
+ * there is no way to get this correct with timer_delete_sync().
+ *
+ * timer_shutdown_sync() is solving the problem. The correct ordering of
+ * calls in this case is:
+ *
+ *	timer_shutdown_sync(&mything->timer);
+ *	workqueue_destroy(&mything->workqueue);
+ *
+ * After this 'mything' can be safely freed.
+ *
+ * This obviously implies that the timer is not required to be functional
+ * for the rest of the shutdown operation.
+ *
+ * Return:
+ * * %0 - The timer was not pending
+ * * %1 - The timer was pending
+ */
+int timer_shutdown_sync(struct timer_list *timer)
+{
+	return __timer_delete_sync(timer, true);
+}
+EXPORT_SYMBOL_GPL(timer_shutdown_sync);
+
 static void call_timer_fn(struct timer_list *timer,
 			  void (*fn)(struct timer_list *),
 			  unsigned long baseclk)
--
