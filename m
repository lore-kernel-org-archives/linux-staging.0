Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A91E8320
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583343; cv=none; b=OrtbJ68Ph4N0HsTo8YuA5SH0QPW9Ao57vjZkV8tbnhoatVh0WFZpr43+VNtyk3t68cBZyTUwY83jHVUuxKIzfY3lff+S8uPgMcXLJFJ3XtGRyqVPnZnvxumSbzc/DDdyfI3rJrurcAbQHClslhJMU+xZuRs7QEfccL4mepWwk6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583343; c=relaxed/simple;
	bh=s3J+30I4GAevp1aIvilEU85RKWf3kQX/gP5L40ZBnmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehhhFGjR7v+rLcuDY5uWfyoNggYgcGhlDRMX0z4+JGgd3fCbvuPx8/uJl7U/SeTZUOH4xfsp0EdB/uThF91oHnPEh3V6t4TCviXzacOGzilMAygc810jKL+7sbiGEVXyLNFhuLtMBtxiYzyiaOa0bc8OusTllDJQGxYeb/HjRNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsTo/Wzf; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsTo/Wzf"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-651cfaa21e6so1903941d50.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583341; x=1777188141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CteVbrUSm+baltltdNZt7QgYL6kWFB0r/R7H+SF/qLI=;
        b=bsTo/Wzf1lJulpCiA6JxXsTv6xa6hJ+iuZ3m4MzyXr1piICYUja835n4EJAmRhLgV7
         wRsDAh72FerCol+ok2Oum7iQ5KMJqy2xcWR/1/vbTWg4hsh0zcaMB8RZw/FhEj0l07bF
         msvEm73jpbOxYhZmBcsBznkAWtb8BGoAjYhwJ3LQb8m+gEo29LqJG39ujmb660Hw6EG/
         9IZC2xC13iHpf3T15ybCDu+tRRt9/sUJokuB4z8EMhSf5TjQBOV/wZs4fQWLw5MzX24u
         800erBp3V664PZ2NSkyoXz841K4QgizWCb+fanU+u4m2bCDAHqJ1TNBT6IRwwDFi5qSe
         aDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583341; x=1777188141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CteVbrUSm+baltltdNZt7QgYL6kWFB0r/R7H+SF/qLI=;
        b=AYHFXDNKx1Dl6YMjhTwTMN7sFGUvxwzNSE2m/Hy08uklEqtnb373FsoE/bHSHFqUBb
         KfjV4hQlM7HrGAZVIeRUigH2onx2R7LqYGDlQdv02GSB9nwjc1RksA4IkYE7BzXVNBAl
         +yLYcrLAvJJJ9B8jDW/jqGrk5LiriDRWKjpIfDy3YOYzR7onWAqqPUUqoZIfx8XqVGLn
         DzIzdLC6LJdsnsOx40jTYHpFvNbDL7I/Krb+uLg7epv8gJ0vJtRWU42knUnLwCzeXvns
         HefqZzfAhCtZ5cCi/V5jAY0+70I35X3ll2ByRQfHOHAbuS7mZKxSjpPq3ziJ5gm89jVU
         XQUA==
X-Gm-Message-State: AOJu0YxQFNGHnk9pqv8P2rugdk/NsL/SAu+7PT2RRjeCKEshK5GXBLAu
	UpyNfDYE5WzBjpCEKI6KMchWvpcg1FwWqpA0teR36Eo4NbxU6ju49dFL
X-Gm-Gg: AeBDieuk4dsnTYtMw7sMCnBdYNxwymf+Hq1uH6hJf895jvPLH3AK/IjeVemuYS5Ywsv
	1qCCh0uS4ikR5beeCDxKAyMtpjP3jggX1HHxQomHWHrDRnumcrS57ZuJ+wOzZH3lpWp0dwo4f7a
	BTuelNC9Cr0iLbw0BaNvCad2pLpPegTXDTRUTZgkzFgdZm+xde4J1vVyZDTG/mIJ1jj/evdpiJm
	j6nTdMHOuTJB0AKcfWw5TYsJybbJUPYd0ftao70xd5wHAk7yyf9pttBiH6vrhBiMnmqYheCImSI
	QsVHV9jK8o+JyOAj/GRYldhhDslDGRF8nr0MM06s4KKtmuwGb5Ym2+NIeH61ioL70MkPiwMXGFg
	uU005BDu5dfM1jgVORgGpXkSJxRAPyf+sVVHhU/7p7cPNSHF9w4QRgW4kRbc8XUaEROLe7WwPFH
	bhUQ/n0oY11UgirRyDXddJj73TjF8iPURaPFywU9Kg6USgDQ==
X-Received: by 2002:a05:690e:14c3:b0:651:d4ee:8e4 with SMTP id 956f58d0204a3-653118e134fmr6023528d50.8.1776583341459;
        Sun, 19 Apr 2026 00:22:21 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:22:20 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 08/11] staging: rtl8723bs: remove wrapper rtw_hal_disable_interrupt()
Date: Sun, 19 Apr 2026 10:19:34 +0300
Message-ID: <20260419072034.19824-9-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419072034.19824-1-nikolayof23@gmail.com>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary wrapper and call DisableInterrupt8723BSdio() function
directly to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++---
 5 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 529648036f58..f75b8a8192b8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -94,11 +94,6 @@ void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariab
 	SetHalODMVar(padapter, eVariable, pValue1, bSet);
 }
 
-void rtw_hal_disable_interrupt(struct adapter *padapter)
-{
-	DisableInterrupt8723BSdio(padapter);
-}
-
 u8 rtw_hal_check_ips_status(struct adapter *padapter)
 {
 	return CheckIPSStatus(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..20632a28d818 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -640,9 +640,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		return _SUCCESS;
 	}
 
-	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
-
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
 		return _FAIL;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 6af2337822ff..1d62ea71a890 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -193,8 +193,6 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-void rtw_hal_disable_interrupt(struct adapter *padapter);
-
 u8 rtw_hal_check_ips_status(struct adapter *padapter);
 
 s32	rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 0467c87619ca..f9995e02485e 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1140,7 +1140,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 		if (ret)
 			goto exit;
 	}
-	rtw_hal_disable_interrupt(padapter);
+	DisableInterrupt8723BSdio(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
 	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
 		ret = -1;
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 2e573a0a255e..0574258a0cec 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -212,8 +212,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	if (!padapter)
 		return;
 
-	/*  hal dep */
-	rtw_hal_disable_interrupt(padapter);
+	DisableInterrupt8723BSdio(padapter);
 }
 
 
@@ -282,7 +281,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/*  set mac addr */
 	rtw_macaddr_cfg(&psdio->func->dev, padapter->eeprompriv.mac_addr);
 
-	rtw_hal_disable_interrupt(padapter);
+	DisableInterrupt8723BSdio(padapter);
 
 	status = _SUCCESS;
 
-- 
2.53.0

