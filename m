Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6FE1DFDE
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710573; cv=none; b=DivrkO4U+/DMSp3kAxY6dvx4X6xqT18i5wl4vqY5ZvqAaWS6EeWG0sNV02JeRSQxE+rBJvhBpM6ZomjdffWMuBXXZGg/SslCoBNv46pXdkvk8AoHBKvGNVQ31oLJ+8r75tI7Uc50PUVFyG/J3pgBvwpqOVy4ZcmeZR3+At6vuYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710573; c=relaxed/simple;
	bh=rydnYZqJ+NFeWlELYNoZjjVmnW/PmZZQ4nMY0FQMv2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3Kcis/wkKLmpGXtHFgavaEpPV/nC6Pol8aFFoZnvz+fS7VJx4CDzwPOCMqnubhl2zuLvr3MKIWvE/6ZuvZRh0LUTwjWzETBiSX4CiMumqo4fbV1ccpzHDgAx79205qHqUcOR2PPpNy0gKr8DTgRkINncadDo1H1uPpyXbwoUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxiuyxzA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxiuyxzA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so14653715e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 10:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769710570; x=1770315370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=UxiuyxzAdaZA98EXghahlLTIl1zlmpjpXLWALbFIEJjX3Z39LcwMI3gVxH+nK7zT/S
         K9xCJzHepNQbZ84+ls6Q6NsH1hl7BHscKgUgq6ShKGMQh/zvLyKoRrbcOv1l4hQ5BQsI
         UP9Hp2KXCYvrfXEUX7OarrC+nM6fDuiX4GF/3XXzK4BYeH7xOV+5gcHd7curg6L9svEz
         F3a1wZkMbIEW9q0CUwd/tE931M94vuGRlk+4V3PyWN/1/pNYPdsoU3100ajqnld/k/NO
         XEx6r70iY3VwMddBDWanwprFroiS7bXGNLB2adhnelvbfDFMPWnDWOBYMVefLW55/xeo
         6hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710570; x=1770315370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=FOvV0SQ92diGf9sdCV9HAh0nSghBx+eNAsGyuLgLCkBqS/qyVnK0rEKWQLYZbXLS/y
         JTMSa7Jr/FRxUzcQIkuUSrMn0j1Sd8jkfgBkTZvw2/pQwB0PjEAoxyAA1f4a3L6zHyB5
         tuUAluTG1gtdecGx+8qQ0tVlIqZY5NVfa3bpdWq0Jp8EFcRxPBj2jFQ6+LALPTLVFI7x
         +1gcTpl8DPZYLYaOsRntBRq7M1jOUk9neAFFz0YCkWOcyXfVk1Qt5GyV1PsnIeMcYyKg
         CYUK5e9zdwLt6bhqnsrXR8rEdHRbXafrIlVUFo/qYre0Pcx2wMi8WlUjNQGPO395XHqA
         v4mw==
X-Forwarded-Encrypted: i=1; AJvYcCXfkjWHA/OEpuX2WlBQ4uMoi+Bd2ly+A7CWC5/DJfbausLmlL2OdNU34S8gFe8bdUnrcmNgDxw8G7hoXDeV@lists.linux.dev
X-Gm-Message-State: AOJu0YymULtARPcQvkojwJTtFBKXiUE78xLs2t//eZQmKuiyeWveGJ1C
	5i2agDnJ5wYSvVgfSx7mOCYW9iRryjj+SlHyio8FzUrl3eruRoOq2pA=
X-Gm-Gg: AZuq6aJXrgFR0zZCX8fcFHKSPWjXOgO9Y1VQOBITMnMITGWtUE88ndHjrCMlK3Sb/ME
	OsCnPH8yIMzsIjbVSQp4kIpciGfwrssIXfGDlR2NxDhAfpV9UEeL6kt8Qi9E+6Y7vgCVQYJ8gfz
	ZfYNzDxLQ0BvPOvX8ZXhtAN68FfgniNLt4vyyJhAToa2zLnJr4uTNUOei8uKu4nTavY5fcd4G/n
	3DhlFpJ3lthE13TmIXQSTSwxUOPkEZEScOejELmkBS8wtPqZwDt1SnsWDoxxFYhh2pHnFTbTU3S
	Bf8s1UAg6YxbLmmQX7CE3McnRweaW0Vc0UjkbHzCpGmbm9XJQQab5MO0mO1ceyoyOTg0XHhS9Se
	4oqM5mknl8rlFzVkuTUNtk1mPhqJUwiQ0Ip+ZCRlxYUjRLS0xMiktyPodrUX1JlX7vzvxcG8F3F
	2o
X-Received: by 2002:a05:600c:474f:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-482db4592e4mr1009175e9.3.1769710570317;
        Thu, 29 Jan 2026 10:16:10 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm136578725e9.8.2026.01.29.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:16:09 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v4 3/5] staging: rtl8723bs: fix spacing around operators
Date: Thu, 29 Jan 2026 19:15:39 +0100
Message-ID: <20260129181541.72066-4-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129181541.72066-1-lukagejak5@gmail.com>
References: <20260129181541.72066-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style issues by adding missing spaces around operators.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 28 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index d75a63fd8a6b..ae5e4980ed06 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -17,8 +17,8 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 
 	if (enable) {
 		/*  8051 enable */
-		tmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-		rtw_write8(padapter, REG_SYS_FUNC_EN+1, tmp|0x04);
+		tmp = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, tmp | 0x04);
 
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
 		rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
@@ -158,23 +158,23 @@ void _8051Reset8723(struct adapter *padapter)
 	/*  Reset 8051(WLMCU) IO wrapper */
 	/*  0x1c[8] = 0 */
 	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
-	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
+	io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
 	io_rst &= ~BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
+	rtw_write8(padapter, REG_RSV_CTRL + 1, io_rst);
 
-	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 	cpu_rst &= ~BIT(2);
-	rtw_write8(padapter, REG_SYS_FUNC_EN+1, cpu_rst);
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, cpu_rst);
 
 	/*  Enable 8051 IO wrapper */
 	/*  0x1c[8] = 1 */
-	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
+	io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
 	io_rst |= BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
+	rtw_write8(padapter, REG_RSV_CTRL + 1, io_rst);
 
-	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 	cpu_rst |= BIT(2);
-	rtw_write8(padapter, REG_SYS_FUNC_EN+1, cpu_rst);
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, cpu_rst);
 }
 
 u8 g_fwdl_chksum_fail;
@@ -268,19 +268,19 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
 		rtw_write8(padapter, REG_HMETFR+3, 0x20);
 
-		val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		while (val & BIT2) {
 			Delay--;
 			if (Delay == 0)
 				break;
 			udelay(50);
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		}
 
 		if (Delay == 0) {
 			/* force firmware reset */
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN+1, val&(~BIT2));
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index c774a9009e95..668616efa68a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -875,7 +875,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 	val = rtw_read8(padapter, REG_RSV_CTRL + 1);
 	val |= BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL+1, val);
+	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 
 	/* 	==== Reset digital sequence end ====== */
 
-- 
2.52.0

