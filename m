Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A516C47DF9B
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119829; cv=none; b=CP681pBXtQNVQc03+0039UWN0LxkIksj7PdVjcu12oVA7kZMIAsaqzXOAqfSuGwIjnw+c3XZKLpIitUwjJ9UH9BQu+voMeRJDv2mwUkIZdhLdAdVQu5bI7CMxJ371kaFogqyZXsI3DdH7brNxAGj76ivrHQ85pWY5ehlLit6zro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119829; c=relaxed/simple;
	bh=72E/hbanqpvo/ZErEhhCXMKRkmfLzb82Zf7mXsXYBnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKuG7wwszPfA6RS5otX73R7vvHXvVuSM5OWi7CSKgjigIHPn9vKoLKwU8UhLSRNgwL/UP3z0zqB7ti8ZZf9vCldV+bkwz/2GfGrLP84fU3rkQJpoOmK0hiJV/XPCYYUC6zlhFDO5k7zhSLA6z+1i5QxGOfZEkWbpmG0yqIyZaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdWzLb2m; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdWzLb2m"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebd52488cso5790696e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119825; x=1784724625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utdjDfJg9k64qknof9MWQ7zmlARBSSUnC6hD0kTqV/Y=;
        b=FdWzLb2mr/Xp+C2ljwrfcZKbxBZxv6jB0vkZuQRjc80Fk+GTgcTWMDSMKpLQSl9p3D
         /qY6Nq5nrxQDtKmLeomdn76BG8aRH3CjYs2FWM2hj9VwNT0kL8lw53sYlX+ZhXHGGhM7
         ShItSwR7uARJCgNaM9iScMmNkpcXBY3g518RGRSg5hEp2CqMHbHufFWgrABg76FR5ual
         xzTqsE+w+CFepfrmdEvV14o3W7BTGRhwlH+B0xoxl6vMC6XCuca/PKvN05N0DDJ2Bq2F
         w5es5vKIi7xVS2mjuXVaySv1gRUN8VJCC5R3mfu8wWlzyF80BlyvD8J3QW3vs29QXZJy
         Qdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119825; x=1784724625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=utdjDfJg9k64qknof9MWQ7zmlARBSSUnC6hD0kTqV/Y=;
        b=rPs5LAXpLowxLdv2dGoZdD7y18/7joYREnxP3EZ/X3TCDHoh2Xia7vyMDF08trtvA6
         mUm6oQihbYEJEZ5k8yB0MZwR25hWytXiHuc27AewcZ+kVXNiOj87+xWwUo2GRAC+B7YF
         nZ9P2e2Fu7myfkuqraUtd+Z8XXKZ44/s+SHJ0f3RJ0Ftf0RjQX2gNb8MEFiAmJjJ6HtM
         KIz5KB/YhpR0dpvPvhQIQ6z8X3JhQx1xMaf/DBvggXWO+cgqkaV+b/n8NZBmQvM1KdYm
         Jeul/zqpAnlTFu82p0vEhwZ7SMeRqGsbs1rPtMRoqr+aEb0FZ72oA8XOZ6aj5Ky34EsV
         2oNA==
X-Gm-Message-State: AOJu0YyJWxXNokQ1VyCCaOkLrLcZssaBaq2Z0yi3lrrR2EApPcfGEn50
	ZzST7WpSYapgNVP10+IJBXlPRdLAVKHU+W8Zjjh5wDsB31TRLPHENTN4
X-Gm-Gg: AfdE7clVuBNZK1JmNLGQmInqfJ4TGdcAuWlbR8ocI4RCzJkMItlG48VIXKkF/2Z4QPu
	AoyOHTPfOpCEN13IfIBY3bcGV8hmECM0SM/S8ZPeWGkgNfHaqzLlk33Mq+iJtHOBflkEeCQZlvG
	wFf8BnTkEpBvzsMN2Uoi66YzdOGxjiwr5y/3XBAzrcWxXK4oupwTtCxhi8O3ta6v+JbpAdp2LDf
	7wMrVTui4nnveBjNiE33ECygVXvVn7B1mM4vkpSUooAxQoC+V+f+b7nEnt6GYYoL6j09GK3jmnF
	Ey/VroYW7XCF2dsNPsZCFEws7RCRYnNdn5Cffpn/TCYAvV0wpM/8vY8d11SAaWLTMbFt3vVUoAo
	KH6b2HCGgo9kZBVd9ef7hcGp8t700tAHwa8mAItH9kyH2PtBwJsW3Di70ClE+rvuVtMfZuORnAc
	OTLMtzFXBGcq0D9iJF0IQHPnLa5yhFeqOFY4yTBv3u8one324pn6apZOi/xV54OSJ3sDQMYlHzh
	SVYM2hdU6laFw==
X-Received: by 2002:a05:6512:3c8a:b0:5b1:5738:4d9e with SMTP id 2adb3069b0e04-5b15d7cbffcmr592857e87.65.1784119825410;
        Wed, 15 Jul 2026 05:50:25 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:25 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 13/61] staging: rtl8723bs: remove redundant rtw_get_oper_ch() wrapper
Date: Wed, 15 Jul 2026 19:47:41 +0700
Message-ID: <20260715124829.90290-14-ulijg308@gmail.com>
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

Remove the rtw_get_oper_ch() helper function since it is just a plain
one-line wrapper around adapter_to_dvobj(adapter)->oper_channel.

Replace all 6 occurrences across the driver with direct access to the
structure member through the adapter_to_dvobj() macro. This simplifies
the code, flattens the driver structure, and removes dead boilerplates.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 5 +----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h  | 1 -
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 +++---
 5 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 274d99e6a..c8f0beec0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -267,8 +267,8 @@ void expire_timeout_chk(struct adapter *padapter)
 		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 		/* switch to correct channel of current network  before issue keep-alive frames */
-		if (rtw_get_oper_ch(padapter) != pmlmeext->cur_channel) {
-			backup_oper_channel = rtw_get_oper_ch(padapter);
+		if (adapter_to_dvobj(padapter)->oper_channel != pmlmeext->cur_channel) {
+			backup_oper_channel = adapter_to_dvobj(padapter)->oper_channel;
 			r8723bs_select_channel(padapter, pmlmeext->cur_channel);
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 7f101adcc..064c9923d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3869,7 +3869,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 			bssid->configuration.ds_config = HT_info->primary_channel;
 		} else { /*  use current channel */
-			bssid->configuration.ds_config = rtw_get_oper_ch(padapter);
+			bssid->configuration.ds_config = adapter_to_dvobj(padapter)->oper_channel;
 		}
 	}
 
@@ -3910,7 +3910,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	}
 
 	/*  mark bss info receiving from nearby channel as signal_quality 101 */
-	if (bssid->configuration.ds_config != rtw_get_oper_ch(padapter))
+	if (bssid->configuration.ds_config != adapter_to_dvobj(padapter)->oper_channel)
 		bssid->phy_info.signal_quality = 101;
 
 	return _SUCCESS;
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b..f610fa5b3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -247,10 +247,7 @@ void set_msr(struct adapter *padapter, u8 type)
 	rtw_hal_set_hwreg(padapter, HW_VAR_MEDIA_STATUS, (u8 *)(&type));
 }
 
-inline u8 rtw_get_oper_ch(struct adapter *adapter)
-{
-	return adapter_to_dvobj(adapter)->oper_channel;
-}
+
 
 inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 09f4d66cc..e949f5efd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -439,7 +439,6 @@ void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable);
 
 void set_msr(struct adapter *padapter, u8 type);
 
-u8 rtw_get_oper_ch(struct adapter *adapter);
 void rtw_set_oper_ch(struct adapter *adapter, u8 ch);
 void rtw_set_oper_bw(struct adapter *adapter, u8 bw);
 void rtw_set_oper_choffset(struct adapter *adapter, u8 offset);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 397440af8..a71eb008f 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1978,7 +1978,7 @@ static int cfg80211_rtw_get_channel(struct wiphy *wiphy, struct wireless_dev *wd
 	if (!adapter->rtw_wdev)
 		return -ENODEV;
 
-	channel = rtw_get_oper_ch(adapter);
+	channel = adapter_to_dvobj(adapter)->oper_channel;
 	if (!channel)
 		return -ENODATA;
 
@@ -2452,7 +2452,7 @@ void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, uint frame_len,
 	int channel;
 	u8 category, action;
 
-	channel = rtw_get_oper_ch(adapter);
+	channel = adapter_to_dvobj(adapter)->oper_channel;
 
 	rtw_action_frame_parse(frame, frame_len, &category, &action);
 
@@ -2475,7 +2475,7 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 	rtw_set_scan_deny(padapter, 1000);
 
 	rtw_scan_abort(padapter);
-	if (tx_ch != rtw_get_oper_ch(padapter)) {
+	if (tx_ch != adapter_to_dvobj(padapter)->oper_channel) {
 		if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 			pmlmeext->cur_channel = tx_ch;
 		set_channel_bwmode(padapter, tx_ch, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
-- 
2.55.0

