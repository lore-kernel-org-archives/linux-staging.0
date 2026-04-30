Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AB22D792
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570248; cv=none; b=PAUSv6ndQUb16ovLvbS7yxD6GWomd/rmtGxvpxdUs5PWTC0zCD2xHnXx1q0catyyjTitruxjLHhS7Vm6q5D7pYbjvfMwrUhiCDnJR3SXObPFCO/Y8xk3ZVyyK1RdSYLjMHXCCYShrpVvXnyPt8etfTlPkOOwfX2hgZ6f9llRguA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570248; c=relaxed/simple;
	bh=o1xZtaDSR6B6f03YKOuYN5oCqBBY4EitVJ4jpLbAWmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ovwr9KxTJUKe93UY8xQbDOf7efcKvl3QPwBwDfCZqZhVYDzX7Qgf1qXmUCR5ICywZnhh8VWo3mwmTPmzIBSycZRiFxcBLD6t1CeEURjjNvakYUHHCXDU2hvi2IOfVehG2X9Sh6q258tl+YnK9M2gwDMDsQ92iDZJYEKGn9bgKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0OGFB5l; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0OGFB5l"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a2ee65171so12746957b3.2
        for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777570246; x=1778175046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmbqJDBS2q3vgjtM9bFrS91WMDPK+PsKysL2idKrfGU=;
        b=l0OGFB5lDDU60lQlUq1REqrfUMFCIFsoi9SaLNCeQDC5OpVccXPEm13TT4YSskmnIx
         Esejj61jJCrUD5oTi+CVU3xXhrzaD210XJc1lxIqlivfQkID+rdZUmpL0dvQYKAfuKzI
         sJY9s2YwV03vXQvlzsZc+VtYzghZYRs7B1OfLNgGMr5tinSz8dTRWUxj/g94xMEoVglL
         s9+ftS8mIM5WOEWMKwxjny7B5HtOxjUZpcIqnF4wM3qrI/Ojt7vwcL3Obb+ONWNvb5AL
         CaDTIajyJw2WccW6kziiHmZT2onfgE71RbYlkU37iMS7bCH+DUazXZ/VPZHyGEeCHhiO
         k/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570246; x=1778175046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmbqJDBS2q3vgjtM9bFrS91WMDPK+PsKysL2idKrfGU=;
        b=ECMGZtnBG2frjvAL3cFw+rVvSYZoYsN4ct9Ds4j6Ax/9uLt/kCavse6gVsZ3wiKDFz
         Z8GrA62HNSHIcw00ttL/F7meVxdk0YLr+5rbbznfCM8HtNVcucyNBQVtzaaKNiDAb7SM
         Vyu/oLqc8sYEIDW865T6aHxsze7oCPlootve5vhZAxSUsw7z/5dRBQLgmLZoEUNz7aYQ
         e/wXB0IK8aeq4VCcZcNPAa2MNyE7SnYfWiJBCJxSO278hJQgLwnDpvZ3uOJkSS9Mg2bI
         wAFZs+wTMEPLSs0W//XCSNzEJjtHEYq/cuUPNielYDoeyhZRk3Smj8575C6+OJoedHh+
         U/Tw==
X-Gm-Message-State: AOJu0YwlZbz8tOZTyUoMnhdiii8wQu2QeFTVk6F0g8L+ZzkDkjGP51Rl
	rz21Bo5sV6AftqC2r1fLPKU0hbO5eOT+HBEZTfAav5XWuf/F6IvG6mtC
X-Gm-Gg: AeBDieuoaDR9TpZuEMsycQvX9TRfFJQQHGmv+goeN8yC6Rs4851Cg3AC5nET4AfSkYj
	fUIfwtyq7jYvNAYzxnfpoMVvH+b+3qoKaOfa3YNwEsjHPrmTd890dSGCo9BphiCVCyyPKY3TBAv
	PUXWVgK2C2odna+oS7l5M8EgwoTyu48ZdJIqGut0zx/MnSXML53BN1sXMkE0zYs2z+x8+PJ+S2L
	/UI1XxPrF+L9vIKbA3qrrEUjgv9Lyapq51Wd8h/Yw1XKKyKbBvI9A48uXH2w+6Moh+kxV/zXto4
	cJsd6aNSWT3OWQUai5beRtrQgWJrt2Im/odWhJ29hfzL8fDg07rGTmYgrNfGWAmtChNB+mETSJ3
	Q9HBDsB0Jyf0IUygzt2DZyTs9G2dId2gW41viEF8hTvaJ4/cFEc7StamXimZt8w3Dajz7DwNLGk
	c2xXpXjEyX1vYK+9Ewh+2uOqjHAL3uv2x2tBWk/pjA/JQ2fg==
X-Received: by 2002:a05:690c:67c8:b0:7ba:99bb:d4e7 with SMTP id 00721157ae682-7bd52825bf6mr41369737b3.8.1777570246079;
        Thu, 30 Apr 2026 10:30:46 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd665298b4sm232837b3.7.2026.04.30.10.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:30:45 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove wrapper rtw_hal_disable_interrupt()
Date: Thu, 30 Apr 2026 20:29:05 +0300
Message-ID: <20260430172954.12828-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430172954.12828-1-nikolayof23@gmail.com>
References: <20260430172954.12828-1-nikolayof23@gmail.com>
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

Changes in v2:
	- rebase on staging-next

 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++---
 4 files changed, 3 insertions(+), 11 deletions(-)

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
index b80f1d03ed5a..9270daa018b9 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1141,7 +1141,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 		if (ret)
 			goto exit;
 	}
-	rtw_hal_disable_interrupt(padapter);
+	DisableInterrupt8723BSdio(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
 	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
 		ret = -1;
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 97a1e0da3034..387c5165428c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -211,8 +211,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	if (!padapter)
 		return;
 
-	/*  hal dep */
-	rtw_hal_disable_interrupt(padapter);
+	DisableInterrupt8723BSdio(padapter);
 }
 
 
@@ -281,7 +280,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/*  set mac addr */
 	rtw_macaddr_cfg(&psdio->func->dev, padapter->eeprompriv.mac_addr);
 
-	rtw_hal_disable_interrupt(padapter);
+	DisableInterrupt8723BSdio(padapter);
 
 	status = _SUCCESS;
 
-- 
2.54.0

