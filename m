Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6C346784
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364504; cv=none; b=GyZreFzfLYEE1JW1tydsJh9WjIEL/kE3jeO1F50foSHQsL5+YGPz0lZ6x/z7lcVBJQmQKoMuS8rqU1nb7zFMpl/k0sqJaJzJbldXJPmqzoeGH1fL9/7tNGbsaux9fF7tWVQ2Avm7bg9PNfa4y8/wADg23JN3N5FPX+rlx6aZWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364504; c=relaxed/simple;
	bh=avs/LkQJTBZcxxtQXagtM+vy0gJnc1GskdWnWzXA/8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EpeYp+VrJ+EvyTZ1HFXrJCoUDHRc7Sr55IqzUyqMY9vxrvG1y84m3+JPlh8taLNtrMaIv87vecMigZlnVxJpAubww35/TOQCt27n6jgYP/uz5IkUX4fXs49EUhGRXfUV8Zgniy8TDT0szJjvpsLjQY81Oa+acpUmFkktyvhr8MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFyNFPP9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFyNFPP9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359a316d89so1447323f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364502; x=1770969302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZb7b9TnX6HFHKA9/218FV8HKBj0Qnuquqevkx0ZFEg=;
        b=eFyNFPP9Ucl89YnIxf4CU4KH+AzhUm3X9Ee+bbTnRiKDrVHD1uUGJK7jyQEkClz4xq
         /6Z+/jFMxIosURZbAOWUInbaqF9XDtHfKMuRhFANK8kiH1ZxXKILx1//6ewbNGkRVASQ
         F5bMupCdzb9L2wu/scfZVqSWLvFEJvfjbOT4fqZOj1QWKNGc/3OHiJqln+PWzV2Gtqza
         Nr4ITy2ndyd8DaxiyJG3AJMjPd68FPpQUFhckqnJzsOWxC10eU4aZ/YOClNnUpnsXKyz
         8XowDgv3ckEfLw9CB5mqcnDQPUu5pjknVJhGXIteBdHpxo92ew4Nv6cdRqDij+JyGKUu
         CqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364502; x=1770969302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZb7b9TnX6HFHKA9/218FV8HKBj0Qnuquqevkx0ZFEg=;
        b=lk12PPvxlFDO9B4W4ouSXQDOFycGU7ABbwjC1w6+YMGVZopSGvNGIGr1AB71MDURc/
         ZUuMc3fiwRoKuYqSeKEGWlv+XuY4ChBqltF8Nd4y1satEztur8wg/DEJcBnqKXy9TEhQ
         orJlMufH7xxm82fx10NkwKThdXio8Au9cyyE4trwqJzYLs/NC4lmETZbBWfh9Ap3MeTb
         9b9pZgTPFvLaZaFfI/+Fg/iz17oSklSVhKTyC0bsTOEKI3DjpCwrEB2f2a5YP4gIXl33
         mNO/ppRdaKx5zX2rnfnYHrnqrWwpg/49pNQak3P9yzgTiKExdslZaLarnP5CZ6iom4Gd
         chuA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/7bWvnGMk2vD85cIOu5jqDUzIKpBonEi7ksv+yz09Q5lrlbfxRM0CBR//RQFIWRyQInE7jcfUQ4wp8m5@lists.linux.dev
X-Gm-Message-State: AOJu0YwIh10SFu5rw6gmgc3Ecr+2j+b/RVvGUaK9JoqY+eGA/czWF4FK
	pglpRziMO1WuYwJHAICdrMh0F8jf1uYHo5ebbITaMP+PiKzlbiNywLdVOXiSsS8=
X-Gm-Gg: AZuq6aI8nn3+oJg00IZsjYvHswEpMJEz7vNm+I7a2BsoRnz+CBsegp31enfiWzXwXZl
	B27MZzjr83iEbz6sCfK/x9EJjQ27O+zUmTi3TQ4ewuI1QjgFoOrX2udKkg+1KUA8Sl/khTDDBmJ
	F47zZOVbirMleyPb6eAKQ7MV6u+uYaWtIsKbe5yvERKFiDZCai2w5hpjblWJ7AkQgLM3W8DTlW5
	GQVXKFIclr666+57lbyyKwnEeA5nDlInVGAV4XjGiWBctWOX10amwZA1DvvxdXqrDULLhk1KfhX
	121XNuJKwtqYFtF3twpQcgX0Eo4qG2uzEMBxt9XlmpmHoOKAAsTDcmz82zcXmsKOmirH5oeZyBE
	tMWwoOjJpggwmhUgbipiVOQxav+S8jmZc5Zs5NH+Wq/DZs30UaNsjbBfRsGlcveUP0tBQ/u4c4L
	9Gdrv8TtOlgjI4vEIyiVad+iq34uDnyJjkxwwgO10RLvaDU1VeawPYE/JUHZTb4HRj4KW3bMebf
	g==
X-Received: by 2002:a05:6000:2012:b0:435:db6e:e3b2 with SMTP id ffacd0b85a97d-43629242602mr2935962f8f.27.1770364502443;
        Thu, 05 Feb 2026 23:55:02 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:01 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 03/26] staging: rtl8723bs: fix spacing around operators
Date: Fri,  6 Feb 2026 08:54:16 +0100
Message-ID: <20260206075439.103287-4-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Fix coding style issues by adding missing spaces around operators.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 28 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index b2803b33a0f0..61b95f5703c0 100644
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

