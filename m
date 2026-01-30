Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773837F720
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797008; cv=none; b=LPCWYff3yhjoIolEm8Wz4lPEQhUH9ZvH+JMIDn5KFFhk2do+7s8ZrNy4H0ZivGVIH4qT/WRNcZeZ/pTVVxOwfvELayiDaMTQiGVt6TqgKqejRmju3hjhHdzWoD7QX0tSjaWV/ZkhT8kzSj2QyUOhoYQg04uKaT4DkmFtXHwOTtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797008; c=relaxed/simple;
	bh=rydnYZqJ+NFeWlELYNoZjjVmnW/PmZZQ4nMY0FQMv2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFqMYvpe4iGFzcVbDpCRH9W6lZnDhk0ZnPAeTYooaRv08ZMkMNFrUJ5FtcYDLrAgCNlf5BfROqZeInR8AKk2vjUPp1bgrwiqCJ1usTyGMn4nA8LDdOPy4/2gZdAo3j/7XTGFXPzdJiFzze23efXrRRr9rXEAgh3vrJD3YBOS7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM1wBWbh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM1wBWbh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48069a48629so24785875e9.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769797006; x=1770401806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=nM1wBWbh68CkIymKjRdAeqQDgWswN2D8swZ218KjWIBwxOwMux3w0JfiP2lrQPhMfB
         tJRPE7uI2TVgfQYh/oYHXdWcSEjhmOGySPj/PPqpVrVyQaGdBi4s2xVWjVu3w1jd7ILm
         xoXOQR7/Uc6Rzyf5ymI0emaj8tPzhMWOksm1xKr1o0Yszl/jjPkDdXY7gT/7W5zXR6iN
         dHjh/Khuf2WqyjJCoX5sXno1F9GnoKzvfJDNfbro+V+LfFOXkGvW3w9xPuzI4IQgGqy+
         FhqHBVON9a311I9Vsy4qNZM59WYB/R78n7xlsKWvcLQ3S5qqHm3SE+LfPAm8nHSmZDZL
         YvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769797006; x=1770401806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=U+/H6bf4uuJK7/iih+sNYUO3uXwu9I+v95PfhZvaBlsrqPCmliZ3WMdiiZhg2GIGMQ
         +v6GiYvugAMDd5846iqAoVo9lcm/H7W8uQ2Yncmwpk2yWWEG7Bv/z+g7EAr/ziMyT63e
         o375AagFh2qzlyUq1oSprGMkwf0OHpEQwPX6ymK/rHtIv/VkkNNloAGVblyCYQzG963C
         Xx/jh+JeKWA6EMd6ewud0GX3z1VbTgMprd1yu/kbyGp5tp8Rq86fUA+GPLo8h/GqQtfa
         Ic13SuDudT93NOX8ArUJ3bDbqmDkOfPr4Art7oNDCZPxcxh7lZmnSmDe2HCP9XKgAN2n
         O6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUHC5uo1gcEXqjuum4Pka9x0YKhEHWIx1NySoU6jYpqyfsqnHMW4OS30XMjSR3nclGi3cBsI2WzGlog5n7V@lists.linux.dev
X-Gm-Message-State: AOJu0YzNPOAu2hBVLeGE+QVWCY3czuoEtRIo6vOfJUSm+HvZf5tdkanE
	QnbTyhUB02/ioL7a/i4afNO5kN4FF4tDgMLPllluynShr/NiQx4rDHc=
X-Gm-Gg: AZuq6aKN0M6qhPsQLOjmOi/ziVgm1BTvm/39PaRmYhNhVtVMY646dGlKYMIrfhYge59
	IWhl/tOhS6fyUtF+/En3EonoRrsCQk90uDAfDKw7i/Yrx2bs6mn6WD29qV7EZeb6Ttpw6a4IiDS
	W1XRkoXcub21Gf29w6F+p273vxbHX6zXmpk1H9eJ14G3BCLaD8lmDBmp6Ix1MP1Aot8MOluGqK7
	h9ENnu7nMg0EL7PkO278T3a52Y6w7YAWfNDqDsv3/gKHMnJPh+1EJPW2n4aFOIK3Br0bOw67dFX
	5k7QRFTYb2XPCja2H9iWsh1g4VrdM3cxR8vyZf8ORTTT3Frq/RyXDa/yUtNIX0WI8zFmgPFGzws
	3z8TBviIBBLACKdFVa9NhWVLKAKvqmmzTBgmO3rl3yQC+A9vlRM6fdKxS8KU500dTAqoa80avwu
	vAodrqeLFlmSBi3FMURL2bPpZvOf4d5QTvV8m2GNRdWwD2TYdd6Y0nn9fNve5UxQ==
X-Received: by 2002:a05:600c:628b:b0:480:4b59:932e with SMTP id 5b1f17b1804b1-482db45bce2mr46184425e9.11.1769797005701;
        Fri, 30 Jan 2026 10:16:45 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm280571025e9.13.2026.01.30.10.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:16:45 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v5 3/5] staging: rtl8723bs: fix spacing around operators
Date: Fri, 30 Jan 2026 19:16:18 +0100
Message-ID: <20260130181620.199152-4-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130181620.199152-1-lukagejak5@gmail.com>
References: <20260130181620.199152-1-lukagejak5@gmail.com>
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

