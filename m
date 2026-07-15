Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F2D481A89
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119851; cv=none; b=ox9YFYQWoby4c4kHuCN2r2jxKh6EIcTHVJLVNBfpyvLevDP8MA+t4E9oQW9wWO8b8oWSkOyrC/WPDKMGVqWd4DD3EyXA3sBz+CA8ftNADkpAdEYqrIyx2qQ9FnGEYlzuPDs91zHEFA9onDoYhRZ+fnrZR5QPX8RNi95EmrD2Gs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119851; c=relaxed/simple;
	bh=n6fe+naOVACowWy5NFQ1XJF2gzsEWNhJRUv7gG6UAXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttzDyPncwmp1o08KHMXdpXuN2moJTQXe7fg+CVS6KLVe72ixLL8gwGojkFI0EPY162rNiRI2zoJLCy3pUS5OkgLqL/xDcj2cPIKjG4lkHGpMae/qZJE/kC5raA3Tm54BNcZv1HoloSf1zDoNz6qBQRT/tABoxZ7iPEFe0e9vuM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNpBEcSv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNpBEcSv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b159850b16so1841793e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119844; x=1784724644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEcs5vvVq43qJQUckvqztaAgEygqZRuFTmokfHHDOMs=;
        b=QNpBEcSvZ9ggBvJxQIKt0DPkDrsuhEb+IWr+7S2SQhP8QuwjFG3OPjM2DnTrtp/8Zv
         zPs7IW1cgE5P0zW6hlENkyMLg62siip5cV7C1DWGWvy42NifFek/kRdHAmx9iKGXh1PK
         rJOUzLQaraLuIixbyXy/h6vkKIjaIPrTA42FJ5fcYd2xfR2YQhkE8PeV5rbcEQiEPvvB
         a4mOvWOdU4MOEPBFmIIlCV8T5ynMPwtQ+JysRUqq+bBxXxGkFD6UERvQ7D2mwQS6i5FB
         nwMqpssv5QN7FxfAfCZw3U3HdCSomJFP/GfSa2jq67niFCQshqx8KQ9TgNRnZlNDP3Cv
         uHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119844; x=1784724644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UEcs5vvVq43qJQUckvqztaAgEygqZRuFTmokfHHDOMs=;
        b=lgtYh4U28//TdXSZNUjYs10c/EUbP/PwhSSiygcy/S+40RQ05iqnxUb9qysFCHysn3
         DUFEuT/Gn91fIfOfx5r1s7eM1h3GdC5+0sVq5H5bSNGd2XEhwevQGeCGebD8wGNU1JOX
         uJHkgbcBSBFe/95O1fROwI41pvqQWwsjgz00tg4zXv0UzIGniaUY5BPiCoel9lLchU4O
         myPNZEX49fzyzMMx1Jv/VbAxMkD6T5qdDzip4xFlc3DbZSxbTCxYlfJKy/IWDC8v92pH
         3ZSJ0pC5Vyp7nzeQTey4qonb3/I9IjfjFs+gRMqIHhWhp/lvFsG8IdSvTrY9u6xU+Dtu
         0QtA==
X-Gm-Message-State: AOJu0Yz6CwF0MCASW0Q7+MTW9JVHpLuONguDjtYPE/c2v3UjSpO/HmSt
	FkARJtDVoGJmM39ehq7dRYldBRda5drksC6gqbTipUxl/JHovqa/UGnLH9Z4oyVVXZc=
X-Gm-Gg: AfdE7ck9c9ntiGEax0vtFqLYf+NEOIGfZyi4tipQG65f43GN8TKIIIziF5k6M3FoVc+
	wpHTlpm5VhbJMvQteNu47MaanQgT2PUiNdviajjEQUOx7wEfQwUd+n6K+64AsuW+1GwHklH/mLD
	coGHcwRn0jZ8/yWwYBxj94qN8eJHpcMjIPssmbMEtM2YAbjaCQwES/VLBnBNMjPcK4Ux8qmNk6x
	VrGyPyWJyvkcY2u+2xBygJZaJcsoOJY0iydVi6ECQda2j45lVeDxhWqgm5/nsQQJ19AkTwULerA
	OhWLxK6vsk/3+sF6qc4tYy1tvjMg8yyUmZsX1azYr81pzCkjfBQE92uEHQOFiFecSrj7DmTX8l4
	U88Pb48H0cx0ukAxoig9Sltxl6pfiddnbnaLImGCah4NN1wbEOx7a9ABXeNNRj+yn6+7/O9MXdP
	w/BTHOGtaD4okgfiFUM+1SnZGY4f+PdiHOqNkdRNv4UjyqhvKsFFyyM+9hBfEBwhw+Jn8plJhP6
	glt2V92yz/fmQ==
X-Received: by 2002:ac2:59c8:0:b0:5b0:17f0:606 with SMTP id 2adb3069b0e04-5b1582a3631mr1154258e87.40.1784119843966;
        Wed, 15 Jul 2026 05:50:43 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:43 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 36/61] staging: rtl8723bs: remove rtw_wmm_event_callback and update handler
Date: Wed, 15 Jul 2026 19:48:04 +0700
Message-ID: <20260715124829.90290-37-ulijg308@gmail.com>
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

Completely eliminate the rtw_wmm_event_callback() wrapper function.
Adapt the signature of WMMOnAssocRsp() to match the event dispatcher
prototype by adding an unused buffer pointer argument.

Update the other invocation site of WMMOnAssocRsp() to pass a NULL
argument, and register the handler directly in the wlanevents table.
This removes a useless indirection layer from the event handling path.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c        | 4 ----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h     | 1 -
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 5 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1450589aa..b57b665c2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1483,10 +1483,6 @@ void rtw_cpwm_event_callback(struct adapter *padapter, u8 *pbuf)
 	cpwm_int_hdl(padapter, preportpwrstate);
 }
 
-void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
-{
-	WMMOnAssocRsp(padapter);
-}
 
 /*
  * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 25dfb20f3..62abfd896 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4658,7 +4658,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	update_capinfo(padapter, pmlmeinfo->capability);
 
 	/* WMM, Update EDCA param */
-	WMMOnAssocRsp(padapter);
+	WMMOnAssocRsp(padapter, NULL);
 
 	/* HT */
 	HTOnAssocRsp(padapter);
@@ -5614,7 +5614,7 @@ static struct fwevent wlanevents[] = {
 	{0, NULL},
 	{0, &rtw_cpwm_event_callback},
 	{0, NULL},
-	{0, &rtw_wmm_event_callback},
+	{0, &WMMOnAssocRsp},
 
 };
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1597fc33a..df5508ce5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -683,7 +683,7 @@ static void sort_wmm_ac_params(u32 *inx, u32 *edca)
 	}
 }
 
-void WMMOnAssocRsp(struct adapter *padapter)
+void WMMOnAssocRsp(struct adapter *padapter, u8 *pbuf)
 {
 	u8 ACI, ACM, AIFS, ECWMin, ECWMax, aSifsTime;
 	u8 acm_mask;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index f15dfcac0..973688bef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -264,7 +264,6 @@ extern void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_atimdone_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_cpwm_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf);
 
 extern void rtw_join_timeout_handler(struct timer_list *t);
 extern void _rtw_scan_timeout_handler(struct timer_list *t);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index b12128963..3d1126740 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -478,7 +478,7 @@ int is_IBSS_empty(struct adapter *padapter);
 unsigned char check_assoc_AP(u8 *pframe, uint len);
 
 int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
-void WMMOnAssocRsp(struct adapter *padapter);
+void WMMOnAssocRsp(struct adapter *padapter, u8 *pbuf);
 
 void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
-- 
2.55.0

