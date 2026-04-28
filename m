Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFAE37CD33
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367901; cv=none; b=pvTmYU4/HanKFH5PLe9ECbC/wGBESqaHAUVtAVuCy+dJ5gVZK4IxatWGMT6hrZRyDctmJYzKtd0o2GasTW1I7zsq87/+SlkYFmS9mBQQNHQHziUG99TsQSuE143NxTVXe5JYYHCWvmero6npAzjw7w81pg451SviauXy3V/9/wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367901; c=relaxed/simple;
	bh=oHlhoX2XD37ttuQs+I+7ABrsXNk0vNHMk8q0WeMaVsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aa0CCRb+fyl1hj101EZbMBSAHprbMPb1C4NVCZtP3R/uvbHg1GJ7DV8mmjhmOlJdTioHoZMEgjQSqc9KmwPIaazuTDZGgwRsLwskjcbgqb2xL7Z1uDdSWUKzP2UuJGd3P3kcaFiDGuPbR2gqaIfifwZObzMikM7Bv+r0+e9NG8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9LpSqTv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9LpSqTv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-445795cf6f1so924344f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367898; x=1777972698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7DB7L+MoopCfaj05ayyoXdqOZG6gM4ZReiwvIg30wk=;
        b=a9LpSqTv7jtoMyupOtG9az3lPx3A/SK9XhzEjuQj5lUEGd5CJfaYxcGfdxRi8L9gnR
         X1+aTF0VHEDX77p+3u1PlbSnaHOjQ+dRT/9cXjLZls112UouWVg84se50cp5Gt5AQSZn
         jagtffB+T/2HoHYEia3z9bZ6XyvuA8TiI/llPdbrAlA9IiD4zfOzv6BdEkZhr09iK8rs
         yj1tNlHNMIurWBKn57ozPeveBRD6qmm0nKQq6lm8BK4Iip5gi1k3CuIVZcAVxkTmyEHT
         Qak4Vk4XcjeOLj8RTB32Q5y/zxP5U8pVTSCv5sV6BKYW4CVMoKVV4hPo6aiisAsB2Na4
         Tqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367898; x=1777972698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L7DB7L+MoopCfaj05ayyoXdqOZG6gM4ZReiwvIg30wk=;
        b=DV5C0mV6BeSx5JrSRlRYf6+dZIc6vBdCiPuv27/o1HZWRSuuMTY1grpSnWPgW+1rIa
         ZOuwk6LNU73WXJU0kLID6HRvNQhdx+wUrjzvWu0gedMzNZ0QjwyLuCbeUlXA/qaGKeTX
         8zus1H56INMN/U1r5eZ4lh30dQj2ppzfnwKydAsW2aBs8d/sxUJNVwo3I62q04ToReq0
         FG6jL1AQqPlsd9TibO2nxkUwH/PRynKowEEmba5P9C2+7Zfys+EviCqHz2fXcGmyOWA3
         Mba1wIZo3KuXMktJgJpSiFpnGUpkMrfyFMQIheUb7uRk3sUADUpzomN7lDUQflDFhxV1
         HiXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YYVNnzcYBfXNgJ4Ya+LJi+/xwDbkc85H7nNdPI0BIEOzCQE6mgJBikamifrSjXqjs5i7aiCOzxW0zQikZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxqiRJi4Ys0kAcXTr2hNzZRKQOwxc3xJJQoKTVWENmxhclPUwZT
	bmiO438oHrG3qZsD4vrZ1UU/sHrQXqZtobKnSdQO+F6cj48ze3wAED4B
X-Gm-Gg: AeBDieumLhSpKkz3bK9lSngGlpF5yu0vwoZSMj0+2Hre5tj5I05DicHoOsywxaY4UpH
	4g06rk07WuX33cJv3pwf5UuAnEXAI/CsulYWJYnEfyMhkbQqKgCKml92HJpSRu8AoCMb+FB8TlL
	uc3LYZsqPA6SVVz88/nuhuC/vAiHaQVVycJPnjiX8DXS8JJmjBVk6nwfTxsGD2WZWtUDM3NfMHw
	Vjx2xv1Rdc2bJnFet+h+I4rSfEVmywQc3d9eXnX9baMbhr/J9ZLMLg9L5NO6m6V+QX7I5FpxEWc
	oh2/spAtHQCyidDgWTlt5Cfdpk1v1njFhlHZVDjWQA3gmq65leR39ZsIvpMMfEtauL1DWv8Aeuz
	dl+YewypsHeJIrFBWegAsS+YDT8TiQp+fQKUKLXZX7yzGJmlZdRgeD8FkREBxA9mL7VLAcRyU8H
	rjkJqeHlZpwSFYG+4u5BpPUrJuRObZeg0L0yW7R+SdTz+FuDVPGeP4RXx2T4tzvzs1/NGePyjvT
	4icJJU0SBrsPknkGNaMpWRFJG8wlfTT7L04pMzi9jomuBz18P3rX5wnIFYVMX+Z1lzPAxwH8UtE
	K7lV4w==
X-Received: by 2002:a05:6000:18a4:b0:43d:7e11:1b72 with SMTP id ffacd0b85a97d-44648f28e43mr4198132f8f.9.1777367897958;
        Tue, 28 Apr 2026 02:18:17 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f6a1sm4902502f8f.13.2026.04.28.02.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:18:17 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hossu.alexandru@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Tue, 28 Apr 2026 11:16:20 +0200
Message-ID: <20260428091621.739680-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428091621.739680-1-hossu.alexandru@gmail.com>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HT_caps_handler() iterates pIE->length bytes and writes into
HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
HT_caps_element). Because pIE->length is a raw u8 from an over-the-air
802.11 AssocResponse frame and is never validated, a malicious AP can
set it up to 255, causing up to 229 bytes of out-of-bounds writes into
adjacent fields of struct mlme_ext_info.

Truncate the iteration count to the size of HT_caps.u.HT_cap using
umin() so that data from a longer-than-expected IE is silently ignored
rather than written out of bounds, preserving interoperability with APs
that pad the element. An early return on oversized IEs was considered
but rejected: it would bypass the pmlmeinfo->HT_caps_enable = 1
assignment that precedes the loop, silently disabling HT mode for APs
that append extra bytes to the HT Capabilities IE.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v3:
- Use umin() instead of min_t() (Dan Carpenter)
- Keep truncation approach; early return would bypass
  HT_caps_enable = 1, disabling HT mode for vendor-padded IEs
  (Luka Gejak, AI review)
- Expand commit message to document the early return tradeoff
- Add changelog

AI review (flagged early return as regression-inducing):
  https://sashiko.dev/#/patchset/2026041408-grill-mahogany-d1e3%40gregkh
Greg KH v1 reply (requested truncation over early return):
  https://lore.kernel.org/linux-staging/2026042630-tightness-runner-2121@gregkh/

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index e0d73c267786..dd34f229df12 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -936,7 +936,8 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 
 	pmlmeinfo->HT_caps_enable = 1;
 
-	for (i = 0; i < (pIE->length); i++) {
+	for (i = 0; i < umin(pIE->length,
+			     sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {
 		if (i != 2) {
 			/* Commented by Albert 2010/07/12 */
 			/* Got the endian issue here. */
-- 
2.53.0

