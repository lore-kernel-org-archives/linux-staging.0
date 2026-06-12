Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBC3A8753
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260129; cv=none; b=eXnQQa2jkxeq11forVgE4dzrCNM+YAm/4fbcZxqVaMO0oVG5G0/Klveid3hFnokcoVZOQ1+hZBchPvxBxeIHwBaJRZZC8jNCk+cv9SFlAstsa2WTPe1DKPwFBwjH995m5ZAaH2w+lUBudZ4nkcQ8IMkC/HgnORh+Em3HtcZU0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260129; c=relaxed/simple;
	bh=vCMLdI0ehSdYMeIcN6OyQWhcXhV88w1bLoI/KS9iLkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3yKEo4vFUcBn2fpaGikcJXfqexFQjtLbPwozIJ5QKJNgJuqctOq2FBIRro8QPf4AHQ7/5rh+ahU0a8DmHhQZb/QRtYHBAynMtlTxyFzUL3WxBy2VvX3vj1aXGI9BBpf22mYq7LKNlgT+zP3C1e45KXldEZe9rLH5UhiUG7DlNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djArK2T/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djArK2T/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-460166910e6so435149f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 03:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260127; x=1781864927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jszs6p4xhm8+RlBBsbMOdtoMaMuWej/9ogpxnSj40ZY=;
        b=djArK2T/hCr6i+sj+39q4K9gslBPZ9FKzp8Zv5U9sGmwcWffGWwvraWackfNHPC3TC
         8E7QcL+KL+LxaOOFYaKqhrzB8ul8QDE1FoTDPaJfO4UNUyLJ32GJW5VxR+0EhdIOVHEo
         hj7vFusX1pPSAnCY3xPFfEjOnTTnbGkvhqjv0r1m9AHxPUz1PwN6BCwSaTgxFnUrK4oB
         vaZQthAqt007ZlABqndaNUntDhS0Wn3SnudFdjmo9kC9PvlMYTOctLHS1Ekwl+jCtIMp
         1ZIjy0IKanpUaM3sSfuZvqa2j7Fk5aT2Bht0JCw0uEQzRj/C4Hklv4V/drnlySW8LYIZ
         Bqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260127; x=1781864927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jszs6p4xhm8+RlBBsbMOdtoMaMuWej/9ogpxnSj40ZY=;
        b=RLv49QdH8YoePlc27UWEr2OHU9c3lOBZDoqESVOLu0MamHb628k15tLZSE/d0d0CpW
         3BXmMoQYxBTfdXoVb1Q5CbhJFIbZHLpJxZ33dVzVGRhN+JAzhPQfSo5ZPHIPT2p3DQJu
         sGRkhtGFk+yo7pBR5e9btOsNWGk5FYSvsxzPr3tQU3eyEMFW2Cmhls6kM+pub3Pme4sJ
         DDvsjXbfiWFEnNd9LcqMrPY0NtB4014MeaN/TWl/sKbW5xN2mu6hnFjlbu/82rlyExbY
         /Iv7rOOfV88PQMlQrPP5dhhIf1CFau05P4DFpRZ6FhX93eiQVAFRTqA9wEMn8irnHpwG
         vu6A==
X-Gm-Message-State: AOJu0YwKagHBJHGruoh7HWKkhB7dQhQXpflu06uVrbDTq1Q5gh5r5Av7
	teG6lsZPd9Ya78+rT2TYhJhSIfBbH4HZpXCm57Z2oJ72CTqk8Wm8MMud6/SMGAio
X-Gm-Gg: Acq92OF/Jzi3BoqV3lHbywGb3hdV2F8WySM1Bgql9p0P/nwd7jm2CyZD4MLLf0a7I6w
	jYhwiauhsao2ZTLKhuf5uuRfU2ggji/F5FJMkGA8gb2NfNtYEGaGRRtVZHnOHIKt7k/V7GHA3mr
	XMHkhwZA01ZeNLvne/gvPj7Z9cqCdo38BfuEttTSsLuqSeG8YFxgNr9JfGprku4j8X841rTO9Wl
	iGhWSBUyF0zS9WmBKjhHsHObQlSU3vkaUilPfxrN45Tz/xJtAgzbY8EggV/C/a5S6v0u66lh7oZ
	GZoWM9snzBoECu+AjHHybtIk8RKyoCjHUnPlUMyGjVWTRgaGOTsRIYEmQHvWeQQ4rCDSrJjuv1X
	xXs07tUiWyUejCEEtvA0lqSCf1bTD6Muq3Ok8v9cHSqT1P8vaFbjx+/A1bRV/IHsLlAaencrSRH
	c9kJCywAq4G6YctIRf9XmDs1Oyiw==
X-Received: by 2002:a05:6000:2381:b0:45e:9420:ed16 with SMTP id ffacd0b85a97d-4606da69a8dmr3180667f8f.10.1781260126722;
        Fri, 12 Jun 2026 03:28:46 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:2655:7809:9974:b326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4358881f8f.6.2026.06.12.03.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:28:46 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH v2 3/7] staging: rtl8723bs: hal: fix space-before-tab warnings in hal_com.c
Date: Fri, 12 Jun 2026 11:28:30 +0100
Message-ID: <20260612102834.39935-3-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612102834.39935-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
 <20260612102834.39935-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
v2:
 - Rebased onto staging-next as requested

 drivers/staging/rtl8723bs/hal/hal_com.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 634af4657eee..65511a9d959f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -319,7 +319,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
@@ -359,7 +359,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* for WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -375,7 +375,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	} else { /* typical setting */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
-- 
2.43.0

