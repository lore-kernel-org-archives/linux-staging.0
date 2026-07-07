Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDB4438482
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444514; cv=none; b=DwqriCsJpfCAME3ArMTyV/9wVkRPU2Jib1/wI+s+fynPOL7CQNWhUlpSTKvWR9mjx+bIENxoJ7FTx2db51HM+AS2GuiClou8lHmGBk4sTez27PiyiZvXMz9RSf4rHWaj1SF2QS6PcWRY9cPzB1OysXjhzCHltg7Pe9NlT1V/13c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444514; c=relaxed/simple;
	bh=s/BF6KpZ66ymQ1lkn24AerIAd6dpFzOC3CvzwcY5lgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwYoyuKdj0Gb1iwGcRUyzGIMV9bmDStQanIyg7xW8keH9huKDzOULT1b80RA1JQmOCt1c6PJKzoj41X6aw47MgRFxiXN62cAe4SBORRTXqfkE7xjLKo4BxE50bskw2e1byDL/nQs/Kk6OEeeVqwoVz2hYWutiZjZYFRqChVkdA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=FbZ7fAdo; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="FbZ7fAdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=o9
	vEqGobajmcjhhbZp9dhWDn/PfAw9JNrQC2c0OrOHg=; b=FbZ7fAdoy2KkGpHWM+
	3sNn50MahBTm3hTxOEDpbXiSVNfw4kHL/VS15pLnMtHAmNTkNs3cwUVfg0036I9T
	SSxoiFGLuUvfwuobVUAbjyoKlZckSGQl/MjaMReX0t0rDQMnw4dhrzWcHcPBatTN
	cEmuVs+UGhsk91OO3FTiv60ss=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz8cMNE1qRiRvCw--.53372S6;
	Wed, 08 Jul 2026 01:15:00 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v2 4/5] staging: rtl8723bs: remove unnecessary parentheses in issue_asocrsp
Date: Wed,  8 Jul 2026 01:14:49 +0800
Message-Id: <20260707171450.70997-5-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707171450.70997-1-coolbeaner@126.com>
References: <20260707171450.70997-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz8cMNE1qRiRvCw--.53372S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1rur4DXr15KFy5Zw4UCFg_yoWkXFXEka
	1Iqws7Jr48AFnFka1DGa1SvrW0grWrZa10yF1qqr93Z3y7ZFWrX3ykWryDKr13uF43tryk
	Cws2qr1F9w1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRAKsjDUUUUU==
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBqhQAB2pNNBTv2QAA3I

Remove unnecessary parentheses from the pattrib->pktlen address expression
in issue_asocrsp() to clean up the code and adhere to kernel coding
standards.

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4283844be615..3a1ff22a8a75 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2701,7 +2701,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen - 8),
-				    pstat->bssrateset + 8, &(pattrib->pktlen));
+				    pstat->bssrateset + 8, &pattrib->pktlen);
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
-- 
2.34.1

