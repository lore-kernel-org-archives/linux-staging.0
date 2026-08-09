Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E9285060
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786290938; cv=none; b=WKHTzOLw80QCIDX3GGyeFbXDPrwm2Dfx5sefpf4hGnbXg3KdXhrCz2BDR9bjzm7JQJgOg6+e81HrLiH7QNFBzTCFfnEFXCxgqVMfwob4V2HreJi4G51oEKczAp2ZqcsmR1WhUsqTQX9UhDv99d0ms+bVSx/FLswZD07f+CsZgQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786290938; c=relaxed/simple;
	bh=ZBE8th6AlV/fm1EPsMgsftnpyz0qZyU2KV3y4c42TfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WE/t5sQWy3LHt+fFr6HILsBpicUIHpnCRGSrQGw0Q6H0Mvo3gm1d2sF36/gpiRx/IvGp4+3jNfg53hRy9ZsfTT2/GofsLAY6f0bBrmUBI5qxgbh9K+62hQVQ9xBnB9b0FE7yQc0mPTs6pXY8Dg0BMGnudalMiVli/uePoVH/pJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+pUETS3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+pUETS3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso734029a12.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786290937; x=1786895737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uExiONRWEzCoukjDPrB2DScsnyIchjs3D6jF7d3W3z4=;
        b=I+pUETS3ffh85sbNZtiVyk8h1rdZso0asexRU1EOQbGXy5RvEX+2DuUUaQQmbfPW15
         Tb9Of0JuK5Y3vsEWWeVyA2lfccP4NjWDLHpfB382Qvtiv0+R1YOzz8yfhzVTXxVHr5ft
         34DsQd+wH8KvlduJcnRGhkYuANjlxIQ5NX4WaSVIKCsltMb7RojDUFJPsv+FY5XCpetZ
         jjFhyM4raG1gWKbqJmiGCufDSDWudFVMBi+b1Jncd4J48J9Ygvb+5YwKMpwU2pIk+tdt
         QpWDu8z0R+it90CNCGeLb3FZdEdCtPAwbiZF72crtA2ohbwTVoMPAy8s3bhNZh1I3uAU
         k12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786290937; x=1786895737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uExiONRWEzCoukjDPrB2DScsnyIchjs3D6jF7d3W3z4=;
        b=nm+VJ4u2Kla/aRvQcZHrCDKeQ1PayHMtuZgYdJb/EvllLhi7BOqZiShpGD5H00JoIH
         uoP8kckxWTRz6NLx9XsfQdqmf+fQy7qCMFTlRsF8znamBeiD23i1uiOt0Q3q557ua4n/
         Mx7zYW7lUsCLp7y6L91Yuveyuphe0vTVwPH5Xi9V177TJT5EvOOari/z9yjl1AcJYYtw
         WbyieMiqGfqtYF8EFJJbLmTxKXZENo8mck4Zwmk/5r/utsHKrmDqr/4C4QldjGZfkqXe
         IqSTDN0IvmIzvnLESuSiGrFipbjGFZUFm8VIm5iLZTrpik853nWKSQF/+i1RxMF8iM5O
         DMtA==
X-Gm-Message-State: AOJu0YzSP/hJTlXkBTBna/w1SXpK+XGxblWstZPoxhIuLD8ItJiIaHLB
	B5063B58EDOD/lRkZk9YOeZHYuw/5uBxD47NUnC4CmfSTawc/YDrPoeY
X-Gm-Gg: AR+sD12Z6+D8gEUfZHvRhHRqvPZJFuG3c/aNprbUKWPdd6YpBoeN0OIiAPYudAYEl/M
	J9YttUUU0ZEhX7zVSMfvymZRqvF3ZvOrcGb74zJYMby56Ra5Wu+YO+3iAb+9UtoADfYLp1Yc5JY
	DDynp72JXHGAxufvR8eLqTwr6SJdHwHa9k1jlvJUpVM7u/HgW+UtBeOD5jsUh/vmz8jZFfiMlel
	Ly6PP84EBaByBRRScNFFA5XWanvGarmFou4gBYJ3cSQPiSR1YVQx6J20cnD8PTIykS6fT06Gd9R
	QWbQTOrDrVIDyChGWcKl7PNWKdUPKP/WMve1RGQr99sWWtN/CRoBuZdWbrleKBXfiUIuRQfsY7e
	BP1fmAzQzEZeHxsgaxwQVejoE/THYCZVxs7Ft2UE1fdsoS0tknSEiOzXKyloInmD+xrA+kDWIV9
	9JI5Jc7+dza3duGbDS7DP53v1UkQDrBPmfVykt4GMCs/Fsg/Db13mlkXXMUEn6vrg=
X-Received: by 2002:a05:6a20:1a17:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cb8810636amr34011270637.1.1786290936592;
        Sun, 09 Aug 2026 08:55:36 -0700 (PDT)
Received: from localhost ([103.210.95.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a5ee91sm26436056c88.11.2026.08.09.08.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:55:35 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use usleep_range() instead of msleep(1)
Date: Sun,  9 Aug 2026 21:24:59 +0530
Message-ID: <20260809155459.201885-1-mitramaurya80@gmail.com>
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

