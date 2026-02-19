Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B6934DB66
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521226; cv=none; b=ljXDsh2SaV2NTBtNbttQtuQGjQ0plkpHuWk5+JJKV4J8u243BVy7As7IprIgK6Qo3w6T6tpmVcCCK6pnJAacO90Ctn4xD8GKAa0Ts54smDLl17w5DBLuOC5c8bZacehEiFaVWquVCZh0wQf5cL6dNKZENMzUWTDrmHFLQHTDZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521226; c=relaxed/simple;
	bh=xUOfVR4rsP4k4iSxfTxt28P2aCRP7f27RFLz88rROqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sbyFPDymxTYfA76+AyWhOtGLbTDjaeyt7to8Wmhr9n4MHQ7ATW4Icm0ajUa0/cA3/3MiuLffIkUPuhFstlk/15MC1H0sPe6owg5Hsefe4mrf5V6RzE//IyM5GCz9MpU0qny+YzCT3tuaxDrXAOHYiHB3QdprCgChA3Ft0jWbBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPyh7juX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPyh7juX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a79998d35aso7442345ad.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521225; x=1772126025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aRj16inyvCNx7XEzEMiTg0hEspzqpDmbN1/ltb1rWU=;
        b=aPyh7juXP+OdFFUOsm3JVw6xau1+oBRyabWo0osC2bmaWtBNgChMUl4/L3iXok8Yv8
         DATGnDBWLUUW/ZO9EFHaF+3N1sf2f8TVEwzisa4JggypRdorG7stG+PgOXNwYgqGU66r
         skx2Qn1+CntUSoJXQv6vYd7aA1p8SHWHaW1aqXah8Nn6nYytyX0XxLv6BdEDNVEl5tRi
         s2fHpRGoQeP1MOn19xPaN6djjUApQGJTIbsXywO0j0SzIWaF0vsG2OIwH1EllAKjsK7p
         9NtnFPe27lDtGLdMKRFteAz9G9nAeiDJCyt/mq4DS0vTsAPHdt666LVGyAVyhXdihXZ/
         QmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521225; x=1772126025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5aRj16inyvCNx7XEzEMiTg0hEspzqpDmbN1/ltb1rWU=;
        b=ajSzvrKNIA1mcfvARhJcnrEAuJsq7HAMA7ZyomUgEE5ji2EzcBMXOQeR8nIAY4QTUO
         E1QfWe8061C5MUPo5XBOjgLnV2ixH0TzwPGqsZQaBx/oU9J+26D5Wb0798RrW60usd2F
         TUgI04txbomeOX13TobhnBGPKryKGtuBleBTIykXfU9jaS548alcGA/zl1863GWMVq9k
         WxA3A9gN2SZq1Yl2PqdGpzLKecRcg4wGodfxHQ0IDfrQlxqmXB5/nlouQibqSHrCg1Jg
         u1K0UqdMmEpBgkwF47SufbUr66Y/429pelJ6EzJvDcTQBWmtwDLYkmIeUiAq/ZmXEWHG
         1rFg==
X-Forwarded-Encrypted: i=1; AJvYcCXxyas2/ffGlvHDE5oyiLovGYfxUujuCt9W6NQNjOyXk7htSRkXvqCNn0WHp72MsR808A2ThyP11JFt89vF@lists.linux.dev
X-Gm-Message-State: AOJu0YxPZJxNkgNXm/dtABawhXdtD+I2flPl9hln1h7wMF+w0G78b29Q
	WOP0egUtMLo9z4Sl+0ut6cd0ApQpN+wThEKyMp5JnC/Cz7SjX/Vsmh6J
X-Gm-Gg: AZuq6aLhM1xFob4Iu0L/UmioIe8QxmpuXgPNE/jaxJNW/1DLQ0kpIAoIvPOeu+1sHQu
	I6YHKm8EIS3ysJSxQMt8866b9DeF7yLuZSUDa6Va9YMaKBKMN2zuTXQo2C1MMglIDXlxbnEkrRA
	baKRF0hA935qDNDJUySz61Q5OdGK8WdbWym0BvacMJER/29plDoSCRAWB7jgjt0LEJkrCpfoKbu
	dzKi1GyEUDaJ2zD9jSIc23wbTBTOoTvJRC2I8b1Fk2NIlZ0RtoWyBL6IyIwL4KwVkiTXxL9lCzi
	OipOOQWGgujQ8omZBV/ZzDlAXtjKoFrv/Q4XkIARMSOW2nfO9xRXgCoV23YuX7GqDIG5mEKl4H3
	RhEeQdvy78xe+/QSbWnrQBW2g5wN7dcIY3VBJIb0OlCkbDgeditdasFHouKsbTLFYsPXKR1xFna
	6f/0J72xvEyIE+nM2huHoEF9lI/A8JiMPfn/p/JNEH3zdi4iZ93EnzthokIs+A
X-Received: by 2002:a17:903:2b0d:b0:2aa:d7a7:8091 with SMTP id d9443c01a7336-2ad5aed3fcemr29265505ad.12.1771521224611;
        Thu, 19 Feb 2026 09:13:44 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:43 -0800 (PST)
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
Subject: [PATCH 5.10.y 07/15] timers: Rename del_timer() to timer_delete()
Date: Fri, 20 Feb 2026 02:13:02 +0900
Message-Id: <20260219171310.118170-8-aha310510@gmail.com>
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

[ Upstream commit bb663f0f3c396c6d05f6c5eeeea96ced20ff112e ]

The timer related functions do not have a strict timer_ prefixed namespace
which is really annoying.

Rename del_timer() to timer_delete() and provide del_timer()
as a wrapper. Document that del_timer() is not for new code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201625.015535022@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 include/linux/timer.h | 15 ++++++++++++++-
 kernel/time/timer.c   |  6 +++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 551fa467726f..e338e173ce8b 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -169,7 +169,6 @@ static inline int timer_pending(const struct timer_list * timer)
 }
 
 extern void add_timer_on(struct timer_list *timer, int cpu);
-extern int del_timer(struct timer_list * timer);
 extern int mod_timer(struct timer_list *timer, unsigned long expires);
 extern int mod_timer_pending(struct timer_list *timer, unsigned long expires);
 extern int timer_reduce(struct timer_list *timer, unsigned long expires);
@@ -184,6 +183,7 @@ extern void add_timer(struct timer_list *timer);
 
 extern int try_to_del_timer_sync(struct timer_list *timer);
 extern int timer_delete_sync(struct timer_list *timer);
+extern int timer_delete(struct timer_list *timer);
 
 /**
  * del_timer_sync - Delete a pending timer and wait for a running callback
@@ -198,6 +198,19 @@ static inline int del_timer_sync(struct timer_list *timer)
 	return timer_delete_sync(timer);
 }
 
+/**
+ * del_timer - Delete a pending timer
+ * @timer:	The timer to be deleted
+ *
+ * See timer_delete() for detailed explanation.
+ *
+ * Do not use in new code. Use timer_delete() instead.
+ */
+static inline int del_timer(struct timer_list *timer)
+{
+	return timer_delete(timer);
+}
+
 extern void init_timers(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 60e538b566e3..2b5e8c26b697 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1257,7 +1257,7 @@ void add_timer_on(struct timer_list *timer, int cpu)
 EXPORT_SYMBOL_GPL(add_timer_on);
 
 /**
- * del_timer - Deactivate a timer.
+ * timer_delete - Deactivate a timer
  * @timer:	The timer to be deactivated
  *
  * The function only deactivates a pending timer, but contrary to
@@ -1270,7 +1270,7 @@ EXPORT_SYMBOL_GPL(add_timer_on);
  * * %0 - The timer was not pending
  * * %1 - The timer was pending and deactivated
  */
-int del_timer(struct timer_list *timer)
+int timer_delete(struct timer_list *timer)
 {
 	struct timer_base *base;
 	unsigned long flags;
@@ -1286,7 +1286,7 @@ int del_timer(struct timer_list *timer)
 
 	return ret;
 }
-EXPORT_SYMBOL(del_timer);
+EXPORT_SYMBOL(timer_delete);
 
 /**
  * try_to_del_timer_sync - Try to deactivate a timer
-- 
