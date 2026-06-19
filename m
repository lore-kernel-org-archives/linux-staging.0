Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36F31E107
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 02:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781836301; cv=none; b=nyCjxYgami18KNpUMNvE6v3fhzqilLZUo5zrnYlYaJZCUpCX6ade9p8P/K3MQPIowPSZT8cKJDRwHy+8Qttm+Ta07Ouda1tyB2lXYkSgBcYOmsvgmFPX9l0oBwDMiSMBLoz9iK71PTaJzG1iU5Q9reJjXRRH/6BsG1VrE4Aqa9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781836301; c=relaxed/simple;
	bh=XTRiVofuuvURnPJizagKNJPpNDhEXFZPMrC8i1La1bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNPS/5i8uQtFP5zlrZQPMt0aQR/alLN6PMtb5xNue/zmKkG5icb5NW4AbpV+lHmi6cbN+kAHlnBUSltuGocUAWZvzb0YircLhBdvCAaF3WYcSIYt4TrUNQ6ZUfNyqtZIrZpYTk1FVG41D0/VjqkJm4kq4JGi3NLsSSJX4/aYXcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo/clJEA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo/clJEA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so12944455e9.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781836298; x=1782441098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAiZnN0PO6pqTF6376JT7WwOecYF/RxS/5CZpEWZeKY=;
        b=Zo/clJEApVAx5Y0qSFNfxZONhglJaJCPiv3I73x9zmXvL/UwBFyB07msPPEzP1kRJw
         ItjWqq0RD7hAiyTlWE7BuULsXTz+jCR1I1Cm6AVar9qNkDktHn6W31w555je/KYEZi1/
         /wLC/uhSv0pRinP0aci1/Zu9NM+JWZf9ypqkZsEksGke0vx1jJ7mDdzvrC9LUp2SGZmV
         8o9q5hEJTgYIoE3mAtikE++z5FFseuACIEtIvHxt3rsch/nc+ZoaE8h1dgTAYJc/Huly
         vs+tDLUzfvNexKOokDGhsDwRtrt/HdwkMxbdpkc/2rhmyFZp1gKPfdmQju7GF3dU+jpu
         9Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781836298; x=1782441098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAiZnN0PO6pqTF6376JT7WwOecYF/RxS/5CZpEWZeKY=;
        b=ArIOlP/tNQmSjE33Nh2wJCZkRCMsF30gTqmMqR5OG5hgq0k4W067WW/k3TZLF2V99F
         VHA0JO53znj05rfSM5WXeMYjf8H8MNfsii3NJjQgBgya2Bp3wpn+h7UxUXm55Ui5kghU
         jPWPpIdUIogK6/EYLDQ9fOXhZuUTy/bPT0uVafNt6LxdXGhe554gSt2NUbOT48kmYsnM
         VgAuxg6ldtQSIn7gQ5aOFZvirygLVBD01bIwHPd7ecAyJLAHpTBNxdJgVMd0jnROHYBm
         E+8TV6qXeTq3jVTGDqoxdd9oBMx6J0+99nz0m1pXXStvFmj5SWY+45kUhhHvM/wxYCPf
         MbTQ==
X-Gm-Message-State: AOJu0YxYUNFtuBK/vx/pIAtRyvCcR+lANWBGp+XN2Flqb2R1sZntpEFt
	SQMHtPdq3pnrnYGgIbSfitTe0o4h70A4xTAqSXe4Wpqqv1A2QZKbuNIj
X-Gm-Gg: AfdE7clNI+0qew/0tDP/nhJEyIV0h4KwFG4HV416WEYk730LVxurgnNyNSSta6a6ewf
	wXyRPpoTsI9JWFoO8e2ybSZTqmG6/aNUVl2MbpV9hf7ROlVrksUgPWQoitgQzi/oR8LqeQhMTWQ
	qqaRPB/l9ZkLIqhr6pZgkrPig2rKcem59C6EVuAW10qksGL4Ldinem6mHQ8tuHixiQYHK54dN7b
	Pl2JHBjLrMp3N2fwpFooXml3OBJij3P7NiaXAqJ2uUPuw9dH1mnCE3EVZJSDl2ZjlfbvTcnYVEf
	J2FoXjn9hYoSuYJ2Y3XmqA0cRT/4x3lEApQsOnOIaMggyiHor61PKrJ8e3OoOLya0KtWTHRZZNX
	X/5WWnWu4wt66GjeDcQe8qi0GQvFegePJptZhrfzMqKChyp8uHLfuPlQoOPNnrzuP3afb5OlYTQ
	gmZIJ8QiCx
X-Received: by 2002:a05:600c:34ce:b0:492:4335:4d4c with SMTP id 5b1f17b1804b1-49243354dd2mr4346835e9.30.1781836297675;
        Thu, 18 Jun 2026 19:31:37 -0700 (PDT)
Received: from adr.. ([185.252.220.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc41d01sm3558121f8f.25.2026.06.18.19.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:31:36 -0700 (PDT)
From: Andrezinrc <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrezinrc <andrem.33333@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant kfree check in rtw_xmit.c
Date: Thu, 18 Jun 2026 23:29:38 -0300
Message-ID: <20260619022938.15691-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant null check before calling kfree. ccheckpatch
reminds us that kfree(NULL) is safe and this check is not required.

Signed-off-by: Andrezinrc <andrem.33333@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7bce0343d..92e818705 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1736,10 +1736,9 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 		pxmitframe->pkt = NULL;
 	}
 
-	if (pxmitframe->alloc_addr) {
-		kfree(pxmitframe->alloc_addr);
+	kfree(pxmitframe->alloc_addr);
+	if (pxmitframe->alloc_addr)
 		goto check_pkt_complete;
-	}
 
 	if (pxmitframe->ext_tag == 0)
 		queue = &pxmitpriv->free_xmit_queue;
-- 
2.43.0

