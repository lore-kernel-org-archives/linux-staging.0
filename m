Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEB433E37C
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658424; cv=none; b=qDBc3WdXzrnVKt+TTR2Bc2+s03e1e87kLV+L6KSIO79JWY1/Oe9g/WJxPP7/8fz0vHkNmgoR+dqEvOOpQICTeWCMj2EJDZzauJ9igSP6B8/3NOcYMqZbM0K3cl4jMIxLyGoc1bpTZCnngy5OMilWiUf3G80946eQrTXArRNiWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658424; c=relaxed/simple;
	bh=AKsrb9reMqayE3+M6QvszfLHFWENAKJvFLOXWK4Lcsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A/B3ODiY+MoHFhAH4n+h1sRuXQdUw9Z67QpbV5aUVWEQOh5djUoVVoIMLFBVq3HTtcurK/xlXYHA3URQjvI3liz9+XKs1yVBjJuchGOGTc+XetJFVT+F9+oAqZ+GpT3PdKmgSmusEViD7Xm7tpurs/O/IkWuFXI935ULfyqEu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGkG9A7u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGkG9A7u"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so2539685e9.1
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 11:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777658419; x=1778263219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=47r2CcFd0KEOVlKTiiU13c8KHdLeN9Nb2wH/sUyIwFg=;
        b=tGkG9A7uC+stlRsdR/vhKnsn4wNxwAPTShLT4lH5O4Afds9aTyir+cWTxm7Oxy6tSX
         PcjV/BbV/7IwhWGo9RLJZWCM8OGdiPwVgC8arLAPK/0J890wEYVfHrYkJUCjXcfF2DdA
         cVmX2L/MgM03eux1gWUXDSv7w4Llf9csS7NRfm4Ub0rxRpRM1/ER/3yGFBNRNjYzwEl9
         agYtJny8xq5I2bggNu6tY2xYUo0gPfNf1bTRd1uYBg3ljzmT4WuBCgOAfhAwLDKSQbuN
         Qj80OQPPO/k5x7LTxKGHxWI1qyT6bTmyX7KpXUBpPbb6SRqGyC6Nmi0QlL4lAcG0JIML
         qdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658419; x=1778263219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47r2CcFd0KEOVlKTiiU13c8KHdLeN9Nb2wH/sUyIwFg=;
        b=b9VZU11lAZRiipEsUW+sYdTExszboSYL44IaAoBh2SqgKTH5xnIkJcgjDdkk6mtDRE
         8/FH5zqbbmh2F9tCe5DcMrX5aNIWxQoUslEzMoezZw+XSYHsVG2qnNNHcb+KCq2tY7Em
         KMrXn4+OTBQtloLmUfgw0k+qEFJ3UhHlKYXnnhac+A4Kdp0dDMBlh7vcYDOUh8p9TEYs
         ePcVherXE9//dgzCMLwdtORD7eq84MEyZWPl3dDoMNpViL1OHEBTAEJjRSMtEhjIIF09
         LIpKBIbQvJmxldluslXFUthzIkuc0DiWcy4+WHETkEH4JYX57+YdjDn+jc/z5dyuZwUa
         kKbw==
X-Gm-Message-State: AOJu0Yxa+ZDUkrWbLd3LpXQeevAygbYDXoh9Nxe9F8bxIVcQ3WeorME6
	v9G9KF71P9HjqLuiPJHD/uYC3fdnlpgMkHT5UUt5XEMR8zs+uml8uteI
X-Gm-Gg: AeBDieuDPUM1hsqCtbx1nlFEyhtXA0uN3KsCFHHsTIELNFvzKa1rohjKXiBi5Y8r5DR
	5ZwgYkZ9eaXvk1aQuddC2CxIf2Rn9O8/qjpvd/7FRz4xSG7NOMiE4ojNluTAYKadbKVAv8029rV
	vyHNUuKfB//UhlBjgtThAGJ/Yy/uv2r8nUgiaOTvgsTIF7w0m4fQMKVoVuzrjHLLE6yKuBw0/wV
	k2nkrjyiMpeptT8aW+5j+6VQ03JLLSAJGlTwBoDZBpscdAtMmA9IZirUalKHpGub4UFUn48EnwM
	QDq9F4YH+t9i0wTrGMfJIJwsOP5SVbt7Czr9mt7GZxqLikUfnWKk0SkkJzAnUCOf1IW5JzAGYbP
	RvvylE+oB1veJo3sT4YfI3BdpB8FzTxIEIXjHTbnbYa0Y41MH5l6MzXqOvBln435Bsj4WfbYi5q
	bZz+AmoawhDjIiE3EzpODpDzbc2S7SWiyA3TDYtwajSTwwr0iZ0TEpbDM=
X-Received: by 2002:a05:600c:444c:b0:489:e696:127d with SMTP id 5b1f17b1804b1-48a9866a67dmr1128075e9.5.1777658419232;
        Fri, 01 May 2026 11:00:19 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee8751sm30745275e9.9.2026.05.01.11.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:00:18 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] staging: rtl8723bs: drop duplicate blank lines in core files
Date: Fri,  1 May 2026 21:59:17 +0500
Message-Id: <20260501165917.1504-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant blank lines flagged by checkpatch.pl in three core
source files of the rtl8723bs driver:

  rtw_btcoex.c:    multiple blank lines
  rtw_efuse.c:     multiple blank lines
  rtw_ieee80211.c: blank line before a close brace

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c    | 1 -
 drivers/staging/rtl8723bs/core/rtw_efuse.c     | 1 -
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f..27dfd00b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -65,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4e..0cd7ce242 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -232,7 +232,6 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
 } /*  EFUSE_ShadowMapUpdate */
 
-
 /*-----------------------------------------------------------------------------
  * Function:	EFUSE_ShadowRead
  *
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731d..5fb1fe5b7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -593,7 +593,6 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 			if (wapi_len)
 				*wapi_len = in_ie[cnt + 1] + 2;
-
 		}
 
 		cnt += in_ie[cnt + 1] + 2;   /* get next */
-- 
2.33.0.windows.2

