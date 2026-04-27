Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208D3EDAAD
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312750; cv=none; b=QkRyWaLzhEYjV+87OKf9gqmnQooY5UMhxAoLWuxxyOMfmo/64XQSLEGz17Q1o8YNz4ILFUnelgVOBoyWYWo9fhugcby0yaE0ycr+HBjJQNy+D77DMqoete9UciHVcYn6I8+LjDfqbddP7rxDHJLvxjDfU/sALzGrmW4u4+oPk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312750; c=relaxed/simple;
	bh=rqEKgli8OrDbB4vKiTRrCas9jgedKvcx3cnZHfupXJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZCEDFSsMstmTLuqlWl9afv6APoVXyK9/vJZt9FfhDK32Xk3K4Jw/Mg4wZj0i0+EKa2QPRzOVfva1bPrTaxLs4t6jHCjDQ9tZ4BvCqqGH11f1W9InsDsNgYsoCOLsXm+ATRQTUdg+mxdMEXdwgmoe3mQ71dVEWuAddA0M229Jz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kGDtSnie; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kGDtSnie"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g4BCG0ytdz9vRT;
	Mon, 27 Apr 2026 19:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777312746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sfENNjyCoL1cAAcGQvtV3hdGeyjZrYP2XQMM47DqotA=;
	b=kGDtSnieOW4sbC8azobami9v9ouqF2n3BbqUYmD5KqlHNPPj0kLYsh6uIW8lOcssR+5G1s
	4Qp2rBIKeAoyGwaGKOrqI9afjkoiuswf3FHiGsxPw4ulD7JafvMRvBgO9ifS6pSeQQt/Wb
	dxamznZLJ/8H8B7Zw/vqdWjU9A4zdMvi6BkjwpkMatQZXBDsfH/XH/P7f/HP1+82xyQ5q1
	oCA1Yeh6Z5AiN7U80zUDaatuRKL5DYOOChXp6VkX9w8N3t72D6aPxtxchtogaqo+9/fQfe
	Gkl6vUz5Xu2Rf3d19rzWnvhhibhTSdthiypoCGWWn76MGpqx8JMGfHTsx/kfbQ==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v6 6/8] staging: rtl8723bs: move logical operators to previous line
Date: Mon, 27 Apr 2026 20:58:44 +0300
Message-ID: <20260427175846.23470-7-khomenkov@mailbox.org>
In-Reply-To: <20260427175846.23470-1-khomenkov@mailbox.org>
References: <20260427175846.23470-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tmdwmd3qoba37acmzt4fucssqzp9fdit
X-MBO-RS-ID: 742c036011d9d2f1f71

Move logical operators to the previous line to improve code
readability and conform to the Linux kernel coding style.
This fixes the LOGICAL_CONTINUATIONS issues identified by
checkpatch.pl.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 4 ++--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 7cbfd0fc20ed..b5a363df7eb7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -470,8 +470,8 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 	struct sta_info *psta = NULL;
 	u8 short_GI = 0;
 
-	if (!check_fwstate(pmlmepriv, _FW_LINKED)
-		&& !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
+	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
+		!check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 		return 0;
 
 	psta = rtw_get_stainfo(&adapter->stapriv, get_bssid(pmlmepriv));
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 14a6d0e2a3c1..3c4c7d902295 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1757,8 +1757,8 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
-		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms
-			|| !is_same_ess(&competitor->network, &mlme->cur_network.network)
+		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms ||
+			!is_same_ess(&competitor->network, &mlme->cur_network.network)
 		)
 			goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 9453180fbb0e..de7b3179afdf 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -899,8 +899,8 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
 			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+		   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
 	}
 
-- 
2.53.0

