Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1CB3093C1
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345972; cv=none; b=Radm4RiVvuBAfc3CSIoriBdnTyv3ZvxJNrtnAul2/7pyXuqVhh2/EmSzvNOgoXxY9PCUsdu5fRz+7lDa9rO6GU3O/BZTJFuSLPGsLYUEmF930DkWpFkESHpgUsVpOzYQV0dq/vb6cqOosc7OcPcSiE7Mnvbzm2es5diwtkZMSIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345972; c=relaxed/simple;
	bh=kyxULOv2H236l1ucHIwcTRr5nnWT32c4Zye+wWGrJ6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OOLVjC5jvlyXezwPjfvORGDwTziUFhb+SrM/NFSue8/eFG8vbVULm+x1Yu2OZa2wdZXN7GEF850d1VpdyjAUWk370g0t9vidS+qqwzw+sbrpfz3xZdyhGAgvRu/7xkmh63DxWZ3yAEeS0b/LONBMxPbYirjOWObxqmxD4w6r26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArJ4n1E7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArJ4n1E7"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aab7623f42so2211985b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345969; x=1764950769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scjH6AQBXgOEyOguxVYTHq5LOFFjJgFpmI1fsS6Z7tY=;
        b=ArJ4n1E7oUpjK6qAYwOBE1+LekJgI024bEMSa4xVF9s5QSg6t0Ced+pYR/daMsGT/I
         NsqV76EX6SpphR+GRYSRya+aHoWrJETlxBG21SRQogW2gJqec4E2ET73l65St4zsaoF3
         HO5B7RJjHirQI4myHotZYqp9ozFLXXmwPA7/ko1pNCafbQplnBR9b7trtbUCjwhKIl+t
         k00qRLFV9OZK2JKYXyUol1WVxFxGAr6qBKpL7Rd5dARdWTdP4Qz8zsHWr4Re/RDnieDv
         bZaWxN+LwapI2X/7q+wBOB8tBqoQ/fAwOlUpkTtLFJIDo95qnUDgOCfaC2nKVyybUsjQ
         htcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345969; x=1764950769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scjH6AQBXgOEyOguxVYTHq5LOFFjJgFpmI1fsS6Z7tY=;
        b=JkxdW0wvRq4KsIeRVwMAP4wlEnKy+i+vb5Aw90yUcCUtOJnPRQTSKkbcDuIGPUejPX
         ag5RexlB3cZsHHY2TnbWXLBesGN7SLG1asA1oRz0Qy9wrW31RP3FCDk50Fdf2rZlccnL
         4/E4H2/VEJ3Zy5ILe8LVcvi8a3Yhvgi7aCxr2iAcMolJpQZ+Wis5wqzrVHZuPwUz/rWT
         Atk81seDL4vSz00axJBXaeg6TPc7KO3cxcmB9scqI3d0V8XB5LOVsWecbfDn8URy46WH
         6INVUh6Cwki3zcUikRageKE/kj9d1gndFx0pT960MgPSJd7r4e2FTownxub5Vnjlz6+t
         SPvg==
X-Forwarded-Encrypted: i=1; AJvYcCUX6c1jBfK4/+2KyWbL71y4fA7GtV49xarUHMAEWnzfcEfx0j7yKk1+s12EMp7ADHfeRrRq2k0fC5ree9Iz@lists.linux.dev
X-Gm-Message-State: AOJu0YyWq0VwSQAWvClQhqDBr0J+AgPDG97wQh47papmsoPUMyrldWl5
	RIPfEXK6/IIGyGJRAfU7gMqW/LOrFbUxh45pSCkV56NRK1xMdR1M+7/h
X-Gm-Gg: ASbGncua02jqyPpA864i/K5GkQLR2B+1Qq1mnqQkJoy3vPPABmrNyIK5I4MBW94NjV6
	536vSpQQ/nsA065b0mP+aGsJaoWi2HhR1hQZHoMHzZRt4PYw6o/64PFO4PSbJK0IY0Vw4HufxQd
	Qkan2ko3GmJhjo9rjRnQLaqE5MdGiwFaU47xpz5lI/uKA9SAZT2Nl3ZHCx+LsNu17BBiJuK2tNh
	iItWaIOt/Rsh2Jz0SVAApt0CmSYnDPF/njcH2qr4pTOwoDdSQmBfSGQtzyhiqCEyTIhc6WBCcKk
	HGdwzDAd0axPaAcuNBOfMYICbOPetEXg3dfdoV/UtgFZApu8rm/+knOuowBZ7qKj4aIfJ+58nvi
	5/P7Blt/T4XpQ0UPCPvqaNCBJ+Iwc5ATly2dxOYmbz6Fr1SExh+z2akkz8EuY/GgRuXRis7wP5x
	lf8u12c0DoBzXRrnx/v8qrEyu/Hb4zsD6ndeJX5w==
X-Google-Smtp-Source: AGHT+IHAtGLDzEpjYjWhaB+rR7Dys+EF0UdlOe5GiYObNTvZAonn+cDCVIEt6kBF0Ch2hk5wj+FaCw==
X-Received: by 2002:a05:6a00:b91:b0:7ab:5d1b:2d18 with SMTP id d2e1a72fcca58-7c58e6047eamr29577558b3a.26.1764345968898;
        Fri, 28 Nov 2025 08:06:08 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:08 -0800 (PST)
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
Subject: [PATCH 5.15.y 04/14] clocksource/drivers/sp804: Do not use timer namespace for timer_shutdown() function
Date: Sat, 29 Nov 2025 01:05:29 +0900
Message-Id: <20251128160539.358938-5-aha310510@gmail.com>
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
