Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD76238159
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 16:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786293575; cv=none; b=Uirqx1wbOtU6yEopIYsdnBzYOX1GJrk/3ZsHUGyYXbZJ6MxnVC4csfba7d+9nM7ChaT62mtxRtqyGmT8aBfidoVgtGG0hTPqAxGEqRPJHWHcyUzipJIWPdhCpcAzQ5l7Vz5kEHHLsYmhN8EdRpQ5M5Cz21EzdH+dgj9R+CN6sAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786293575; c=relaxed/simple;
	bh=2wosO2mDz21mg0ShIbEv5N4tWGYn6JI6kCwFTZTXlXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYkh7uoumKfKmMizl4876ehs5LwDpkchAV0xQd4gHdoMsVKxhwQeHRi2RRvoFq4Hn+EuqBNF2s0yTOVtjzMItftKWxtU2otRM0qVxlDPcSRe3v1mFDCvkwV/jFJwOdh0orKc3hCIG+0UBmPzSsj9GsR9LX/+45/jCisvcJKVb5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm0dRc3h; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm0dRc3h"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1011231a91.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786293574; x=1786898374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBk0V4vPr6ekIQ4L5SlbS5Z9vkc2fR0JVy32Iqfu/RI=;
        b=Sm0dRc3hNaioXV44GnjQImMZHp6HmnaUp2yCwZjQ3glSNs3EFCjTgu6UXjVs3Ju5fc
         ljndLX9oN2hwJnEGvplm04SGBm0VCoz7OuPF87tmNwc0yNronxB2QUT512ltKdBvomCg
         d7nQMSRHtkesX7BWDl5HxTe00uKC/dxv+8zekQbHSu3qJPub49FawoBgzcFioiefBTRq
         IDX3kIeuejvbgxotYEil624P2ewtSbY6icxXFhP6q2EPFuYh1WFYL8bTmx6mMQFjEeKz
         Fh0z4uhCjBatY1iZ3rVjhTtWVpMXyl76sizkhvMmfrgOnTV9nvgrtEXwZBR3hbSvkZW+
         kD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786293574; x=1786898374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBk0V4vPr6ekIQ4L5SlbS5Z9vkc2fR0JVy32Iqfu/RI=;
        b=jCmwfe98Wqy5OFHDdYXhI68MDTPSQk7v0+vX//Alc+y3CIZJ42DMNNOPdEVVxiIoEy
         +iqxwV1jRzPkoaw2gdWWoMgJcMIxLCCSgiWKmqTIvNi7uSUQ8+EbOEuZ0ufK1vytzS7O
         gWLLokDr+Q61ORpKKMD8plSuUwGzldjT7H9tguH4UqCiFVxr8IImGB2rTHjHr3Cgv5vY
         Jpl02ucPajmL8Hb0tNcoISSh4El3EQg5f0skmDVVAczIVpBr6c0ILJ2kgLXEJNhIqehQ
         x8sbbeRYE4J1hpkk8hbQzTpcTPhkSL48K36bBsn/O+Wia5jGnW5tYfIItyh7mF2li1NO
         g/dQ==
X-Gm-Message-State: AOJu0YwXUXyopEMWTnVUNAUbkqFgwXPcW64yarLpTrrfnZpFJXYgZ/zn
	ZlP4hsmAhq4emD/FS+7LJGDGROag8N20PNzOdmR0SqSowdE0PK+IEmxL
X-Gm-Gg: AR+sD13IKiBiQE3uq7qICkYcq0N2/dc+YsNvO8+KendMzvU9GUczUkLshQqR/nn2eYk
	n7UaQ+p4lHVJOxs8uq8m2zsQ9OWfEJxVesASQKdSVlIXw4HPjQ36JadED+OhuKdSS7ypYLlh0gj
	5FRl7dlQF4xLE8LDZRchK0WkGQWGImLydMGmk+my6utbEx9/LPyiKk8KfjXDYY7cH9FwjTxSWwF
	R/S1sLt3ZZBdmp7w0GC23//UccKtrgjOHCQD1WqLURkUfAVxqVIqBsklX6Xt2gvSjditLs1MlVq
	lpb2qz/agA2WMwui5MAyH5gy9I6akGcpI1TOWN472HATi0q3zKxib+cY2mPst/0hAV094VRQh2J
	QNK4PTZq4NyQGhfl9WXaI0Tz0hIeqU0Mq1eQC5pT7Ycy/U141QgUC6UUS0ei5TRyLhN5DIfTBZ5
	ZWiAY4ACnnhHJzibJuGGtAxBGPZvJr5beT3rXAlAQOjAHSTelZFpBallJpq7lacA==
X-Received: by 2002:a17:90b:1d4f:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3903c5381d6mr36050873a91.5.1786293573880;
        Sun, 09 Aug 2026 09:39:33 -0700 (PDT)
Received: from localhost ([103.210.95.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7ad29sm26639148c88.13.2026.08.09.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:39:33 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: use usleep_range() instead of msleep(10)
Date: Sun,  9 Aug 2026 22:09:03 +0530
Message-ID: <20260809163903.257655-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep() can sleep for up to 20ms for requested durations under
20ms, due to jiffies timer granularity, as noted in the kernel's
own delay.h documentation. Replace msleep(10) with usleep_range()
in chk_bmc_sleepq_hdl() for more accurate short-duration sleeps,
as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a9382dc1294b..1455b4a5b9e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5714,7 +5714,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return H2C_SUCCESS;
 
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-		msleep(10);/*  10ms, ATIM(HIQ) Windows */
+		usleep_range(10000, 20000); /* 10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
-- 
2.55.0

