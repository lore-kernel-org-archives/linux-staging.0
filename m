Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5539332ED4E
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345981; cv=none; b=YiVYyCWszYMHHYAIj7AnNgINMs9/icamj4rouUyce5lStGiAZIoRZjXozJ3FAYSt3+IktYsPDpsehf9SzdiVK+LIuQmuu3JGLbeaOg+jFSZfARN9+aWczdIr+CVmSrlh1Xs9ZihpKFRyqYlBLoTGp8PblRFBmtQ+qU94AWJqPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345981; c=relaxed/simple;
	bh=p4TRIPhh7eCXg4oL8eEB5Ly0L/lmhP7XDzG06yVs7As=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ot1XWpArZt/WVUPYYS3An6M1lCRLfyxSJiWqyriGcLJSpwMCwmzOqs0/g5hTbSpogWzEXQc+GPDCa4KiT389tc8pQ6mGGaA3tj2uVdjBe07MQu8NcGeONVPju3ORwA2w7Ff1gCtRHQTp2UVbB4X/FIOK84nCZ/IAjrLESw9flEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoCx2ekM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoCx2ekM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aad4823079so1794870b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345980; x=1764950780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjvp+vOFGL8T/NXTev+NZf62jPu9HyIJqL4GkC+d9Y=;
        b=QoCx2ekMQU02a1SEw4XigiA7oSe+/qSWbCK0IuM/rSlntPKzbPBodSyenTtlFf9s2c
         hid35o7QENBDh7Zkc/WOZUCRRmTqFMb6hf8cGc8KxnlfkhX/pTVlKERoI1iPB9rjCH0i
         wIQCrbyO44zTySKQXCZSUYZSF/GIvLkqVqrLsxyfjko94f3k5mV1O0XXTFvmLMquyl46
         5cvlQ3caIqlQ/7GnQCEoCUFLbpUqG442O5yRT1Wlmhk0CmawdIFW+VpKLxK/9Zaxjbp/
         wmruNzg4impMCFJmCWTWt04Vl/PTZH4PIgnUDF3Znp+mFuamjqE4D+pz1j3FHGqt0qik
         Twlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345980; x=1764950780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pWjvp+vOFGL8T/NXTev+NZf62jPu9HyIJqL4GkC+d9Y=;
        b=gyxItnR/ChsZqQVWkItR+nKR6St/6bCxxSDVQcdXsRpgYVQe+bUpSCH8MT06c7939t
         n4/uGMyalAzanOHMIrCW8zVl7E5fmIELaCynSwqIhXWIByTHXCSH9/j4nG1vabeTx4lF
         RQjllYuGwjjJ2B//O960ws41PMvaufP+8atCQzjKbFFigbFP1TNDe/ZJ9DFEbwfec8pM
         TI1NZLJazvXV+cGne1f1rH7munLTmENOxtsrNfbCyShkbSOD93fuuk6qmOVl09zKMMnI
         gkqASpgNC1KyV5dgssNQWrpyPgZvoGUHjFVCTbQHJiPSc8VGDps+rn02SzZk1TobAaFO
         YJwA==
X-Forwarded-Encrypted: i=1; AJvYcCVrfeT7s1fu37zAs/5MARg+JWMugpTfitE3Y/KNi6E3dUNLYdWA0JBtclHoxs/JQkF3ql03SzF6n/jMjwSe@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9MZByoZyysS2UVeL87+s+kyc8z6Jw1Nh6uF9i7rOeGXjGySPu
	j7L3/4s5+Ql22WctsEukn5tv43k+2TgF44+LkUUg9qYcREHU5L4huDB3
X-Gm-Gg: ASbGncvPs2cqkLCCb/FqIjtIFPNGllnkGUsDof5P0HXiyHdbeHpUSgU28YV9vY1yTgO
	lRbv0lrV9uLNqwk3y7Q/1jb7H01lgC1Bl6mkI/71uDiNkXIhYtYIxyYn5dFTWIqB7JFAB9dQOQP
	DUgI+Xt3NEsh9CDKcMz+z8J7u92lDlU+XlizE4flDyAyIm5Fj6H1tY88n1g+4UeQHLCGAK6Zgpv
	e5mdZby/KXtTGqnjZ3urusf7L+mSaJj9s8i4y4qyEag/Co72vgRq/JfWNfXEQGUeVKsOhFAlAzk
	giIvULcotUn7EmoJ8liITAvKpoW0hZCMLCiUet7HL3WqNwnqVG259rB5+x2sugI6UPb7iXfjWXC
	edEUB1oZF3ooHK9VCcgLXoq14ZNwb4HkZePR1jMpmb000HDIJ9HKC8Z7TjiO9MRqY7bnIDleO01
	diV6RV+BIJKI9sIlJd3jmQQQPfg7VM/UBc0nTCHw==
X-Google-Smtp-Source: AGHT+IFapLhQU9fdniLElMhOTBueBGSZ5wz5zku4Mw2lynCB6SmbEsu5fwwc8sIpEraRjt+Qk/oxxw==
X-Received: by 2002:a05:6a00:181d:b0:7a2:8111:780a with SMTP id d2e1a72fcca58-7c58c2b1851mr32051480b3a.2.1764345979249;
        Fri, 28 Nov 2025 08:06:19 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:18 -0800 (PST)
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
Subject: [PATCH 5.15.y 06/14] timers: Replace BUG_ON()s
Date: Sat, 29 Nov 2025 01:05:31 +0900
Message-Id: <20251128160539.358938-7-aha310510@gmail.com>
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
