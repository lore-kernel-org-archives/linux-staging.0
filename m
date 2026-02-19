Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695F34D4C2
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521223; cv=none; b=WIzvVLwMtU95MjF6Q1skc1pi0E1llm/rcgPXwMEURpjch5ndNZFPN75LZZ+R6D/wz2YVhhGqqkW7W5914g+fK0HaaDUYA2kC1mc30BnX7xLAkmyj2kouD+rZXX7lf+qD4lBlIbakEOt2+u5LZjDfP+7YVY+8qP9C3vzSNwpqYPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521223; c=relaxed/simple;
	bh=p4TRIPhh7eCXg4oL8eEB5Ly0L/lmhP7XDzG06yVs7As=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e38tPazKo6bK4bkwHAMgo3QrTWRNncousEypW383vjybWnoTuMTROr2efxXxASs3rLf5ttdtLr4yZmIlxnLsjeTJRzmWEGCt+FnITDDqr2QY37BHnf5n8+NBlgsLQLhPL9Ud1Qp84IGmKupHZGo+MiOc8g+sEMmooR7KUHQNO/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8KAoFHx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8KAoFHx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824b32875e7so673864b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521220; x=1772126020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjvp+vOFGL8T/NXTev+NZf62jPu9HyIJqL4GkC+d9Y=;
        b=D8KAoFHxXAxcEbXOfbsKs8+9lqqM2WXtKGwpAXWb8CHuSVmzgarT8XDMzVdQeObOPs
         dFUklE8wEz5juxYlQarDuWfWKbx5uDJ0FZ9aWxZDKLpEsn6xelAhtfFxcliJhdpwRFQm
         e3X+frfmwdo3uAbRXyluhLJNhqO4NuMy+k0Q79uWm/At8cywjph9sNg06Z4D0jmvx/Dn
         0Lk79JLDLaAYWlHcEOriZvGeG2vRCu7/iQ137AyPmXP8ey/i9zkYlPIZUFsdrjXL3r2x
         t5FDKD86v6eiioU4I2N7XDC0XFvZyr+D8ZbozKrU3V/UfRmkuIFV8fq/RwtAVENY2Y9Y
         vnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521220; x=1772126020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pWjvp+vOFGL8T/NXTev+NZf62jPu9HyIJqL4GkC+d9Y=;
        b=IP4k1JVbIYrKp61RbveemIhGZYtFdXgxtfJskj7GcM5YMvMMisE7T6HgxSulHK+oiM
         BG2rREvkrWU2aHm+TqiM3Et/cR39nG2yFdoZN0Bd30C3LgMI/AZ/CCI0S88bcEQR1Ez2
         APy1kds8DCEaR3wP8AxzBsZpEaUi7GLKO5BIz3dzLBSkLFVzaKvcZObULjim42ZXjtIK
         5La6qGlAqwxwiS1vPTJcBl5N8dlt6v0FEC3PrDVAsC33g8697eDncITcKfAD3bBIPRk6
         Eb8JMUJPiy28LUUYoYs/0rtbk+vh1wauNYgCrLIPh+bnoUCISHSMQMLJv2hdd70E2p8l
         OqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSGNW12TJBn3D5m6DT24uEIDafEGxioyRFemV3XSUDY06fb+2IuW2uYXILIvgAU0R3xNr2HjHgQUhOzayL@lists.linux.dev
X-Gm-Message-State: AOJu0YzuiWpQY5o1BH2RhndrlDFLp+s9L5uvrvEn/ezGBj8qvdm+JBNV
	2LfOAY+sVUOUWwceXR9dvKAPgzeOBTpBDAa0sTBvwZSFT4+AnEj4b0Rw
X-Gm-Gg: AZuq6aKzr6Uxynhtp4lMh8l31eaMReGwX8MQ1uKROTgJT212n4tyAaCiddlBLR1x9/n
	OCQ2Azkxz2JvRAV7/dr+aXYtvSceM4tXNHAzgIc7iX1fb1Lvpno0XFaf66nkRil5kJbE11LhreI
	6MPxmmeA0/IkUTo3XDQPIq6gWhM/PSfJHOfBC9AOhkqdncvdgBi8uMJJjYRwvmITYwprS3utiFB
	OeiiKev/QVnFC/jNGs7T0XgghCAC8RvACjBd4h8w54Uy6emw+PoB8YGyTIZ02VKDN2THXPvxiBI
	7bndhYOOcTO+mcJPo3fMV2Y8MEx6eM2lYEhBXILLGGpwKV1GAfhJudmy8/HPreDZRbUZuwR+Nbl
	4B7DPglfcbO4PblRu9pEtjiMkkCEsv2i8F53PQka7UN54xUnO4JlDrXuvAlAequ0ohGfSkuEwUX
	oIdV+I+c/sAEStH3/Jr+2woyItSnju1prWYfcSR9PuR2ZVDD9JTA==
X-Received: by 2002:a05:6a21:330b:b0:394:6023:a0f2 with SMTP id adf61e73a8af0-394fc21a2d7mr5528099637.21.1771521220510;
        Thu, 19 Feb 2026 09:13:40 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:39 -0800 (PST)
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
Subject: [PATCH 5.10.y 06/15] timers: Replace BUG_ON()s
Date: Fri, 20 Feb 2026 02:13:01 +0900
Message-Id: <20260219171310.118170-7-aha310510@gmail.com>
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

[ Upstream commit 82ed6f7ef58f9634fe4462dd721902c580f01569 ]

The timer code still has a few BUG_ON()s left which are crashing the kernel
in situations where it still can recover or simply refuse to take an
action.

Remove the one in the hotplug callback which checks for the CPU being
offline. If that happens then the whole hotplug machinery will explode in
colourful ways.

Replace the rest with WARN_ON_ONCE() and conditional returns where
appropriate.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201624.769128888@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 kernel/time/timer.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index e09852be4e63..7094b916c854 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1208,7 +1208,8 @@ EXPORT_SYMBOL(timer_reduce);
  */
 void add_timer(struct timer_list *timer)
 {
-	BUG_ON(timer_pending(timer));
+	if (WARN_ON_ONCE(timer_pending(timer)))
+		return;
 	__mod_timer(timer, timer->expires, MOD_TIMER_NOTPENDING);
 }
 EXPORT_SYMBOL(add_timer);
@@ -1227,7 +1228,8 @@ void add_timer_on(struct timer_list *timer, int cpu)
 	struct timer_base *new_base, *base;
 	unsigned long flags;
 
-	BUG_ON(timer_pending(timer) || !timer->function);
+	if (WARN_ON_ONCE(timer_pending(timer) || !timer->function))
+		return;
 
 	new_base = get_timer_cpu_base(timer->flags, cpu);
 
@@ -2047,8 +2049,6 @@ int timers_dead_cpu(unsigned int cpu)
 	struct timer_base *new_base;
 	int b, i;
 
-	BUG_ON(cpu_online(cpu));
-
 	for (b = 0; b < NR_BASES; b++) {
 		old_base = per_cpu_ptr(&timer_bases[b], cpu);
 		new_base = get_cpu_ptr(&timer_bases[b]);
@@ -2065,7 +2065,8 @@ int timers_dead_cpu(unsigned int cpu)
 		 */
 		forward_timer_base(new_base);
 
-		BUG_ON(old_base->running_timer);
+		WARN_ON_ONCE(old_base->running_timer);
+		old_base->running_timer = NULL;
 
 		for (i = 0; i < WHEEL_SIZE; i++)
 			migrate_timer_list(new_base, old_base->vectors + i);
--
