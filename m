Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A4B189BB3
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733300030; cv=none; b=PwgeTRxx1uSN8QttYtP2tNO4BkheKyGQiNJhMrtSyBvZdYsUfaL5EVQeNqR+Hdk7BwKP7qLJMPRHTjHTZMDJyMBuPiDHiYx/WPBS8qE1l29syHXLX/MYPbRYpIenscQSZU9SZeKYyj9NjfL2j1GVhCBZa2m5Q2DKAChhgOSuA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733300030; c=relaxed/simple;
	bh=wH70K2GOIxi0/t3zWwyO/QSXnTwU089RcBu5wjo/mlg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JE2Cu2r/rOqCxHYUh8mviuC52Ib4NXlY6OjZA6PacMQqP8tvlgvIBhSYvaiLrrIKo3QW2MTx0JJTr5AeU04WybB0keV10YUuCFKM15xJPNLgsUXwuWKCs0MKPskPTTOI23XIGjwVQnSXjFf9XFMGosriAXU/1RkSNKVrAJyN5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a4793b00b21711efa216b1d71e6e1362-20241204
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED
	SA_UNFAMILIAR, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:c6b3aa05-931b-441c-8cab-5b7ce3913e65,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:6
X-CID-INFO: VERSION:1.1.38,REQID:c6b3aa05-931b-441c-8cab-5b7ce3913e65,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:82c5f88,CLOUDID:d130fbfea83dda00315248486d4b7898,BulkI
	D:241204152336OJ3S9VF6,BulkQuantity:2,Recheck:0,SF:19|24|38|43|66|72|74|10
	2,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,RT:nil,Bulk:40,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: a4793b00b21711efa216b1d71e6e1362-20241204
X-User: zhaochenguang@kylinos.cn
Received: from localhost.localdomain [(223.70.160.239)] by mailgw.kylinos.cn
	(envelope-from <zhaochenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1172613489; Wed, 04 Dec 2024 16:13:28 +0800
From: Chenguang Zhao <zhaochenguang@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Chenguang Zhao <zhaochenguang@kylinos.cn>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: Add a blank line after declarations
Date: Wed,  4 Dec 2024 16:13:14 +0800
Message-Id: <20241204081314.194701-1-zhaochenguang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a warning when using checkpatch.pl check rtw_io.c:

    WARNING: Missing a blank line after declarations
    146: FILE: drivers/staging/rtl8723bs/core/rtw_io.c:146:
    int value = atomic_inc_return(&dvobj->continual_io_error);
    if (value > MAX_CONTINUAL_IO_ERR)

The patch fixes it.

Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fcda9db6ebb5..fb72d64f4403 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -143,6 +143,7 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
 	int ret = false;
 	int value = atomic_inc_return(&dvobj->continual_io_error);
+
 	if (value > MAX_CONTINUAL_IO_ERR)
 		ret = true;
 
-- 
2.25.1

