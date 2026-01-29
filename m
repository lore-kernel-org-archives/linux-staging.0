Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A3338925
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702244; cv=none; b=eCokwRhAK5YniqJTw8ucW+k9G0FVKCtyr6dR08uVUIkeogVAVtuAs0N4pGl+w37Sq2Hx1SDwJ0GaEB2FVkh/+yaCeSjkxja0Mj90GM/Uezx21AUicvOWNdbbJVT4mEeyzPLvPE8KmW4QMVbszykvDZY3BToB4sxtTm7KqJSRUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702244; c=relaxed/simple;
	bh=rydnYZqJ+NFeWlELYNoZjjVmnW/PmZZQ4nMY0FQMv2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOp/C52llaZWB+iCgVVjLeAR9v7ECuntZvluMpWdBans5e5VRc1+lxb5W5nv1uk/qR9B7jyrvY7qeqQBV3KLZtZsJ8ZA3UoghTkPRITP0I9Xb0XQYA7TjprJFn4UBp3YllOGTTZKrO7o4W2Ft5sppb/M3eSHQ3fE14BTcDYsgrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU9SJZFL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU9SJZFL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4327790c4e9so737025f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702241; x=1770307041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=lU9SJZFLTWyBwgUKfo7xzDkiZxKIwacqoD31cDuf0upTnvRSGxqlZejyIcyZKJetuR
         5kJykxfrc2L1wwB/zGt0ELmtWuM1ZXhisXXkTJeUnP+xuaqunNcD1j84Pl1ViqjZLkjT
         dZViJkBrnKB6OoTk8AVI8m8afJ5q+ajYNpekFi+yZcN8ryoUN3aKvKdCfMz5QU8HzwLW
         x72Ut/h5o7g7nb+MJh9PCVmvu9gIttQRwukhxYltEZOzfrvd7inCgp5BhNNWrHc8jz5i
         t2Fa8pXawvTeN2PuuoN5YPJRlfEscPFZ4Oo53Ff1JaOT2sDKsL/kTzx+CMCk4NTeaCTm
         oZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702241; x=1770307041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=WrwaLt+ocBrgJpsYY8lE4qq0QBy+f1OF75LFxwjCRbLoi0rLiKXrZmYw/cFCAmf14S
         7UD+N8yHJsTHVV+G62/40ZsLwPiHAm0BNz4TIXQfZ6/Old7vnZufynyNdJsBmsChFrNh
         KJ0EF9eAkFDXDizTdOsyEHxbGWwJ5BI5PkVJ1sOz8534tAKmZ6a9YP3W51RIVbcAp7Ii
         +KT2zxYF6Ws+9/aTEoA5bUZtn5loIPuNj6qUfl/Yrbvnt3ps4q73mnRLruD8yPEo2izO
         CmDrBpyFmX7B46IRZjxcdf+LJaWEYZRGnQn3LTs2Hc+woOjbz3NRkdM7+J/k9gzvcGWe
         RrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1HnGvIo5aY4rF6oh7BOr1bmVjqsFGEMHc0peyphhG5XAsgJGZK3vkPrKDudPHG5CBGndZ1JRznXQ9Vg9p@lists.linux.dev
X-Gm-Message-State: AOJu0YynHROTkgFGrkh/O9+91uBuDXg+C2ubc83kKk9To3ZFZkPB2AlK
	l7Bt2UIkp24lKb43AaG+geFyQJc/xW3G9kGUDdNnndtRlGqjCD6tyiU=
X-Gm-Gg: AZuq6aLOG1kYldMiLvffps6G26oizKkxGTsnjCEpw2k5u8621wKeFsLsIU/P0OGoJMh
	/9+y8Bep9P05kR6vzDKEdnMPSad5+0SDfkaaflCOovyNQ1714wejzTNCXlR2MB+9wW4rhjx1gym
	b41foCnC57fP5DM/RnY9HJbYH1OwWTh7bNAB9hgVeK6ktkUZ4QGuU+ovHfWULyiv76GHP1QnULF
	dSGW5K/NNgOmMdszM6iE4o1kE42ldFg65hxMJVOubUsjZwhJb5X+AKeARmoH2f9emAUx/qZtUEN
	ocQu4JLjrDX60zwIFH5pVpf7NymfCLWtaTjogPmXwdQhwnec8mAKdFf/IzfWSvFT+xzPEJnoc37
	UpxNAzOi2S7qDSSbslqOF/TG+WQS9MA2g3MwRuwmX2tTYzrm5xuFaZhx+9q4/eUoumeFguJ5bMf
	WJ9rWIZEqF8yA=
X-Received: by 2002:a05:6000:3106:b0:432:d9ef:3bf4 with SMTP id ffacd0b85a97d-435f3aafccamr90384f8f.47.1769702240365;
        Thu, 29 Jan 2026 07:57:20 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm15749231f8f.16.2026.01.29.07.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:57:19 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v3 3/5] staging: rtl8723bs: fix spacing around operators
Date: Thu, 29 Jan 2026 16:56:52 +0100
Message-ID: <20260129155654.5565-4-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129155654.5565-1-lukagejak5@gmail.com>
References: <20260129155654.5565-1-lukagejak5@gmail.com>
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

