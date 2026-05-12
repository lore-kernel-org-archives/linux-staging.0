Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE813905FA
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590719; cv=none; b=gkEaugpaYFXKUu91RuFnRikWjAHzIRhI+CtIuZ3kmYeaeCMurrDUgUduKg3/HW6RMiIhOdorfDx4ZmY7d9m/gU1nd1xxtRtQY0AgRpP3hXOFLi2+PMaduf9O8/idfFByIb1YdtHf65pcBru3ervb7o1SRm8j8feXRQFHpbCwew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590719; c=relaxed/simple;
	bh=t5rEKwc5FOmHnegpWzr7MyYajzg6M9LCPECZJPPsTTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+hQJSHooPYzTUo9QS6tAiTUW1/Rx7PK8mXMSkwUSJWfsgCIKECyAdiqe30fsjmmppeVBuZuy4lKt7vTsdavOAiif13Yf732vGJB6zWIrbt+yhKhlCcUJTTF6G7uNUJ+//YgxJ9mqBcElns6ELlfRVnCV4nNT2Src9MzfnIUghY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJIgN/ax; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJIgN/ax"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so46491571fa.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778590717; x=1779195517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrmxvseFeL0gx6JeTnfDZ4kzqD2z/gfSLYJC59V6TYk=;
        b=oJIgN/axdqYNS64X+N0wnxo2sJVl6+Hh+UBYJnmjJH4JwE6WlUFhf1zi18EW+ENU3L
         qE44VCStISKJCxxDehExwp/UorTq6C/iDryCsiTXKQuQ0+jtgUB8eRx14v88ieKSETnh
         Z2zFCPYidk9ceoDfbJbhxAXZOtw1FfHybMpt+AnxeWt5osIIWu4TJYBhd8o4XNQ9o8Go
         dPbk9v4pwvOrgNW76zHB3aN4rgDFxJeJjp5fo07WlS0wXrHtr78tuD0IQh9D6oSzweHI
         7BpiGt+eXwULLaOiQN0NZM8NtixYmR71drv3yupCbvhHcl6Vh0ifAkeWZ/OFUsT6lwVn
         /n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590717; x=1779195517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TrmxvseFeL0gx6JeTnfDZ4kzqD2z/gfSLYJC59V6TYk=;
        b=ES+zcnjoagHFaLpSp2uV7WZP7qx+znxgtFzVx/fvJzJ7Q3jh7I4ue4Y4wXb/q3gII8
         KiwRdFe/fm9t4JK1zvTRkAS06rN/2T0fpjBl/0VVwbu56dJmGqgm4q/XhNTQYGKRiGGu
         RdKgGljfUIEynIWDhzFNRc5Un9sD4lith89lpxp3ki+cS6FVmks454UHeOL1W5ZbpG+z
         RAx2ZUMjET5/3ASMkHYDy8iy/uxXeNs0T5Q4RngDArEDZq7lgiUVxx9bxU9Lxm3qaxMU
         9i2xsKHMh0TRJQ11P2m274fdCrkxHIUzbtuGXX2wybpRLG2dFCtlDD3m2ZpJMszVB6kU
         hosA==
X-Forwarded-Encrypted: i=1; AFNElJ/+C4avzmBl+UBOV5AyvHxr79GQkPifuaBQTz6dDBjJllAAPnk/ZNlYeI/SVahpFlLa8OpPK0otniRcvbvR@lists.linux.dev
X-Gm-Message-State: AOJu0Yzag8qs+L/bF+2gpOgCVmP4tSYYziJkEOsr7Kk1edcCJKo8TeF4
	c++/2u8YYqXLY+w2Eydxtw5kdVAhumYEJxeSkVR6pE1ONGgELlKaLRN1
X-Gm-Gg: Acq92OFSMUzovA6rXO/Dq1zdtEosZKU+MIuZfnrOvU6ndXyqVdnSzLACQKcFtcCM9rJ
	pYtGCl4agcUeULofOkvqCVZGfurDg5dahv767DQDxzF1sXuWD5VuoiRil7OrT7L0ZYtQdk0WVUx
	WG3kPfiwimA6iZH8rR1JjWS6vjURzj0j/IecDJ7t8eUSsG3lRoXfREflgm9H5PvJC53DTxWtOSc
	IlpK2zzA4T8TfCRsxzkxRNjFV09myVIXB6aHMBdnRCv4Z+OIggZntzwIwdoj9VFdXmpwcHfUs8r
	V6+nxTRAn6zwUESwnp/6JtbCnkolHCOk6koX+SBgiShwb9ozWjFydS4Q4yz8eG7JkV8G+YQbpsN
	LZkZ3hS8L/zTaBWBUmfHoNv1YVpit7MDaZ/9fYDdN1Sb7TYNtSVX4HWZ+oEO6/aKFOFH9P0/sFc
	/ZnqoSL6gvYQfvA90ialOzDNIG
X-Received: by 2002:a05:651c:41c6:b0:394:1c6:6da4 with SMTP id 38308e7fff4ca-39408030aaemr43064181fa.11.1778590716406;
        Tue, 12 May 2026 05:58:36 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6131c08sm34949831fa.30.2026.05.12.05.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:58:36 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: remove unused SysIntrMask from struct hal_com_data
Date: Tue, 12 May 2026 15:55:31 +0300
Message-ID: <20260512125703.6878-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512125703.6878-1-nikolayof23@gmail.com>
References: <20260512125703.6878-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is set to 0 once, and its use becomes optional. Remove it to
clean up dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 4 +---
 drivers/staging/rtl8723bs/include/hal_data.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 5d74913be573..0c0c243c46eb 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -592,8 +592,6 @@ void InitSysInterrupt8723BSdio(struct adapter *adapter)
 	struct hal_com_data *haldata;
 
 	haldata = GET_HAL_DATA(adapter);
-
-	haldata->SysIntrMask = (0);
 }
 
 /*
@@ -616,7 +614,7 @@ void rtw_sdio_enable_interrupt(struct adapter *adapter)
 
 	/*  Update current system IMR settings */
 	tmp = rtw_read32(adapter, REG_HSIMR);
-	rtw_write32(adapter, REG_HSIMR, tmp | haldata->SysIntrMask);
+	rtw_write32(adapter, REG_HSIMR, tmp);
 
 	/*  */
 	/*  <Roger_Notes> There are some C2H CMDs have been sent before system interrupt is enabled, e.g., C2H, CPWM. */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index bc9d8c945f38..d3e5c4039693 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -389,7 +389,6 @@ struct hal_com_data {
 
 	/*  Interrupt related register information. */
 	u32 		SysIntrStatus;
-	u32 		SysIntrMask;
 
 	/* Chip version information */
 	bool chip_normal;	/* true - normal chip, false - test chip */
-- 
2.54.0

