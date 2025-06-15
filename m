Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919886338
	for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991149; cv=none; b=TSLDhgSNYshGLKKBYSxZLmKkXAPops3ZQjzxFUBLl01mFAmLKuVCUuvy0gvpHfZXX5pfkkB0GziAKu+Z+0YJXp2S2AmZhvudQmJjjPBkR+NieGhuNgeXOYZdJX4wjHWujBaUFyD36cA2vtwkleFM9evCvOGqzbN+1CrEvuYFRGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991149; c=relaxed/simple;
	bh=OOG8A1lJB6QxMnOCdKGKRFFp+tIssrE/n52zH7SzpSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwl2vKqDcZKKKKpS275qhVGBiEgovWgJvA9nPvKSj23fvssQXgHk8c26dy176nuqHLaa+l4Q0PnrTHno8LeJqZ5BmBRRq2Xw50l6NaC83ro+6dOjRcgQ9SOuW27FmJhZzpgxGhr3JTsvdM8uEjaFzjZqmnA4zPrmt60b4hXIKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKZC0PWL; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKZC0PWL"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade30256175so688267266b.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749991146; x=1750595946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ht0vsGzBZHXOYe14xnyI7/iCiRETWINgnDHOAHnZ/+U=;
        b=eKZC0PWLs9YYxNxTWiEqxcDbxMHZ6h2P8rO3VtMq8ndmxp5QwT3g4M//iCj6tDIACM
         3N0bsYhQoX/tAs2RhF66ibjxbBjNBQwU3QwwYHI5eKxnK5Ex24tkjvkz6DNlQoL99rGw
         gUcWPkt/VtK3Z/R8dvgBqiSie5nVz/GS7MwQ+NOz9CyHrzAuKccVfx8xbrleh0/RjFch
         XE/GVzdb+FhRkGWiiTmfDDUQIx9WZUzfGHyElHXBtxjHnEMZnfaVBABNAep15BA/teoN
         8peAt/QvAq6cOSBHxWzQc69N9brtKgoRp0dHs+RZUt0zUbH0jJUU6MUrF81VWlVcQEUa
         C+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749991146; x=1750595946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ht0vsGzBZHXOYe14xnyI7/iCiRETWINgnDHOAHnZ/+U=;
        b=iYNGNE3WMlJIP84vQm2QpcYztGwBy4ba3ZP6vHUJPqZUhobNZ+nv0qEgbh44Y9CX6W
         zl/tRhKZsrPGw5k/JGBsOCF+Ampul7z+EuQM7lSLhqJJ9TFVUnLYYn0n4bBdz3hy+fQF
         ZehovxwjnTpUjvNEnnvSWfys7i3YjdDdboGmBdTU+Mm0SkNd3PywDCB3B/sODoNWn6Ok
         N6AGUgnSd/xmddIVdOOfBvUeaQ6tgZ97dlOmNzGPf0QimFHJgKSRtTxINwssM9vQVV6C
         vWFVMRTDXC70uU6daUaAMUurHO7OWrUIneSMaeNIusrUZQeXX/YrrCaxl5iKcG7Fzpby
         lIAA==
X-Forwarded-Encrypted: i=1; AJvYcCUjVYFODREQThjq4vFmPxhxlxdCntS7FOU0BRizPWZnzIGCJobZKWq/n5h5JCEoyid3/r0xfyuK9Q1PsfS/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9MNx+DzgQKFvkFcwdXURMwYgk7NJDNB1OlGWCU1eVDyqgSwSb
	cZoW7nW17UnPRdH16dNn3YucMwpqw6V7sLtnoxffwSOpV81GEreMexSG
X-Gm-Gg: ASbGnctrJ9iOaNyBUbEZTaoIyDEZZlSrPjKMc82brgyaybFBPG6wkfRpAUg20S2bH+A
	XqedRv3Z/qaIMgEtnExwb1+vYxYarvPh8bg97cuq64/BPwLn3tEGau4ubtLtXwTTCnBs4cJo3ax
	kLCS7G6tA27v/OGJq7fUKlCo0lwJdpU8QGO2E0mVGMrt9MyYtNXg86M/WYx9giV9ugpXpZw7LoX
	JkHz09epPSIgtMipavYio2CKPe43gmiawz7pJOFyedmomNcNOjTvsjvP2QwqvPAQwexJpilHzfx
	rwWUBApUQS2eWXCGwGZn+lXw7cZEpld6fcOYgX6FOqoieyl6Y0sjsqK8c0tS1yvXeZobjtSR7un
	ACBZzFbgSgTsCmA==
X-Google-Smtp-Source: AGHT+IEVMECVXr20Usoe4/zdCvMUe9SrxO0WUwD6EbhR+37C/PSr/kSVuwEjB1/Jha7qJMztNqRh+g==
X-Received: by 2002:a17:906:c103:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-adfad43c58fmr626913066b.43.1749991145504;
        Sun, 15 Jun 2025 05:39:05 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897ac3dsm473478866b.155.2025.06.15.05.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:39:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove some 5 GHz code
Date: Sun, 15 Jun 2025 14:38:59 +0200
Message-ID: <20250615123859.41922-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chips that use this driver are 2.4 GHz only. Remove some code that is
executed only for 5 GHz (channel > 14) . This addresses the following
TODO item:

- find and remove any code for other chips that is left over

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Compile tested only, due to lack of hardware.

 drivers/staging/rtl8723bs/core/rtw_ap.c        |  9 ++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 18 ++++--------------
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  9 ++-------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..b2e7e7267aa4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -741,13 +741,8 @@ void start_bss_network(struct adapter *padapter)
 	if (p && ie_len) {
 		pht_info = (struct HT_info_element *)(p + 2);
 
-		if (cur_channel > 14) {
-			if ((pregpriv->bw_mode & 0xf0) > 0)
-				cbw40_enable = 1;
-		} else {
-			if ((pregpriv->bw_mode & 0x0f) > 0)
-				cbw40_enable = 1;
-		}
+		if ((pregpriv->bw_mode & 0x0f) > 0)
+			cbw40_enable = 1;
 
 		if ((cbw40_enable) &&	 (pht_info->infos[0] & BIT(2))) {
 			/* switch to the 40M Hz mode */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1d23ea7d6f59..0b0ee023a239 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2252,13 +2252,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	}
 
 	/* to disable 40M Hz support while gd_bw_40MHz_en = 0 */
-	if (channel > 14) {
-		if ((pregistrypriv->bw_mode & 0xf0) > 0)
-			cbw40_enable = 1;
-	} else {
-		if ((pregistrypriv->bw_mode & 0x0f) > 0)
-			cbw40_enable = 1;
-	}
+	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+		cbw40_enable = 1;
 
 	if ((cbw40_enable == 1) && (operation_bw == CHANNEL_WIDTH_40)) {
 		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH);
@@ -2366,13 +2361,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		/* todo: */
 	}
 
-	if (channel > 14) {
-		if ((pregistrypriv->bw_mode & 0xf0) > 0)
-			cbw40_enable = 1;
-	} else {
-		if ((pregistrypriv->bw_mode & 0x0f) > 0)
-			cbw40_enable = 1;
-	}
+	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+		cbw40_enable = 1;
 
 	/* update cur_bwmode & cur_ch_offset */
 	if ((cbw40_enable) &&
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 73c70b016f00..0c6072d08661 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -854,13 +854,8 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 
 	pHT_info = (struct HT_info_element *)pIE->data;
 
-	if (pmlmeext->cur_channel > 14) {
-		if ((pregistrypriv->bw_mode & 0xf0) > 0)
-			cbw40_enable = 1;
-	} else {
-		if ((pregistrypriv->bw_mode & 0x0f) > 0)
-			cbw40_enable = 1;
-	}
+	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+		cbw40_enable = 1;
 
 	if ((pHT_info->infos[0] & BIT(2)) && cbw40_enable) {
 		new_bwmode = CHANNEL_WIDTH_40;
-- 
2.49.0

