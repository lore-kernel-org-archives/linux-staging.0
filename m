Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D3F47CC71
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119846; cv=none; b=Nkt2EYXOTaJWH2RTvwgZjHby+JB9xXn8mmAbVgQf5DsVtLc/LbmNt1DwEDpQhhbzVWZLciXyEDNPacOE76Si8NKttUDhxY1DWn3YjFkE4mG+zSyaj/edW/F7726fAhE3A1fMS3rvczErDKWMwn8/aiUTAx0gTAl8BxV10zGco2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119846; c=relaxed/simple;
	bh=zZXAo8npoDzLKVKKYOc0BU24XqQ2NLcE3VqH4JNn+WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9JArr5RJITNU+tHjG23Ns8s3nOSjrUMHFABzua4o1cjiJBjQBb/sdm5PF2t8b5x45bU1aV9HlGsSBKmFt4dqR5S/isPJ7Gqnc7TwL6rhmJ6OUtrD3r1w2R47PurvLQ3BdYjVdsHVTiiXJ0G7IJtbBIYNWj2536I0qCOVCVPK7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4aUSRVN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4aUSRVN"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so761834e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119839; x=1784724639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDOCH3L6xBsyr24MyXHVgIBAtfoXRa0Y/GN8N+RqAIw=;
        b=h4aUSRVNpARDIlCaK6PyaTrmnhP9YlXobU8ijpbd7bm1QlpbUQ1v7Kwed2qcsPmNPW
         aXL3OB73n3jZUGhz4DQznW1HAfAZTocv68xwj6krqc+AIW34qW5JTZ/4t+TJ031mLAlE
         EZ0sj/Rhu6FaYiMj62gz1R/nxfqz0++RMfl/UUmnwXCveocOVoCtyRiGEmFM68R/FT1Q
         8MZpW36qR/8bCDJy55CdH1EOi+Pek8Ii4FM5KpKODFAzUOLhwAuTavaBseaiYIVcD257
         YbuL+A6vReXyxSqTDMdKApWR0aAsw/TM8QCs7q5p80Q3eVmuGEApyX6GH6hI5qrvbIjr
         Wljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119839; x=1784724639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDOCH3L6xBsyr24MyXHVgIBAtfoXRa0Y/GN8N+RqAIw=;
        b=ifbpgI6rsn0r1CfEP2hAx5Mc+xKBAQDnQV9G+RWkFQtBAbVv0Ig2xmJxWL9Lo/RDmR
         SKeLLToO3wi4HFG1tzY2F4f9LPaH5q3LuQYYYHRCEqXonxAEEcDWrllHuGaLRE3Wn908
         8pl7dI3h22f8e1+S0eYXIn7osHoS+e6yhD4ut30GdhQTskc9beNtGoHLDVJv/jB8Nqby
         o7NtEWYgAWN4F56h12oAJlGiXMK7GKtSIcZcejD2e25zGhkNrdnPbNc7G85zxe+2BUzL
         KgAaIdS7UseCXede434P9xpKkWZ5AILpUvKhkayC/YDVYJU+XkkkmhFlkfr764EPoWMi
         3kdg==
X-Gm-Message-State: AOJu0YwHAW3FbSvvHZUZW4bjJM/hgB0bpYSZMEXp/bwAHCxxtfknhXoF
	HCevPbH/rlvEXLy0+D7FbF0znjCKtAPGy6ATpgRTzJpqOB679ygWa+kuChpaLtmN+Fo=
X-Gm-Gg: AfdE7cmobQrmJepmFpRqIsZTsmnaQc174aO8XDFqMYc6cjCfYaTHzxN9RFHN9FgxmrX
	K5InV5BrOb9JxS7oSQ+5Up4Au3T2sCzj2Ub70nPYWfnRlQdO1mC3ncAD6Nz7qHZS9J3m2M3f3F0
	lBgD4dLHAmC8G2wyh+p3B3ZH9mg3bgtD4Knjy1lfD8xZhkt6hXErDVA1cbuI0uNrUWcs9pMMNJe
	G5BGetmeFzkJkav9JpuQ5Mu10+N4HxS+h5DI5/twj8qLYxXQzBCww5J5Ie2xv4991jlotEPlUdC
	gTTF+9DdRcJOw5uwSKoBdWafhek5/+vnOiBLOseSxrWnPrThFJianPxI3VHYFz5ZlHAmD3Nhrvy
	fSXpE5sgng9JvWWQMnUBcn4hx8B0HZELS42unEs87V4C17cL1to8kPhQ2KKFEvjaqsPklSEsrxd
	QB9Ur3PkJJ1AYINzBZzAvwOCP+peJD4SuBN7PCDZ2CYzM7T0oeoIpYgxYwKL9bdrNpOVsRIiFfE
	xp25xU4HnjpAw==
X-Received: by 2002:a05:6512:2524:b0:5ae:bd5e:95f7 with SMTP id 2adb3069b0e04-5b159b6ab5bmr1418321e87.4.1784119839311;
        Wed, 15 Jul 2026 05:50:39 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:39 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 30/61] staging: rtl8723bs: replace correct_TSF with direct HAL call
Date: Wed, 15 Jul 2026 19:47:58 +0700
Message-ID: <20260715124829.90290-31-ulijg308@gmail.com>
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

Remove the redundant correct_TSF() wrapper function from rtw_wlan_util.c
and replace its call sites with direct calls to rtw_hal_set_hwreg().

The helper provides no extra logic or validation, serving only to pass
the fixed HW_VAR_CORRECT_TSF flag and a NULL pointer to the underlying
HAL layer. Removing it simplifies the driver's synchronization
interface and reduces call overhead.

Clean up the function definition, remove its prototype from the header
file, and update all invocations across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 5 -----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d472570db..9dfa31171 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4690,7 +4690,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
 		/*  correcting TSF */
-		correct_TSF(padapter, pmlmeext);
+		rtw_hal_set_hwreg(padapter, HW_VAR_CORRECT_TSF, NULL);
 
 		/* set_link_timer(pmlmeext, DISCONNECT_TO); */
 	}
@@ -4714,7 +4714,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 			/* update_TSF(pmlmeext, pframe, len); */
 
 			/*  correcting TSF */
-			correct_TSF(padapter, pmlmeext);
+			rtw_hal_set_hwreg(padapter, HW_VAR_CORRECT_TSF, NULL);
 
 			/* start beacon */
 			if (send_beacon(padapter) == _FAIL) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index dc2e341aa..03e047397 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1600,11 +1600,6 @@ void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	pmlmeext->TSFValue |= le32_to_cpu(*pbuf);
 }
 
-void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext)
-{
-	rtw_hal_set_hwreg(padapter, HW_VAR_CORRECT_TSF, NULL);
-}
-
 void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 {
 	int i;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 6b1ac26b3..b12128963 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -602,7 +602,6 @@ void sa_query_timer_hdl(struct timer_list *t);
 extern void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr);
 
 extern void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
 extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
 extern bool traffic_status_watchdog(struct adapter *padapter, bool from_timer);
 
-- 
2.55.0

