Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58D02BE020
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345987; cv=none; b=E/GY7t/46HojO/9XLEvYTya85oLBpoJzHccmQ61iw/xG4lJ+vNbOR3EggIXIESAPJFcatYAg8mODjiJEDZ0qxPlavRFHpmM6CASkUN/YxjMGN3kdCsUZa49U3bSqR5/MS8gPCUM/WJAlZlephuP84pBVokokmB/O+tbY09XOolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345987; c=relaxed/simple;
	bh=xUOfVR4rsP4k4iSxfTxt28P2aCRP7f27RFLz88rROqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jbFsMI79zx+w7/GQsgg+/TvHMU9zynszAIYw9BvJkWUP0ShdSc09GVKNDFrEUtKlB8qnLrUqic+Ecn3BTryw5/fA0LO/YjKSlqH1pBrx3EKuF67JU8r87k5smfHljqcumeF9cU/M6N7bLxlvsYpYrqHHnRIWm+Wu7LmNnBuJ7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO/8XBIR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO/8XBIR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1809723b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345985; x=1764950785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aRj16inyvCNx7XEzEMiTg0hEspzqpDmbN1/ltb1rWU=;
        b=BO/8XBIRTnWV1vopcHa20UTlx+nzhGWg8j04cOD4Z2Tdm87fyJuI44WeFvyvOJ9/Xs
         bSMRyWnStLo2RDhPEjLJyTf6li4fLn9JxXJxzK+3bozEXIP36B278oHugOC13/kMu8be
         nqfm+qOlUYOAsfh0o2uSmNtcTapbY2O27NXIZ9h4s5TgAYqFCCAxzGPuAy/MxvdmfTcW
         cgG5HHcgADQQWpX0/bMNWllPbakYP5Yhs+OW1bZ/Pcv7bx2osE7+DGzibeZyTFAFiz67
         QCtiQGVFE42cdeeCtHKb0sUV/Lu2CtCsCf1yaDn20y1KU0KdPDsYZsISnPrXMc3FRAYw
         6HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345985; x=1764950785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5aRj16inyvCNx7XEzEMiTg0hEspzqpDmbN1/ltb1rWU=;
        b=KdWGvvhFcIa63ZV+6hButUaFdg8ryQWRbuotisci4vMoiiMiQiUkdCmQaQa72bsid9
         gSfoAtMG2YhN+fVI/cN6dCJpWzZiMpNtgkpkhO7KewxYOzZItqEna6QkGUZ/kQro6z5y
         0GRtvi5cl3jZvrEysFa7wTp7TcOWvYI8J0HJkIlhYNsyepvD+cykXLFE5rHwXLkzYim3
         6UOJ4elApt7vgbmcUghhKvRSy99FCfLxNb3MtmruLyCWavK6p79/UGzypT6EAbZQFN06
         b/Z0dpMYSvCbDhkQfN3uHgoeI2wVcthOCu+y5pQ2eH0BqIj9IlgjNPFi4yTV0neiYl9P
         naZw==
X-Forwarded-Encrypted: i=1; AJvYcCXhysbYFRvAK+gNo8vWVycZ4W/VwlzBv3e22CdOo/vzPlMQs/5xEEWN8rgvj8JN3W1RCAhVkA+zdMyqXD8S@lists.linux.dev
X-Gm-Message-State: AOJu0YyNnzqSwVVjWSShW5ZNaCfrE0MMeSH39ncESqZz/VMW4kWNGC4g
	JUIIWsmv8urHQAOomp0bRGOjz59VlHInHLzVF+oe+Y4KvLZTECzY5j73
X-Gm-Gg: ASbGnctW4/rQLqHp99ci892GE9EHFWWIealuKBEEIdReDTdQvF5QHqvE2o7R/TIO1SA
	9/u8KTHdY2gX4HvCfSii5yx0o1yIR9N33sCixM/Waq1Sf2gFeTspBygUqNZiSF9JseZzYRnvfYm
	I+FGarEvfEfG91+2qukqv0vfNxHOAEIJJvcS4qruPeQAsjT4WycsGmesimUZ83KW8bNztW9u7Xu
	67gsy12SCITwyOuI2qg73OfZU4u9acvGvnrqM4uKIGYvRqJ6PIJ3pnBEVsIYyjmz1f9gXTMZQbF
	IzYZgJA9huNKoVo9/rkPaM5WglKhI65LG3y4GBn7cKwloRW5YN6jMZc9LrjiJUU3g1nN8wjHii7
	txC6cl+1uhGcRuFg7GymmmdqR2asMo1PIZhmd/QXVqVzJx2Jowkm1SintMALNQYvl9yhPtAmfwb
	BPbIDJRDvLpLobK7WMmNlwZ3zflOHMMSNVuUhbaA==
X-Google-Smtp-Source: AGHT+IEztlvGKlUoqD0g25lCC8MUysNRG6xtAj50T9YwNqBxGNZ27/ROzosGghSBWQujOhn5Z/L7rQ==
X-Received: by 2002:a05:6a00:987:b0:7b8:7c1a:7f60 with SMTP id d2e1a72fcca58-7ca8977c27emr17931768b3a.12.1764345984715;
        Fri, 28 Nov 2025 08:06:24 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:23 -0800 (PST)
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
Subject: [PATCH 5.15.y 07/14] timers: Rename del_timer() to timer_delete()
Date: Sat, 29 Nov 2025 01:05:32 +0900
Message-Id: <20251128160539.358938-8-aha310510@gmail.com>
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
