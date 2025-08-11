Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CD52D837E
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893389; cv=none; b=kth2Y5kopL9Y45ixLoTcfT7Qzb+fWCTQYBukK6NsbN6BXDLQAwg1LA76Dkkn+dTjxaDoQUUUB43LPr0CwddN/qkBmGOKVGzRi1ojEXICxUbDCSunIQFEdPE6X6kCEKnfv4ahUln9CwIEXS5MO9Ewbpz/liqcFAsC9NvWLW0QqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893389; c=relaxed/simple;
	bh=RV5GCs2kHr/zrsTb0VPTOztxezwZbzu7WRt0nwukgMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxI4o2LmTHuqceftnf8YLcZiWBdVzQBCe7WsRVMxfpexW1WMSCmMRT3HPb8w6tEFVtRCPfyqPo/5qlvmw1ZzhiVD219cxpRDYCTbQWKLkVwUFQx66T97JO65CdAjt1cGoVqnW2jkqDseTc/qrngDzAglWya5xgow6JoTOwJ7kv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnJ9bKSv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnJ9bKSv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76c3607d960so4159271b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754893387; x=1755498187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht5SZSKxZ6Td3vTrSxznrM26w1SVeWme5zze4IvOuHE=;
        b=fnJ9bKSv2n1fZxl/r5ZHGb4oUIR/uws1EJD6Cld2GTyt5GX8oRYqdd3nMWMz3C/eY8
         aFFfvkMfC9M5uBfNjTSl6wSvlgLNyULbPy7wqb4VxKaLM1z1hLVeodq2D6OPS9LSRH3B
         JB7EmHC9v6vu/TmVspNRYj49srzdIIIylerlVGR/qN+eX1WK1dVYbzlzg7Z+xH9PjidP
         ceS89EaTmktSbvHaaTnVVgqluKygV0v7ucuOjCCCFA/XmFo1F9nU4uRegwhOG3+VZVLO
         sAvfy7yUxg2g80vTWNavPxRQ5z5sgcn5x2xJTSCmg3dgKMUxDz+pzsiU19kNiXg4N6Bz
         9Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754893387; x=1755498187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht5SZSKxZ6Td3vTrSxznrM26w1SVeWme5zze4IvOuHE=;
        b=oiBvwxjaUeZA48A6qKa1fN4U8O0FpxmsN1Dt5ZkGv8VKxSaNuab5ckBv5RtfCS0ZxV
         1hG3ll9eusd3tViId02KqyNOk2ZYsBtQApxO8Sg3Gc8cHOSPk1ZaM6n8ejZmkqscpMOU
         mem4RbP7PQMk56AIQAPLXg5EbTGxiFmIFWqELPCCyhdAh8HvtixWq6Uz4ZngihhMm3D8
         4aJAiIkMJQNWW1nsFpZJo6N5hytJVmqbc+NTdUU79r9UQGkYWkr04XYv8+rp4r1WVZF4
         5qu+6eqZkvT4nn28t34K9Zp6LivDcBbS0Q32/WO5r6ZKS+z29tD0GMpFLuwexO45sjK9
         roNA==
X-Gm-Message-State: AOJu0YzwNEwma1X1siav6C8n2wnA8wSiRvfRCYmwxIVV4L4yxFut1tEr
	XUstKiWZCFoATzp/twfMJ6pjiFIcy7l8KSKfqsPj6r6fsC576fB+/4i9
X-Gm-Gg: ASbGnctdZ9xNhAHlM0jRRRxSzU6PeXyjtSF3KMiBkvpMqbDSFb7k+0sYmk2ddMepX50
	eQsV/GZ3ki9ce6YWkWPiWtA5c8KyZLoFGTccurkt0dagirj7TKbhm1IwA0pZKi0Qng5NUVitEez
	AeUfYyyGn4mJ1HRpSJNyO0MxbRrJkKkoiBVLz7auzRT+5Ce42hTBoyELvv7TVg7pLJCtk6+xUDj
	xoZ2Pyd+13JCKODV6an8TKbW2o0lerAgDV+IVGd/eatRPGv3KqG8ahlMCTO/Nzdtrp76O9P51jK
	4kl2W6A1gwVnYDQOdq3URExhMuC15XTGBgSqHWsTCamwvIw1WYP6zbMT6GtyodNB35qnYEVF6HQ
	ke7tcP5OlcyIX25cdg0qEpKdNS0RGAKp70z4Gje3LXN+1655kPEcWnrtJBdDfatyD0wHaEH551C
	epwpSkfE9a0L1HrxmT1AugAbY/qs7YBCqEm05lYO6Y
X-Google-Smtp-Source: AGHT+IGlmrVK0CCzFeHYRPCVHjfCoB0sZhL0rSac5kgBAIFpd/p4/sJ7sycMyphj3Vz1IC64n9ZNMA==
X-Received: by 2002:a05:6a00:4fca:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-76c461a68e1mr17163990b3a.18.1754893387403;
        Sun, 10 Aug 2025 23:23:07 -0700 (PDT)
Received: from wen-HP-ProBook-445-14-inch-G9-Notebook-PC.. (36-239-105-221.dynamic-ip.hinet.net. [36.239.105.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f800sm25861623b3a.42.2025.08.10.23.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:23:06 -0700 (PDT)
From: Yao-Wen Chang <changyaowen19980629@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yao-Wen Chang <changyaowen19980629@gmail.com>
Subject: [PATCH 08/11] staging: rtl8723bs: Enforce alignment match open parenthesis
Date: Mon, 11 Aug 2025 14:21:31 +0800
Message-ID: <20250811062132.102525-8-changyaowen19980629@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811062132.102525-1-changyaowen19980629@gmail.com>
References: <20250811062132.102525-1-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit force the alignment to match the open parenthesis
from previous line.

Signed-off-by: Yao-Wen Chang <changyaowen19980629@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index a11afebc8b9e..e82f8a07b630 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -307,7 +307,7 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 		bAllow = true;
 
 	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
-		!atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
+	    !atomic_read(&pcmdpriv->cmdthd_running)) /* com_thread not running */
 		return _FAIL;
 
 	return _SUCCESS;
@@ -364,9 +364,8 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 
 void rtw_stop_cmd_thread(struct adapter *adapter)
 {
-	if (adapter->cmdThread &&
-		atomic_read(&adapter->cmdpriv.cmdthd_running) &&
-		adapter->cmdpriv.stop_req == 0) {
+	if (adapter->cmdThread && atomic_read(&adapter->cmdpriv.cmdthd_running) &&
+	    adapter->cmdpriv.stop_req == 0) {
 		adapter->cmdpriv.stop_req = 1;
 		complete(&adapter->cmdpriv.cmd_queue_comp);
 		wait_for_completion(&adapter->cmdpriv.terminate_cmdthread_comp);
@@ -527,7 +526,7 @@ int rtw_cmd_thread(void *context)
  */
 
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
-	struct rtw_ieee80211_channel *ch, int ch_num)
+		      struct rtw_ieee80211_channel *ch, int ch_num)
 {
 	u8 res = _FAIL;
 	struct cmd_obj *ph2c;
@@ -777,8 +776,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		 * Especially for Realtek 8192u SoftAP.
 		 */
 		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
+		    (padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
+		    (padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
 			rtw_ht_use_default_setting(padapter);
 
 			rtw_build_wmm_ie_ht(padapter,
@@ -1184,7 +1183,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			BusyThreshold = BusyThresholdLow;
 
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
+		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
 			bBusyTraffic = true;
 
 			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod >
@@ -1196,7 +1195,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 		/*  Higher Tx/Rx data. */
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
+		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
 			bHigherBusyTraffic = true;
 
 			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod >
@@ -1302,7 +1301,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 	u8 mstatus;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		return;
 	}
 
-- 
2.43.0

