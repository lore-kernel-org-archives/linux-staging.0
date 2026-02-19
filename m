Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590434D4C2
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521205; cv=none; b=FHyBZJk46lUkm4RZVlRYWfJTieO0gWlXd8w27P9Y9rBHElSCCVgp2Jbk6I4zVJ0ImnH9DngrCc6QDqyQ0Ie/TJerVeNUJDJ1DHwQp4X8ivxEpMxm6WWFBuKV0JGc5J4aoMTXGgSDrD23YF75nXmCEVFE9yY7klMvcblyVssKbMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521205; c=relaxed/simple;
	bh=FgQfbLiyDT66S+sNI1wE/oslfO+pvzybNJFnYppNieM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PSEJo/gbYG4xX2iZye8SA+wkmlGbql6o/PSl7AKLRNNZatGIuiDgdZFmXdm54Af460rUNuLsiYrgSJ9uWdrSz1R+Hg70ltmbgbDMP9sBNeUpgujm3zvPfysDproBQhE3IY8nEIstp3I9ry3QXo2oPStpyFuE4AQ73iu9uRMpgmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSgcJ7vr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSgcJ7vr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82418b0178cso700774b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521204; x=1772126004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89KuTptWUmkm9h+FhspeGpsBdyDf36NNXIP8b7hhqek=;
        b=QSgcJ7vrochETEY6gAZMRdIw5OflhRhK7CCvXLWtBKqBA7XopZ45xM/eWGmeLo3ihD
         m5nGMsqIneojz5jklx8501HYJdRPxCpiaZzdKIFxyINERZ/WQc4/FGLonTrwXDr8Ocku
         e8rSLop7BTZU6FK/OxHDy9tdMwyl7ThpwOsekMTyqbf/U8VTgCkQOPZRKUZP4YicNe0y
         EPAQMzkskw3oXoJbReWRk6D0NkVnsI1od49tT0w1rIYBPVdhkkR3PogLqW2YLs1BR1hu
         sLOhp3kGpxYBmLscuELSSZFTDvjjmjoReFSdbDe7v3i9IZ4wqjdHlNj6XGnCQ6zweLzI
         rCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521204; x=1772126004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=89KuTptWUmkm9h+FhspeGpsBdyDf36NNXIP8b7hhqek=;
        b=CRJP/w1OP5U7KWO+8mGTO8oJO3wg/vNQ6JhERQafUF/UkYK6X0JwqgsS2PepS85KQI
         oNOsBONOr1jwnIP3JkyB6euJ2E5vA45Tp4vrGd0ICyzXhBrTnUHVMYhzZOSkep0jK7bc
         QUYiwdnqfgXA6sdNPfqU7ugGZnm37yxzfjdqVWvVVma8YH35DmiGAlBdD38/csklLCbe
         ojprFGfuBhPxYJSsAzqCUB9kwPWK5Hr4ZE/17kwiDjyPvw1GcgXwsmKVvXR1nf46dFfX
         nGruucbmchdkBXUWcKUspUE/KZxtYFH6PoUOWLOFCn3OmQZoTE1XLDbVll9vhsxYVEW4
         Byfg==
X-Forwarded-Encrypted: i=1; AJvYcCUxM0VDfbijufGabpWxON09+r+mKxH6PzCiYaNTtuLj1Ph4JikB6Rm3Je951oK3g32hBDxL2cmuuW3/9ZaN@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlzy6ckRnBrRLdO/CDFohCQ+Z00LvBUyiQLjWQav+Qa/6aSYOK
	I3V36urh3wk8HOR9bHxNRHwhTntlzok/fb4Cnn0Uz3bdHIbZqXWkDyxl
X-Gm-Gg: AZuq6aJRyXi51RHSDVisvhO/vSBPLaxtkwcu20byEQT/xqCDRYmEQaSp4r2nr2cdo3N
	ahbmmYRB+bRpfQp+hMOM8W1Dng6KvnBSTMhIEw0RHEuJoaCZEwPlrhNGpTzmHMaQk1mnAfLq7OT
	UfDKuXd66XQqQ+ZHHEraMDFpuT2NSb/GWUX0tqZNE9aP8PkSf1eXVLIuI7J4/CLM9iSWpSPAzt3
	7WFlnhBqyigY0tHORoekjDPTLZKZpjdzLSI+yZNMlE/+Hewc2cmEd9Gc1cldU5p0EVhJNX3Szev
	/PhDOOyI1KoUSFd6U6dz7lFVx26phMa+bK3OaSZcHImihr+cdNh/6P1Tkst1PeMPqwiJSRd+r50
	NeCRs4+TVJNsOLpWSGeVzvXGZlHuncNLyyStOu+lX6ekV/YQO8vozxczyIFpsd99f0PcDbijI9x
	RZkSm9h9UHHOhJBoACU1aGRvf56d6Lr7zeOnoy4ds5vPX7xUbnkQ==
X-Received: by 2002:a05:6a21:62c8:b0:366:5332:466 with SMTP id adf61e73a8af0-394fc2fd726mr5605743637.53.1771521203784;
        Thu, 19 Feb 2026 09:13:23 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:23 -0800 (PST)
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
Subject: [PATCH 5.10.y 02/15] ARM: spear: Do not use timer namespace for timer_shutdown() function
Date: Fri, 20 Feb 2026 02:12:57 +0900
Message-Id: <20260219171310.118170-3-aha310510@gmail.com>
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
