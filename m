Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20D45039
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785003529; cv=none; b=WamIGq7mibQ1cgwhIk2wBs4pLF6tebdZjH7wB9EOt1llK1rEbdXrgHE0UYZI2OtVyIrSnkAjLN4RW05PQYeqNv0Bca14fBUM2acvQe0an3Yq3LU+6JVvqKNGM1AY30CoDDSbrEIVHrHvZuFQDgN4OM2T3kwgTdSvHdtpuw0rvDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785003529; c=relaxed/simple;
	bh=jGYlBYG46ZbULQZNbmbortL/wdkFWeDZi0Yl6wzj1Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P+7qRbLYf41Sf5g9U0hU7FarISyav4BMS0tgOAEU2BeMr8BvUBPNwLHIsPUhd5c0v1W8zHz4QJxu9SsMRoyrkwYMilU+cDTr8PVb+ZtADf7Ww2GCxpsLA4GLHBsuDtvC43BiDuqKmhbx5ifUensw9dhBWa3LRy3GdaNMHRCxgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXDBB8aN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXDBB8aN"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1543115e87.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 11:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785003526; x=1785608326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EcnmFMYASQgb7uEJtLGRNmi55NqIWkVVzyig/XXgCk4=;
        b=IXDBB8aNmS03QmS4Mesa4antbUvSrp3yZaHCwlLgeR3hDC+bd2uUOLZKzbBT/nC6Fi
         6KVhcp2NXtg37IYq51NF/WoiTFSmqYKIgKMdAsaW/v61vF0YqLBUSZs3Q3XYCDjiHap/
         Nx+lRgoV5yZIJwh1198M94syKZqAwdxD1GJs2O0+5Mj4XTVtZNMywJsISdvi5uAhY3xQ
         g7OnJtaNbdNb7vJeLOpTTLkGmMXfgT0Tt2Su6HwBnSh0Thpdie7rjAJ11zfygOqvUShN
         c2bZIhZ6Tb3UaNBICsMYNpOGZSEFPf+C5VMLGxszYXmRcMASrBejPgk2q/If+VSBi8Ib
         +Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785003526; x=1785608326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcnmFMYASQgb7uEJtLGRNmi55NqIWkVVzyig/XXgCk4=;
        b=baI4Ig6iJ1HzJm8Zh7wzR4j+24usPSEbXYNH/mZ6ixBl3ZwKf8RovtnDlW5fuJLc3A
         rHhMb9742BbbjUSrs0Jl07Fy47xzuSZnJ0nTZsrFBC+ucVHKHHBU4EzzNcEZLKKferCB
         B5TLlIDkN3RyI6saYg1O3txVemYoU+3dGSwmgvdBG40d859DHa9F9Df4Mz+4/q+PCBJ/
         eAioyAS7e1/EpO5F7B4v/RRD5/J/d3VbGeeKPmddCsAZZ0xTB02TJE+ICVPY7SaKp6yh
         pVB/akSFw5BTWi2nLAUgEgfkH/En5I1LvEmqUwb4lLiPGfH62+mahX91vBsLOiDNE+xT
         67Kw==
X-Gm-Message-State: AOJu0YxvwAP/sYef3jB0KxJjKGKh/RdXSVc9vKTWthZQ5kUKttZ75W+e
	+0IWxBCUj8Tk8IBt0dZXJ41CKoyKdfjMLjFyQ1QYTh1vGY+S+fhPiwme
X-Gm-Gg: AR+sD12yADD1n7ofamo2VxDOSgi/B3MVF0Pd3K9PiYUtqei1M5TCSTP1V11ILOYJATJ
	avTFLYtbDqfpGazOJqd9wAOVGokrhfGnJIYv3UpKAhDwcwbbLTF2sRZRM2TjUNg43M7lU6XEkBa
	MMJIp66ZCMcY4+9XeWMFISpS6kp8532XZJQ4NNcTnZK+X6icTJHpqK0xRBbpx2XdXHdYaeajlLi
	33IvrUtOqSVLUG3oy05GWZJ8rogivubA7C4Dsdek8vWo8rB/nreKiPeOX3tZ/9jenxEVSNJc4yC
	rjvqiEZj4tVAy/lel2f1w7gMqxGzWlc78bCl4Pz02qv03Wwrqu6Q2sfTqTZsZZiLA2VkyJS3eeL
	Pv6ZzNnVpXPauy/SRnrIU307Ftj0orZuf+KBcSGXJDurgt0NDwKDgT4by6E6lPbNlIoB/TjSDUT
	SD9yS/gzn8TvTn0+kI308o6U/ZFZY=
X-Received: by 2002:a05:6512:23a9:b0:5b2:8d3e:7229 with SMTP id 2adb3069b0e04-5b2c1b4dcf4mr570340e87.57.1785003526248;
        Sat, 25 Jul 2026 11:18:46 -0700 (PDT)
Received: from localhost.localdomain ([78.156.235.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be077fa8sm537878e87.3.2026.07.25.11.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:18:44 -0700 (PDT)
From: Akhmad <akhmad100913@gmail.com>
X-Google-Original-From: Akhmad <Akhmad100913@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Akhmad Zubairugadzhiev <Akhmad100913@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace yield() with cond_resched()
Date: Sat, 25 Jul 2026 21:18:37 +0300
Message-Id: <20260725181837.39951-1-Akhmad100913@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Akhmad Zubairugadzhiev <Akhmad100913@gmail.com>

Replace deprecated yield() calls with cond_resched() in
rtl8723b_hal_init.c. The yield() function is considered
wrong practice in kernel code as it can lead to unexpected
behavior. cond_resched() is the recommended replacement
for conditional rescheduling in polling loops.

Signed-off-by: Akhmad Zubairugadzhiev <Akhmad100913@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b28..6fc3774d2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -191,7 +191,7 @@ static s32 polling_fwdl_chksum(
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
 		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->bDriverStopped)
 			break;
-		yield();
+		cond_resched();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
 
 	if (!(value32 & FWDL_ChkSum_rpt)) {
@@ -232,7 +232,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
 		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved || adapter->bDriverStopped)
 			break;
-		yield();
+		cond_resched();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
 	if (!(value32 & WINTINI_RDY)) {
-- 
2.37.1 (Apple Git-137.1)

