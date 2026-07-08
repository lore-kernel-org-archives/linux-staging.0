Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFA841CB23
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523399; cv=none; b=Hlm0wHrGmRX3tVbI5+8VGuYtaTvv9DaGyDGRBlIYb74Ra4OzFcuZU9B0mwZuvfsWwCwXZR/5L1qrGH/VO/Dw+cB2Y/WCD/PQA7siUv4FfEnIoH2ZPB7gasy/U2GYI3uA4ZYxOn37qou/Uf53BrfANHEzi8NqlyI2EbaaJz0O0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523399; c=relaxed/simple;
	bh=x499UiU43bP2vc4KSCL+qG2t4J/f3jCOIbZgGgyQXyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AEX+0K6J2sfAq4W453thBdDyV1nhQmYe3imCMMeh+Bx45Y0HYz/Np4Lm9tvmAjz5LFbah7Q3+tjHqHCXzafj5wLG608FCVmN1c84EVJJwyLUoBCIkWuTIuR2/Nz2fYbU+ndQM7s8Qadi0mod+RulWGToqFzdEZe3x2WVnfOa9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=YQhp41I0; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="YQhp41I0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Lv
	LNSqaiDRojdyKrbTw/ty/wvlqR7c2lmaHtbC1rbHc=; b=YQhp41I0A2RKsqQ7k4
	2J2CxnYuxOGmAS0g4ruWZXN7EP6xOOnj1ndH4JROiyCAhPrRw81Cm0uX2QpSdh0q
	YXBtwVF8i47GA6V9nUxqm+QmH/0QBEShbZO3oYjfS8MvBvsOwbb53OmULsAt7A6/
	kDmv9CMtMDy1cvIzU3S6jxxYY=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnz2MqaE5qmk9uCg--.53577S6;
	Wed, 08 Jul 2026 23:09:38 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v3 4/5] staging: rtl8723bs: remove unnecessary parentheses in issue_asocrsp
Date: Wed,  8 Jul 2026 23:09:27 +0800
Message-Id: <20260708150928.74065-5-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708150928.74065-1-coolbeaner@126.com>
References: <20260708150928.74065-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PykvCgDnz2MqaE5qmk9uCg--.53577S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1rur4DXr15KFy5Zw4UCFg_yoWkXFXEkF
	4Iqwn7Jw48AFn29a1DGa1SvFW0grWrZa10yF1qqr93Z3y7ZFWrJ3ykWrWDKr13uF45tr97
	Cws2qr1F9w1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRAzVbDUUUUU==
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBqxJUW2pOaDJ7FwAA3k

Remove unnecessary parentheses from the pattrib->pktlen address expression
in issue_asocrsp() to clean up the code and adhere to kernel coding
standards.

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5ea42f054249..ba84b933e25c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2704,7 +2704,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen - 8),
-				    pstat->bssrateset + 8, &(pattrib->pktlen));
+				    pstat->bssrateset + 8, &pattrib->pktlen);
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
-- 
2.34.1

