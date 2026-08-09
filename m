Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4BE25228D
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786301225; cv=none; b=JOMvKfOyLFY9xJLjbDJ0JIs3Oo1yvk/WhZqUPA9iTEK5KONeCVAQ/6ItWX5fTQKN3wlTdNON0zPXw0n+lNxwpLYedQ/6kCaV9ztbI1wenEggyZHQIr3lxFf3/qMf9nNL7q6I3NKlnf8B/UoB07VpTzxt1i3gBIwJ0rp8Zk2KKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786301225; c=relaxed/simple;
	bh=ZBE8th6AlV/fm1EPsMgsftnpyz0qZyU2KV3y4c42TfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rPdgWOA2Eve6FnUNZ1bpx6lWwfGuYs3effUl/xkBkkml3fF0++tfjeXknPe1pbXaKAwN4kGjpqooIOzWFWYhYtDl4qbLKeEGPBUsKq0/cr4b7qxq0hqpN/sqHX2nyqMfKEWTInc2LjYzoZs9BnGKxlsBBAaFJs4ndqthZ2ZQ0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6AKtY4A; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6AKtY4A"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad8076b01so12477305ad.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786301224; x=1786906024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uExiONRWEzCoukjDPrB2DScsnyIchjs3D6jF7d3W3z4=;
        b=E6AKtY4A2EJe7S/BvRc/FG5D+d5eAzhqrQAPxX8TD75j4L/2K4EPT7ul8GFOZ8/3qJ
         GPxRqA9wuIMOJrze6y2mIpcr4xg3t6CWsccq1JWA3LryJjiCB3vmHmJWxJdeypVTcsBx
         fpkaZhrs/KOuEVJVL0ICqm6Ch9HWraI+cxpvqQEo0Dkjqf6N3VC9hl7sy/6LlIbY18VW
         RcQHezlb5i4syUPbk7CafJmW+rnM5sMgCztAWsfugjsALx6w5qz8bpjJXfnbmbBa4N73
         rc6GTd7kw3+v2imaZ+dFwnr6OOnvxhEYISpetFM+hU4MzAjSJm1Pbx+hB6bpLpX031aT
         71hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301224; x=1786906024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uExiONRWEzCoukjDPrB2DScsnyIchjs3D6jF7d3W3z4=;
        b=aI9TOQjiEWNDW1csVc8N1raczZa6rOrcH+ii/vUnSrdKFhT87Tsd0BPiqNXSBrgcK+
         FimlTPAqcOgxT+2jxiN4UaRbkcd2xFrqEAU1YhNoFkG4LM2BFMImtwoP2dulaaKXcGkT
         RBTim9y+KI4VYP2cnGiN88epv0PwnCTGqTHAP2C5F8j72dPIFZSJbnfyTLDJPTYbevAy
         OLmpnDqOgylT+ZtXkUpK5gcm0scZP3zNYpXl8cv7XQJC0NbFt3OhLOwhx8KThtpvcguP
         CtqQzd3f0i1mpY4wcvJAzRGyLQOr5dgPb+2LEOqvmDxdORDZiu9H4U4pBZV7kJH3fj+8
         /28Q==
X-Gm-Message-State: AOJu0YyckG3GxBX1P49nVmG4dr3lwdusU+JX0P8xXUFVFZ455MeyM7IA
	5NRfXODoSRG5h+lVLlS0gUQGQQymIQOS0uSIC4nbktqRyy6UdoWIDVRcYTn2DQ==
X-Gm-Gg: AR+sD10eQJB2Xo0e1GfffDgtV+D43hGRGjPpyQ5XPkpBoTdVixiLd7qEZHo30QS1k+E
	QiUXAte8+H0XEaL4qY90ES30HzE75DHSc+U/dwO47f54rAdc4yhUSiMhL8HLe5/bBtsRUZADEDC
	A9esv9GZxsOuFzF0Cmre4yCXpPPTmMP+txPDesfgiElKa7sXxZClTQodt9jm2O6erU1kWCnGQPJ
	qgly0PberEgLihYmbfB2IYAJi2PwP1pUwh1NP+nJQvEBCXBrV100NqXgs8PY+NrQkb1F6DR1qsC
	oQeTShNH0ex7MSV4uBg1iAIgerYvkoBaamf4bIMPkq+JZZf7bvvxaqPY8Kt5PP0HFlcnHiOCHDS
	rxM1k9SbcGRjlcDhL9QIurCqPe4lxkHjzXM3JFi2OCkYMPBNxnYUyllsaKGQxitd1pxTgzpG/X7
	8RpSdE3RHkL4wHwkj33GBcekZifWXij7Pt7+kc9DogCwQMez9hOD8d8h50uThuhg==
X-Received: by 2002:a17:903:184c:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2d0caa040e3mr485938475ad.18.1786301223682;
        Sun, 09 Aug 2026 11:47:03 -0700 (PDT)
Received: from localhost ([103.210.95.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86f98esm33899119eec.6.2026.08.09.11.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 11:47:03 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: use usleep_range() instead of msleep(1)
Date: Mon, 10 Aug 2026 00:16:14 +0530
Message-ID: <20260809184614.341856-1-mitramaurya80@gmail.com>
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
own delay.h documentation. Replace msleep(1) with usleep_range()
in the polling loops of LPS_RF_ON_check() and LPS_Leave_check()
for more accurate short-duration sleeps, as flagged by
checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf1014ed..075f98c799c4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -414,7 +414,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return err;
@@ -567,7 +567,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
-- 
2.55.0

