Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585635F8C5
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 01:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313736; cv=none; b=S3g5p2vComBLt+v4+AbMlrOmbkVCpucUFFVagQTzoFeqdtXUhDNf8/w5MSRAUyGmXKixrVyb3ZeDpcUQJjxqTtUg6p9rtLPWt07R8gw1NjAYXXIwURNZlpqQypDpaKZ2xzwhJkp8sgdbFPQE5lsE7t5QD4/qgrX3fXiDD+0TMEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313736; c=relaxed/simple;
	bh=765FEkqjqfncj2e8tNjNINC9WzEJSkP54Gvf2N8P1k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFpNwAfHaIhUJ9hDfRZjk9jOlWCYd4qNf7G5105UxkrAFLBUS3MbnjLhTfJHCoqyL4/OwAynkClAp5Qqli6oODxqqnRkvRuzMKB1KC/weqvlw7JNJkmokYjbQV0PDn1BSWKvh6YISyOym1nZp6YMt6Ppt9ctNxE1oT423m1O8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmlOaL1v; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmlOaL1v"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39682983a0fso625914a91.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788313727; x=1788918527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUpOiVvuBNOuviz0gomL/IYfiXGNzacKn2pjup1W4dQ=;
        b=JmlOaL1v4tIQT0EmEps0CEGLjz8IlcJyydYauVI1gDTjxJcT8j2NGXh8w+wwz4h+Is
         SgCvARJi+zN9C9QSSLvbSDTl3hdrVpCkatdhHSq/aa8yJWmVNDRfPy2IsUlnRQl1Z+c1
         QDZkJKzA3k5ibEflpTVImAFO+0mX97mUcL+GYVwbP27otNtepruAvLAeujHi6EYbF2nZ
         qo+8feqH+abBkwPdQ/Rxuckirv5Pbt4XB5WU7FRvNm4hm+kyY1eLotNzSQm4//7PhcG5
         wtmfl3E2onaljdHpyHed0mBqQzYtfbUgugtoiENB52uX8O/yS3aVflzT/YL1QHYErzxa
         oNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313727; x=1788918527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUpOiVvuBNOuviz0gomL/IYfiXGNzacKn2pjup1W4dQ=;
        b=FV3Z5mgRcIpasX1B0commoyNlcU98ms9NKPQDg5WLKPUD2WNNMb7bw/vBYE7XifU8m
         w7SOQG0Oix7ECwCOOBmUsr3H6zBzS/W/6ZEPWuy3GU4dWrvJI5y5yt10Es5iR0v4uPhv
         QIBEscu+z4QGYdPwDO7dClEM7qSm+EiYh53fp8Jk8nCaf6Vc/eSu+m7a643FcHyKkabL
         apwfayY2RYR/XWFr3ccu7+iXKTHXnWrFNtlpjBh03P909MAVOmB1JV6LL8xZJKgc83HE
         nVH0LAGwTS3nMfKNwkkuhsMH1II6mHsg25V2Od+pSKcM2+bUbZXbUXzyeeP4kY7ijMb+
         v5Hg==
X-Gm-Message-State: AFuF++kTJWwzKLNvtYpiU8rVOKwUtRTSc/T2t5PB24JxexEWxj3ES4T6
	OnRmShzkBvQazefpxXuw6VrmHdoWhlZ9A63+H5PS7uAATPkO1G4Lhtcq
X-Gm-Gg: AYBFou2mXlhHu04KRZeeoCG0e+lBuMTawxDLAV2+hiBUzG+tdqFLCwMx9W+k+beMn77
	LCYAk2T6xi+GwIbvJ93KgbvDZFJ28mO3NzSL07JWPJbjXU2kS6r5WnXIHNB2kniHBfO8oj4V/Pi
	peMgNA8qAgUkkFeX29aTjFYKRSI9fhiR3ZeRL9qYy9DE5Nid/KUpryRQo3yhLSbpK9CopNwlZ7+
	aywW7VujWAf6SaAHyMjdITaDiLe6PIvEDD6zEyc7JFhL88v8uzyoKQTj4rGVFUCH/05vvE0HcPm
	LLDiHd9qEPmNW01k0CMLbGJC5ugxFJq24cXQDmB1tB5rDIMB/9dRVNI7YRpR1sw3b4+dK9qyLfs
	vONAZiUcuW0O022EAg4n7vQ7g32D4/1wwomJ/Er39/Gy22S3tbaa4cNi0eanINASLWFZhH+JKQM
	lABlwdrAxN7T3/uv6Q+OkeBu6ybIDKEonzx5h0QP6+X/9b008SbZx2WQ==
X-Received: by 2002:a17:90b:6cc:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39aee0eafb9mr1919630a91.20.1788313726853;
        Tue, 01 Sep 2026 18:48:46 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d76463csm8477285a91.9.2026.09.01.18.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:48:46 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: define EEPROM_DEFAULT_DIFF as -2 directly
Date: Tue,  1 Sep 2026 19:48:32 -0600
Message-ID: <20260902014832.17625-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817210507.26168-1-skunkolee@gmail.com>
References: <20260817210507.26168-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EEPROM_DEFAULT_DIFF is defined as the bare integer literal 0xFE
(254) but is only ever assigned into s8 (signed char) fields used
to store signed TX power calibration offsets. The value -2 is the
intended default offset; expressing it as -2 directly instead of
0xFE avoids relying on implicit truncation of an unsigned-looking
hex literal into a signed field.

No functional change.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2: express the value as -2 directly instead of casting 0xFE to s8,
    per Dan Carpenter's suggestion
v3: rebase against staging-testing
---
 drivers/staging/rtl8723bs/include/hal_pg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 32e66fe451b0..6f8c8307eaa7 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -38,7 +38,7 @@
 
 #define	EEPROM_RF_BOARD_OPTION_8723B		0xC1
 #define	EEPROM_RF_BT_SETTING_8723B		0xC3
-#define EEPROM_DEFAULT_DIFF			0XFE
+#define EEPROM_DEFAULT_DIFF			-2
 
 /* RTL8723BS */
 #define	EEPROM_MAC_ADDR_8723BS			0x11A
-- 
2.55.0

