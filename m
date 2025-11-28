Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534D2295511
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345968; cv=none; b=W8Q/u6wBPPYsNE1/SiBcp93nBhzz7o/Zdcn0OJ2J/sV5hp/TQiYlC/zVsyQDpN1hAKLo2OYJQBWKX99xSfqYK40tfkpGt3tWInc22X0Qjk+ngSgvNHkJWz4Pd3leGx/TD3gxVFNsVPHd8WusvzZpKUii2D3t42F/EQH47dgpNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345968; c=relaxed/simple;
	bh=YY7i+ekw8WEClpFqVZfbZbIPcOFXG9mqoVtYSHhdgrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ULEOu6Bd+D9WAIU2X7Nn3pggsZL8bg4f+BQGjlZbYfZdG7NkHTHoP1OU6nJNgXg1K9AJxtmQWmBnR4qRg+CbX19Y++rW2zciOUn0ujQZ1nm8ePYSKho0vFKdJ/4eXjyOq/d6C80OnmjRVcQHri+vJ3vyR6bN69GZvgCpga4BFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+bHVtTj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+bHVtTj"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aad4823079so1794634b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345964; x=1764950764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lru4V+cwKFfxLK/nzfZUd/f7wkQ+5dEE9KWoaatQVPo=;
        b=J+bHVtTj77EnGiHgsYTcDT+n9YxgRSiNKFTefn0xX0hZNpFBVGHQoV2v+DFeCW30oe
         nRVqs3r23xjP7fvfM/1LE9jq4PuPBbjB2zLPV/1uSS8M0MqCXaoWsjnFyJpTWhFSgCnd
         oeMfkCmjNyzZ7diN4f9gnOqrk1/yPJ4mddI0UF5ysa31Dh5Ig1KdBnAGUG1GG4M2QDIC
         RCggLbRz5i4EctC9lIjxQA9jD+ckWfOSwyJ56B7SRdJtsjmCuuTbc1rLxz7TLcUnXaPH
         H+XNfiKEfKzydJV4FJg9zXqeCQRFGtzAwKBK67DvLwSTv58CGCdItAku1w1aUn1h8O7d
         2uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345964; x=1764950764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lru4V+cwKFfxLK/nzfZUd/f7wkQ+5dEE9KWoaatQVPo=;
        b=qAlXT9c6tzAUCyzAhj3wLKgV7Ch+dcNWF5E0gMuMJkEPthVsTLhkbkeC6Q8HO6qEZU
         ipkuY6kjlYWmpEVnPKkqKncVh4OPR2a/s80dUt2lB3OVh852vjOmZMKkboFXPfsdrfcF
         qqIjhTJ0tX/pxN3e7HtPk8VJPiHAU1/VfxIcDd8cN3a6EYUOwd9rpxQjaSukvr30t7T4
         LTeJ71cnqx64fUmOvPNNRPhDQHjEggTvE2WPI8HYQCrfGjjafQbZ//Cwgy3g8w+hbS+N
         /72u6UvijdoCXfoqSG4sBNfp0nwLFS1SETdsBlXKnQQkVLh8zT1x8io3C9dG1fhO6HUG
         bQHg==
X-Forwarded-Encrypted: i=1; AJvYcCW0c2TRHpULhNvNuJCieUO6kj7IIa/Qaqb427vUcBKmMUCyP2KNYEoul6GtPtRkuleJKmtpl+dgqTfUntkM@lists.linux.dev
X-Gm-Message-State: AOJu0YyCfuBbIzPmUkQsfjGCF5206O9Va/xGeC0SG/OvHTljlZH6gTHQ
	fNR9/zIvUSO56gRMiDQuUMzGoc+dNPxY+Dm01etC29zeGnwegyk2y4C9tLHam69eYfvqkDVT
X-Gm-Gg: ASbGncvb0t5hR51DgDly+JQDj86W8r07m7MgDbffA5BFGiy3G3ffkuAVKqktVU9hTZW
	RPmBQ0C4x1vPCAYaW+noxpbC0iNu57kD4C08puc9/Zu9Y61zHlM28Eysj+I9gaxcFXdRWCYc7Gs
	+ZKMb6JmkNeSIX8Q/e1jWhXhp5DLgs5Kt7X+p3/47y9gcFbRNBep94/yCt+F5iSENc5HCgyDm5j
	OQ0Mv/49PxDdwXJnu2aVDYfzE4fU8xYP6qr+1ZVIkHO7LeAq7uOXgA0HQ5pc8nablust21BN0Jr
	+Kj7xzfsSiLipiBKOkAJuCj9OSnt5vbpZngfONaizf8I0yfSYqObSLJUinIX19a2o9lsvA3EWNz
	DLk+IHF9wVRTfeI169RtMoBSxJcD7ZomBzfx67ETxAcc2SH6JoytCzgLCh0avxFpYT/jHaf8ivl
	kX3dFbCFkRzS1kMV6i16mYvSh3a+2NEcTyx10NZw==
X-Google-Smtp-Source: AGHT+IExmbTt0di4gnbgeXwjl0MdJHHrgB9GIijfMB5lD+egrT6JfkOALPfqqLh5IPKK0ig7n/DpYw==
X-Received: by 2002:a05:6a00:1383:b0:7b9:7349:4f0f with SMTP id d2e1a72fcca58-7c58988f7camr27966972b3a.0.1764345963342;
        Fri, 28 Nov 2025 08:06:03 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:02 -0800 (PST)
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
Subject: [PATCH 5.15.y 03/14] clocksource/drivers/arm_arch_timer: Do not use timer namespace for timer_shutdown() function
Date: Sat, 29 Nov 2025 01:05:28 +0900
Message-Id: <20251128160539.358938-4-aha310510@gmail.com>
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

[ Upstream commit 73737a5833ace25a8408b0d3b783637cb6bf29d1 ]

A new "shutdown" timer state is being added to the generic timer code. One
of the functions to change the timer into the state is called
"timer_shutdown()". This means that there can not be other functions
called "timer_shutdown()" as the timer code owns the "timer_*" name space.

Rename timer_shutdown() to arch_timer_shutdown() to avoid this conflict.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Link: https://lkml.kernel.org/r/20221106212702.002251651@goodmis.org
Link: https://lore.kernel.org/all/20221105060155.409832154@goodmis.org/
Link: https://lore.kernel.org/r/20221110064146.981725531@goodmis.org
Link: https://lore.kernel.org/r/20221123201624.574672568@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/clocksource/arm_arch_timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index fee1c4bf1021..ddcbf2b19651 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -687,8 +687,8 @@ static irqreturn_t arch_timer_handler_virt_mem(int irq, void *dev_id)
 	return timer_handler(ARCH_TIMER_MEM_VIRT_ACCESS, evt);
 }
 
-static __always_inline int timer_shutdown(const int access,
-					  struct clock_event_device *clk)
+static __always_inline int arch_timer_shutdown(const int access,
+					       struct clock_event_device *clk)
 {
 	unsigned long ctrl;
 
@@ -701,22 +701,22 @@ static __always_inline int timer_shutdown(const int access,
 
 static int arch_timer_shutdown_virt(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_VIRT_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_VIRT_ACCESS, clk);
 }
 
 static int arch_timer_shutdown_phys(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_PHYS_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_PHYS_ACCESS, clk);
 }
 
 static int arch_timer_shutdown_virt_mem(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_MEM_VIRT_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_MEM_VIRT_ACCESS, clk);
 }
 
 static int arch_timer_shutdown_phys_mem(struct clock_event_device *clk)
 {
-	return timer_shutdown(ARCH_TIMER_MEM_PHYS_ACCESS, clk);
+	return arch_timer_shutdown(ARCH_TIMER_MEM_PHYS_ACCESS, clk);
 }
 
 static __always_inline void set_next_event(const int access, unsigned long evt,
--
