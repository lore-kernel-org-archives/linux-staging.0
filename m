Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED529283FCF
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345960; cv=none; b=CN+ylrZVC+fEeaTpUnu3pUCsmhqrZ1GLmfcxOlQVOyv9m0v40huUVz5zr/5xnwwPkqShrpSxHHl1odXT6nsuGsCNGSi/j4lYlVX8/apGNKj7gSDN9LIxIOOcO/NHMDlccz9vE8fb+YTPKcFrN6IN16vnVS+4M4/NCzk8QZpOx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345960; c=relaxed/simple;
	bh=FgQfbLiyDT66S+sNI1wE/oslfO+pvzybNJFnYppNieM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a5ZZwedyewPzLagfKtt24dTA7f78ok/drgLaJQU1hHaAH5AKqpm0yc6M8pGgabNIeE11Vy4gEtdFpYqCJCfgZDURZ77Mhzpf3d/dP3JAwrSxHz/P3jzKUPycQwqi4FkuxMCgJaGCboovkIvX6Ja59Xw4tsByQNXk3/BUIvOEi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFWcyc5a; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFWcyc5a"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so2529238b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345958; x=1764950758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89KuTptWUmkm9h+FhspeGpsBdyDf36NNXIP8b7hhqek=;
        b=eFWcyc5aycCr/sfaqZxfba8x4E06WZ12cpBzOSdd/OQNU2/ZWGgS5sldmbwVJeX8P1
         tL/4wdeY8SXV9A+axXZ+neoeBwaQ1Ojno0TaawrEiCoiFlCwlAYyGnpLA6R/TzQI2RXr
         4zJ8kg32oz+zFegmSgpERx3WSNeGyCvEBxzNZaMN7+eBG+jGY0jrUYyDiLGDnxVb+FDe
         b+0+mEcj4Ts1JNqZspbKNXA8zJ9vW6HPqhV4h4F3iLT38tGDr4CmpUakEiTFIXvJZAZt
         2e6m2zxb+rm0Lqrxpjo3Wwd0xXZMzQRyLOX4k2YUVydb3Y89ouME3DaqYLM518VMuZys
         p4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345958; x=1764950758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=89KuTptWUmkm9h+FhspeGpsBdyDf36NNXIP8b7hhqek=;
        b=Ao1aZpO8I1Pqjq50uKZnLB1L8PY1Aa9rEH4uF0mrrKV2TB+4VGXUtJX87c51OAqBnU
         4i06fppl+5yPFOtXCgAlHR7UrL7np0+XCqeVOtd1zAKpOlKuef+4XOSiOVkwQlcnC4au
         E5cKdOP4KvtR4cHGPofW8K3RwMSmpeVQGfhs1me32oHKGBtVM0wIh+urUTWbYl4jnWSe
         +6Ndr4tcqnO62x5OEFd8n32RMUtZL/yfSNS0cpexlIZHOzMB9QeS3ke28uCiLcp7pg5y
         BoU/FFWEY8E3db6g50T4UAESqFhxafDRpE6/x0iSMDXK1uLi+3dmZWWhnSNSwggSamdd
         Uyhg==
X-Forwarded-Encrypted: i=1; AJvYcCXuB/vZCzxDTHuO/oK426gbCWctIWivPalXjR/ibR9Rsnzyw0PU0YHWx4jwBWwogQbHdj+/AognKf9yjdPB@lists.linux.dev
X-Gm-Message-State: AOJu0YyF6NJH3SyAzU+/c6fsTF/f5uUWhypPZWn9M78DVWHVIiRQwD2f
	XVTPAnRrGa3Ceqcq02ofHL3oIN1PAuzi5XFdatT5sp1jTTJuewHClIOC
X-Gm-Gg: ASbGncsZmDwxliMkDmjXdShcvHMrfeTlVy/Jw4XcL0WJot4rq3o3yEkU9trx3sQnQec
	n9TW5LmuI4LtPG22gkjowWrZLR89LpqUAXXp6x5jocUjzpx4JCtlkqtKsUcegywm3Yk96rINGEC
	HjvTokqqQpwgd9VpSwDtZY8CZGABdo7sk52vSOQlQDV57STahT6mnZeLXF1s27xNoBF4FUM+rpY
	OuDWnEQVBzQH0zNZopzNWIyctzNkeQrzmGH3OWlyW/jNrqc/Sv9xZy1a30z1zicZ3v+sz7h1Gth
	/lHOyALIPxUmDq9ix1Hj5eimo4ZcfGj+KclkWA2YpkN1ydk0iLKO8bsnT6sbMNb2U87WkEwXPaB
	+bF2r4gMs2cuS8JzyhVDu9OtX1FNbbbHmmSr2+6FmRCD7o1FQM/6ANL78BnpBDj9jhVmWXjbBGE
	myBM8x7T+M6pn89o9CvCmwtn/oHlyZJe3ddMJ9bg==
X-Google-Smtp-Source: AGHT+IF0Q8QvQVgk/GlOhROATsy4H0jZvj77M4n2inngSNShmeeB6QTjv1ds/QlTk5r7jRniqk/a7w==
X-Received: by 2002:a05:6a21:99a5:b0:35d:53dc:cb64 with SMTP id adf61e73a8af0-3614ee0a109mr30924321637.54.1764345957992;
        Fri, 28 Nov 2025 08:05:57 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:05:57 -0800 (PST)
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
Subject: [PATCH 5.15.y 02/14] ARM: spear: Do not use timer namespace for timer_shutdown() function
Date: Sat, 29 Nov 2025 01:05:27 +0900
Message-Id: <20251128160539.358938-3-aha310510@gmail.com>
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
---
 arch/arm/mach-spear/time.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
index e979e2197f8e..5371c824786d 100644
--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -90,7 +90,7 @@ static void __init spear_clocksource_init(void)
 		200, 16, clocksource_mmio_readw_up);
 }
 
-static inline void timer_shutdown(struct clock_event_device *evt)
+static inline void spear_timer_shutdown(struct clock_event_device *evt)
 {
 	u16 val = readw(gpt_base + CR(CLKEVT));
 
@@ -101,7 +101,7 @@ static inline void timer_shutdown(struct clock_event_device *evt)
 
 static int spear_shutdown(struct clock_event_device *evt)
 {
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	return 0;
 }
@@ -111,7 +111,7 @@ static int spear_set_oneshot(struct clock_event_device *evt)
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	val = readw(gpt_base + CR(CLKEVT));
 	val |= CTRL_ONE_SHOT;
@@ -126,7 +126,7 @@ static int spear_set_periodic(struct clock_event_device *evt)
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	period = clk_get_rate(gpt_clk) / HZ;
 	period >>= CTRL_PRESCALER16;
--
