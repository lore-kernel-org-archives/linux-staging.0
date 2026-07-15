Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E8D47DF85
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119872; cv=none; b=LMSDr4jhTCwAQwihtRKwjCBXXb0HwWmWpYvFc+XMVARK1LcloShci0OdxzMNLr7oaEEWHioSzDlUjlZ6W3edyAauTdwGIAkwwdbNS2rg6+xo2oZ+4L8FXFSxuiYr9xRDlxpT/WZ3KewlyeBgHBPi8JDYsgi8GX4r6RnFwn9UDUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119872; c=relaxed/simple;
	bh=pFunXZrBhf7NK4fRGePFDQAQX+8b95iTFBR1q8CfDFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEqlf5D7qlPCPRtNOhhUWoEEC/kG3WRHRJpqr8sXldjQ6hXguwGrp7mYs2MXZqFeY/QuNbahcDbdOk3w2E8FRXMSrg38hlA4UdyKwsKLMXzMqYYbfX65N+SZFyN80g9ZnenesV36LQBpYzrmGDRN0W4blZyvBXBK6lPbvEIyn58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7spqWmj; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7spqWmj"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39dbe684115so1518001fa.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119860; x=1784724660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JETEU48vJ4M9RulsQq/a27kzuvnyM7fUNkUWTEviYM=;
        b=I7spqWmjfY6LzkkIQnvpKADBuvNUQYGqMoRIzxRcxQxtOvkKNkW25xr3PP5i9eVvSF
         Pn7VMxld+HhDnB4bMhsMBCvxzfQW24ufBGWpLo1Ii8bPOmWm86zVaCLU5jxwPmtWHFNY
         Q+v7pme+v76oqI9tILvhQpxTzDBnz+cNpi7Nt6R5eSke2p8P14dCddYHWNpVbkwIFcys
         e1+JXmgVCI0UEwslYU+TCTIOtiJ80AFgjZrgZIDJzUK+huigRQXtr9tC+6AjJI9dz/ob
         FuNlDT/Hs6owuJ8+opZmt4KcZh3Yb2Y8KWjfmSdDQIC8vwNrfq8pHPmR3zpRLyEXsZNT
         DoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119860; x=1784724660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JETEU48vJ4M9RulsQq/a27kzuvnyM7fUNkUWTEviYM=;
        b=SITYSXHZhXFurcklgDBrFBdTsyhzUtawANphT1zXKgPCIUyF/C6/jhehEkKaZD9KX7
         ioWdRVM1CZjlx6cmmYYIcZrART7r0jeJdhkjgxnzeYUdJlnGQedGSh2oyx6HgClkZCkC
         uSFEyth+0IrHxblGtMwEBr0A5xha2Q05ISgmKR/DC60RJKKOKllxfmtIgLBE63nN4MgE
         7++97RyTT5g5C3YTjKvObJNQGoLi33cJ13a6al9tMBP9ZO7TfE+IdHt7hC/BXXXP25Tl
         uUBuIxb4heSWmfSU9TdXP/dZ/KJJmg1R4w/3VpkezSHJHgVXRb1d5LfAFFRFrDHcdhek
         c26Q==
X-Gm-Message-State: AOJu0Yz8HGzy+VTNZTmdO9Jn+tLMtVMzC4iFo1+xZHa6PWsDnR93/Fyr
	nAK3/cl3XJUMcc9ZJdQafxKXhMxe8mF6/Kw1OVTa2R/MTcoVC+31lVn/FoL9WhLzfYY=
X-Gm-Gg: AfdE7cky963RZB+HMoiBx73mxZsqeBkZ3SBxwafWOktOC62k432zeGo5vtwzLpOqlNU
	ZhTgVL2S5EmLaWCD8vPFRqG5UDEGlrqKHHtRwMs/8KEi/xki5nL/mu5eBv0oMBYYJAij8hFgPx3
	TfEkGenvBHLLhZztVb6+tEK08s3ipT22yhz42m5GszfaxW0RRkeWV1fS6seXv5pVy2XILgmOYuX
	eoOoUD/a4LobPEq+HAq9cu7PuRGLXdNGbGfu8/4AQnGYTtXf7WG3/1VLEoa/rKsmApgHq6CTmGD
	Irr0NUOS8ZrEg05IDIKucI5w/TvVX2i8rrqUfTY1YPEscEGUw0gdDbpYzsPZCzZXmkEzp6a7CVL
	Cpkq7ACX5CUEtdxKikx99D3S2LaBWQl/WUNudnyB2K+f1nvRODQ1pJrMmbNV5GjRQCjSYQp/YJp
	9cStjzShWSEuVIFHdoPx5W6BuKeD0Uz+bIdlIiKBD0LcSrRFI/pbmdYjol5otZWEzPOJ0YaYGia
	QWS4OSLsyyixA==
X-Received: by 2002:a05:6512:108a:b0:5ae:b6cf:c745 with SMTP id 2adb3069b0e04-5b02ba1e99cmr3890919e87.17.1784119860154;
        Wed, 15 Jul 2026 05:51:00 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:59 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 53/61] staging: rtl8723bs: inline GetHalDefVar8723BSDIO into helper
Date: Wed, 15 Jul 2026 19:48:21 +0700
Message-ID: <20260715124829.90290-54-ulijg308@gmail.com>
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

Inline the hardware configuration logic from GetHalDefVar8723BSDIO
directly into rtw_hal_get_def_var. This eliminates a redundant
CamelCase layer and cleans up default variable handling for SDIO.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 19 ++++++++++++-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 29 --------------------
 drivers/staging/rtl8723bs/include/hal_intf.h |  1 -
 3 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index e58fc1405..2c50fa5c0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -139,7 +139,24 @@ void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf,
 
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
 {
-	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
+	u8 bResult = _SUCCESS;
+
+	switch (eVariable) {
+	case HAL_DEF_IS_SUPPORT_ANT_DIV:
+		break;
+	case HAL_DEF_CURRENT_ANTENNA:
+		break;
+	case HW_VAR_MAX_RX_AMPDU_FACTOR:
+		/*  Stanley@BB.SD3 suggests 16K can get stable performance */
+		/*  coding by Lucas@20130730 */
+		*(u32 *)pValue = IEEE80211_HT_MAX_AMPDU_16K;
+		break;
+	default:
+		bResult = GetHalDefVar8723B(padapter, eVariable, pValue);
+		break;
+	}
+
+	return bResult;
 }
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0155c523e..395a2b3ee 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1077,32 +1077,3 @@ void rtw_read_adapter_info(struct adapter *padapter)
 
 	_ReadAdapterInfo8723BS(padapter);
 }
-
-
-/*  */
-/*	Description: */
-/*		Query setting of specified variable. */
-/*  */
-u8 GetHalDefVar8723BSDIO(
-	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
-)
-{
-	u8 bResult = _SUCCESS;
-
-	switch (eVariable) {
-	case HAL_DEF_IS_SUPPORT_ANT_DIV:
-		break;
-	case HAL_DEF_CURRENT_ANTENNA:
-		break;
-	case HW_VAR_MAX_RX_AMPDU_FACTOR:
-		/*  Stanley@BB.SD3 suggests 16K can get stable performance */
-		/*  coding by Lucas@20130730 */
-		*(u32 *)pValue = IEEE80211_HT_MAX_AMPDU_16K;
-		break;
-	default:
-		bResult = GetHalDefVar8723B(Adapter, eVariable, pValue);
-		break;
-	}
-
-	return bResult;
-}
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 1d5c0b7bb..206388fc5 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -241,7 +241,6 @@ s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
 s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
-u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
 void Hal_EfusePowerSwitch(struct adapter *padapter, u8 PwrState);
-- 
2.55.0

