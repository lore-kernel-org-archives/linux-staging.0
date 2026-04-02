Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDAC3BF66C
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142879; cv=none; b=RrzWDT+7EQVz47O0ZLdxYhL92H0zwVdPxgXKHsecOlxBdASgv5tMjwsWRo4QzRCxgoQMBQNwgrAU0BYJ5UtzKJgFLq67+Ch8lLkZCsYbW5lY+BHNfTxR5eMbNMt8g8wSPeqqTWnaLMKxDgj4SczgoJwF2envzEvKS/xf8abmOkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142879; c=relaxed/simple;
	bh=A3GPBSqyH2UzV2M4nd6Sg7rR3GxKtVU7Pvi2E9+vFzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsD16Gga3n5e9TZlToFWthbwMNAVNe1dWfl1ijPjhO/qiR42E6SJz1uWTw020Nh/nWtuS7/4kOrXiCvUIMnQh65pEHVfypPuK7DNppcC9R58UvyCXPY1vQqsP+7XSYU5fmyjBCMV+OT9MaGwFPdu35KhQRYnlcA3V2gfbttvfQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BcUBH8Al; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BcUBH8Al"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fmlWp6t3rz9tqk;
	Thu,  2 Apr 2026 17:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775142295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqVQk39qARU+CWtjfqHhYv3nXsEN9FWkqQ7MQ386hyA=;
	b=BcUBH8AlsFqF7+4yPqbSP8KJ+FVAAz/6YylhfaLJ2MJMazHTMtqk5q+ABchWhGpJ3D8k88
	TT9ZbmTcg3jyqFSyPFEvYKVFP7UP1I/TExMHOhDoTrz4PdNwmz59shLpxz0JPDsx4Q7cMi
	BhJU/HFngHoeXwnopSOWhUVwn8BgppLnAvp294/aq7rZBcfJiCoKo4DIrd+GG2uoka6csH
	6/9AEgriSowMWDcoQuSHLZUp8UZIvTfwId631r7qzB8RqDwsVz8KaAYCl7aWxtMe3eJbft
	a9//AXMX9Ceny2EbpInzrsIXNHLgoQA2WsTYq2roeKL+0vVvS5S2efRpQRgyEg==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 6/6] staging: rtl8723bs: os_dep: style cleanup
Date: Thu,  2 Apr 2026 18:04:29 +0300
Message-ID: <20260402150429.14761-7-khomenkov@mailbox.org>
In-Reply-To: <20260402150429.14761-1-khomenkov@mailbox.org>
References: <20260402150429.14761-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e13a9194762f382a5ba
X-MBO-RS-META: qsgh8xtadfpuuk4i53bdgs8x9k5bob6u

Cleanup coding style errors in the lines modified by the
previous logic changes. This includes removing extra
parentheses and moving logical operators to the previous
line in if-conditions.

These changes are only style related and do not affect
the logic.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index d585c4a4f807..4ea97ac0be84 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -898,9 +898,9 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
-		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+		   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+		ret = rtw_cfg80211_set_encryption(ndev, param, param_len);
 	}
 
 addkey_end:
@@ -2340,7 +2340,7 @@ static int cfg80211_rtw_del_station(struct wiphy *wiphy, struct net_device *ndev
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	const u8 *mac = params->mac;
 
-	if (!check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)))
+	if (!check_fwstate(pmlmepriv, _FW_LINKED | WIFI_AP_STATE))
 		return -EINVAL;
 
 	if (!mac) {
-- 
2.53.0

