Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C8E4C041B
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119881; cv=none; b=rKXfhxv5zCOfnfP/5JFd/oCdzq5fOaWrfed7aJS+AQAgvHNCfBrF+q0S2d/UMVC9TkbHZL1q/jdYFyrIGJEpuLBij0YouD5iJVMsmD0KdF9+lshu9FFKTfxoNUOcLLBVqv4d41Ry9ZMLQju0eA6GaL0RP/0XEmyJcfzI0JjTD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119881; c=relaxed/simple;
	bh=DRRvD86nDK2KcPwI5kJpJWsUlfUIah8s81TRQPIYBJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfO7q7yonJ1x+e2kaOQz1m+9X5kAj9kV1m0ite5eLcmnVl+v5TWQ3ptMr+tpYVTMhhE2WNXegqxU6rUE+SZ0PYWMygumXOtKyJZkCuP6vY2bupoYBIEUObS0L95NgQul2g+3SAELp6nCCfc2opN2Tm2g/6LND7lR5APZOCO7guU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bG3pK8Js; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bG3pK8Js"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b015b2d792so6327523e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119862; x=1784724662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvmASoz7rlm7VTOG5ZuhTdo5rXKqhp7vpcYKWZMpB7E=;
        b=bG3pK8JsdKWYKAxSaGMvOSTZ2fEcvEKItFkJ9tt+KOP1Fi9dY/XMJHp+QqVUAg2neI
         6r6kMT7sTGqQAyyz9PLIoafymZOUYI6eEezmipmEgRQIIOFsGJLTSzbxfZOYVMFx6X4y
         MXXh0wdIJAsOhhccF1pyLY4ZwdySEMCFXnzxdU4KNA8raZGrfKhdmm/f48W3c9MYkQDR
         d96IynFufKV1TJiyyVVXsYGonLdBW5Wh3oFhGHfaOl54h3oN5w6nqCRJlj9D4rx59ior
         H9TBQMRf8RowCNBLm4fdTu2ilvPtIpCaz048pf86L/5IW7Rr6c3Mhg3yzalxOfJHc+Ut
         T3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119862; x=1784724662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvmASoz7rlm7VTOG5ZuhTdo5rXKqhp7vpcYKWZMpB7E=;
        b=bn6DdcsT1v+hawgyF4X5yvjUa0438FhCAd8oBhS01kMThVPSe3CbOO/vsK+0iUq24p
         fP09eXqX1jcCyG5nds9aWJJYBH+YcOSA9CEUzfFpc1qDE4BwsLbEgLqijzzRtetQLYNI
         0CaPaWooq5989T2tmIUa90qiYSWUvVlQJ1pbXEGAICuXImLmqQCQEdghcYRhtgI1EpHq
         W3wew1vEM1Ck6pY0oJE2yosWlWj3ladgRCxgzE54vusQFFSLsRVeRDmME/yN0S0ND3oI
         CiOcMQyA28CyxHjw79ur/GtgT/DPrDjlUDiaf9XsxDQ0fPSei6YNaEqaUyG/alVcidQS
         2tJw==
X-Gm-Message-State: AOJu0YzgQ4DFvoh6EMzkNwuZ3Ng72vnO8kY5AdLGtGtD6FXYHEsVxGfv
	i+0hZvSDBSBnbo2k2e4XI7a+FHYs0xtMLn2AbukwYg4jwfTI/OvwpFq3
X-Gm-Gg: AfdE7ckRc3dcnJud8P8Q4ATw1A2wgNrA9MlzJ8kYSdXy7uwr7B6vRF7uMzRJtXHhLVb
	+g7Sf8gd9dyZPfd17BD37BNtExGRlDdBT9cUrdLSNiCaNd/JuGCletjEaCV7HXHQPWFpLzFHlp4
	k9joK25LFBYU0zBh0b5bFFrJ170ZfpAvXn/CqTkX2HJXI8xDb8g8HcQCjVJ3MJAQWgDoyaRYW5I
	qeS0PvegNFmVRce8W6aFTYwjnJwo6e/3+0ws5RsUsHTJGtC/sSvcaEPTvxw33BMUnoUghXA48KI
	dnwJV1E8ORv6yljWWHlh7DgSja92ojshIku8ebjVK4iDQyPHinorFf3smQM3u7rrKEp/iPhq+jO
	iFa/CC/IDTgHqe29Qgr4Wk03cafVXlkeUDPw9QOZ3gMYSaWxdER83Eb28Bcau0AEuuwgV+INI9q
	4/Iz+7PmaOOVN+emvPHZPJbQWJ/uizirEUGx1MiDndRdyfOVAy6gSDHDH4C3dfWRwWR0Vq0rG42
	G4ubmdyM/1Nd1YUhmX7Kdzq
X-Received: by 2002:a05:6512:39c7:b0:5b0:11cc:2284 with SMTP id 2adb3069b0e04-5b159b7255dmr1549433e87.21.1784119861898;
        Wed, 15 Jul 2026 05:51:01 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:01 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 55/61] staging: rtl8723bs: inline CheckIPSStatus logic with defines
Date: Wed, 15 Jul 2026 19:48:23 +0700
Message-ID: <20260715124829.90290-56-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline CheckIPSStatus logic directly into rtw_hal_check_ips_status.
Replace the 0x100 register and 0xEA magic number with self-documenting
defines: REG_FW_PWR_STATUS and FW_PWR_STATUS_IPS_DONE.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     |  2 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 16 ----------------
 drivers/staging/rtl8723bs/include/sdio_ops.h |  4 +++-
 3 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d2e310115..a73abd36f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -197,7 +197,7 @@ void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariab
 
 u8 rtw_hal_check_ips_status(struct adapter *padapter)
 {
-	return CheckIPSStatus(padapter);
+	return rtw_read8(padapter, REG_FW_PWR_STATUS) == FW_PWR_STATUS_IPS_DONE;
 }
 
 int rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c4058cfe7..dced13d2f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -620,22 +620,6 @@ void rtw_sdio_disable_interrupt(struct adapter *adapter)
 	sdio_local_write(adapter, SDIO_REG_HIMR, 4, (u8 *)&himr);
 }
 
-/*  */
-/*	Description: */
-/*		Using 0x100 to check the power status of FW. */
-/*  */
-/*	Assumption: */
-/*		Using SDIO Local register ONLY for configuration. */
-/*  */
-/*	Created by Isaac, 2013.09.10. */
-/*  */
-u8 CheckIPSStatus(struct adapter *adapter)
-{
-	if (rtw_read8(adapter, 0x100) == 0xEA)
-		return true;
-	else
-		return false;
-}
 
 static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 {
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 252b0e164..b5d426c99 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -23,7 +23,9 @@ u32 _sdio_read32(struct adapter *padapter, u32 addr);
 s32 _sdio_write32(struct adapter *padapter, u32 addr, u32 val);
 
 extern void sd_int_hdl(struct adapter *padapter);
-extern u8 CheckIPSStatus(struct adapter *padapter);
+
+#define REG_FW_PWR_STATUS 0x100
+#define FW_PWR_STATUS_IPS_DONE 0xEA
 
 extern void InitInterrupt8723BSdio(struct adapter *padapter);
 void rtw_sdio_enable_interrupt(struct adapter *padapter);
-- 
2.55.0

