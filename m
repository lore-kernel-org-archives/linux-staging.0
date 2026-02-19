Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F545349B1F
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521214; cv=none; b=nrdcel7Ja6xGCrJkXt2c8CLvvkbCpW3j1k25u5h9lGneRUsD8Nh8npRBZVUD/lRt0VzmlRPooVDNEm1p4zy1jCbTQgcAxvHxDHpueB2qUilNAJsvBGd0OdGAqImEnLOuRoHwfCgax61d3uEZ52qk3jm3am7L/s7pUrhIoZsF1yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521214; c=relaxed/simple;
	bh=kyxULOv2H236l1ucHIwcTRr5nnWT32c4Zye+wWGrJ6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=araVMY8u3gT6z/5fNPm2pXSR8zURAkDH/ssKqhs+oyQ2QqdMJjqPT3+h2tyf8KD3iJ+l9qGGJZWbGc53IqYrOg4qd9yrA6hQ0aGJTr0Ql8FX/Rzku37LCrPHEccDOvkNKa3z0exgFu0p2DyAML5ZIAp82IA5ZuOuwzn13mVoFj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8Ny4HZp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8Ny4HZp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso618019b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521212; x=1772126012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scjH6AQBXgOEyOguxVYTHq5LOFFjJgFpmI1fsS6Z7tY=;
        b=G8Ny4HZpTx6YITy7AtmJt5DvI5Hk32qxBRK0aNcAEHpkEpIhUcXBzsuUZHQCWfx05X
         +nSCmDOSA1cbGaY/FzYkuDNgUHkEAdrcqRlDncx5A7Pp/1iS1OZxngSUR/tMRCgyfdzM
         VD3lkuHmdCFyOUnTnBwr+YZakJPBfh2KulMSTkXTJ4kHCTARrja3arR3429Qa5vlSlJU
         alXOME1gik4kzRSTUD68//kAhpi8ztEtTtIdtnELHJ8Im17iDq5nGuZ/AzV8ITelm2SK
         YYU0TwERJMzscEaBY/DhkYoMisEHQLVyYorcERrWqF6f3WYtIIJcY2S5ztM8j9vY80nC
         XE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521212; x=1772126012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scjH6AQBXgOEyOguxVYTHq5LOFFjJgFpmI1fsS6Z7tY=;
        b=pnLMjRbOTPtZydi187H585xSCLxOt5tN3jWUyxNSyUjUEqrYycTAWgFkksZsFbBL4j
         QivoHVVc1Vrg3sQw4zI+rUmYdQdrq+rGPowGEs+V6vy8ql8VENrvo5guCKT4VSgndW42
         1GrAmfz1eUi0hJXp2S0FfWbXrA8YswUJSBJQfoOsSlMx1dtsI2J5+FaxTP9LxuV4Dfmk
         rtPtN9STHLLCdlJGOA6vOZXj/KDgQURLPXqU0C/SEvkmL8BrT2Dt/+hae1vVz+ysqpUb
         w3vZVWgk+eC4XHRc8lYLBv6CaeWYQNtlbKKFbToIBgkm8nCunY1QsW+W6ou15sXxBa6/
         G88g==
X-Forwarded-Encrypted: i=1; AJvYcCXwF543D14bs1FWi6zgSC9YWX5ZhKV5KPiO6Hy+u1z04KH1FiYoH/lbRZxQ9yGX2IMSiB0I82cvazWYmTQv@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn5lE944qCIpy7qJa2asmDjP+zCQDERG9iH+TxugQCmP8lREV4
	GlFk6At4nu5uTiXDxXw4WUzUbFsyPeGhZM/iQOmfeatcIUy+D1jvU7hu
X-Gm-Gg: AZuq6aJZlIyL1As+55vYNX8gkj050NiIS6GzvdhfC8Ac1NE+XvnDf/Zym+M9yakZRlW
	3+o5ELNeylBHq3b96X3400Dw3c4uGgj09FSmHDu8okebFzD2rUKaUhXY0OvJjleyNlBAP4lXOpm
	gRKfrhiGAVZGRal9VuYTpWw78XFHh/DXyGf8B5Do84njiMVTFVjVQbKVoVykDQo8U4OMJixUwLs
	k+/rlzzfLKpiViwFD80o0gQfbxH1dkFtaI6Fv+iCO0LXp4rOUtod0Wn1jQwETJUbVG3gPfUU7IE
	r8W2sYzh0xWLagoIydi0trNpuu0RZJhQQZNoDp3WYXiDHIjZespwzp9NQVIGrOAtvsTvnKNjK4C
	HYkySkNUFGTEF4kemQDe0SdSB7y97yvNIaN9uFL1D1oaoYw2r9V68DZP6WOsjv1p8qyO/WSXi3h
	Xlobec32rAiNaYa8YBGw1IR8AdjiRkUiPRXtPqUfxP7hW/60ZWs6lutx8zd3tA
X-Received: by 2002:a05:6a21:1645:b0:38d:f08d:b349 with SMTP id adf61e73a8af0-394839d554cmr16555786637.43.1771521212312;
        Thu, 19 Feb 2026 09:13:32 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:31 -0800 (PST)
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
Subject: [PATCH 5.10.y 04/15] clocksource/drivers/sp804: Do not use timer namespace for timer_shutdown() function
Date: Fri, 20 Feb 2026 02:12:59 +0900
Message-Id: <20260219171310.118170-5-aha310510@gmail.com>
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

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

[ Upstream commit 6e1fc2591f116dfb20b65cf27356475461d61bd8 ]

A new "shutdown" timer state is being added to the generic timer code. One
of the functions to change the timer into the state is called
"timer_shutdown()". This means that there can not be other functions
called "timer_shutdown()" as the timer code owns the "timer_*" name space.

Rename timer_shutdown() to evt_timer_shutdown() to avoid this conflict.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lkml.kernel.org/r/20221106212702.182883323@goodmis.org
Link: https://lore.kernel.org/all/20221105060155.592778858@goodmis.org/
Link: https://lore.kernel.org/r/20221110064147.158230501@goodmis.org
Link: https://lore.kernel.org/r/20221123201624.634354813@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/clocksource/timer-sp804.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-sp804.c b/drivers/clocksource/timer-sp804.c
index e6a87f4af2b5..cd1916c05325 100644
--- a/drivers/clocksource/timer-sp804.c
+++ b/drivers/clocksource/timer-sp804.c
@@ -155,14 +155,14 @@ static irqreturn_t sp804_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static inline void timer_shutdown(struct clock_event_device *evt)
+static inline void evt_timer_shutdown(struct clock_event_device *evt)
 {
 	writel(0, common_clkevt->ctrl);
 }
 
 static int sp804_shutdown(struct clock_event_device *evt)
 {
-	timer_shutdown(evt);
+	evt_timer_shutdown(evt);
 	return 0;
 }
 
@@ -171,7 +171,7 @@ static int sp804_set_periodic(struct clock_event_device *evt)
 	unsigned long ctrl = TIMER_CTRL_32BIT | TIMER_CTRL_IE |
 			     TIMER_CTRL_PERIODIC | TIMER_CTRL_ENABLE;
 
-	timer_shutdown(evt);
+	evt_timer_shutdown(evt);
 	writel(common_clkevt->reload, common_clkevt->load);
 	writel(ctrl, common_clkevt->ctrl);
 	return 0;
--
