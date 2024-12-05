Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5980BEC
	for <linux-staging@lists.linux.dev>; Thu,  5 Dec 2024 02:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733365001; cv=none; b=sKP8QjHG2xjb/beVIy1YKrsmFmXis58nwfkQzOW8qYuO5971LSWztAecBZhy7C7+58fiEXpfy7SvBbJJxEmc/xrYyTORIF18xdSZefowGJh8oWsJpmU+7YF2jiyKfKO4lsjKFUKEOihxj4GawbkMS07RTnPo2wh4OxCk5gvKCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733365001; c=relaxed/simple;
	bh=jz6VMcwih2v2HGcMZEC2Jkw3qOH4ttd1IB8smIvO5no=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=alLEaWrs8gCwVyJJ1isnlW/67ODrO9GVn1hJSYcHwiAEUpQpPx+cqrd9BGB8n2Jm368ZktKE5IZOU8wONQt7MPZW12NsVRiYiZHzdlayXaGehHxAJairkg19vT5TueGurHke0Cml48uUcEbSSaCVDpkjS9P/tIHLHe/2qMgPehA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f00278ceb2ae11efa216b1d71e6e1362-20241205
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
X-CID-O-INFO: VERSION:1.1.38,REQID:84d03f79-1c46-4be8-a24a-78d83eaa2997,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:6
X-CID-INFO: VERSION:1.1.38,REQID:84d03f79-1c46-4be8-a24a-78d83eaa2997,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:82c5f88,CLOUDID:047e9994be1e00576ebba47278e7ca9a,BulkI
	D:2412051016304H2V0YIU,BulkQuantity:0,Recheck:0,SF:19|24|38|43|66|72|74|10
	2,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_ULN
X-UUID: f00278ceb2ae11efa216b1d71e6e1362-20241205
X-User: zhaochenguang@kylinos.cn
Received: from localhost.localdomain [(223.70.160.239)] by mailgw.kylinos.cn
	(envelope-from <zhaochenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 3375468; Thu, 05 Dec 2024 10:16:29 +0800
From: Chenguang Zhao <zhaochenguang@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chenguang Zhao <zhaochenguang@kylinos.cn>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: Cleanups for rtw_inc_and_chk_continual_io_error
Date: Thu,  5 Dec 2024 10:16:10 +0800
Message-Id: <20241205021610.523528-1-zhaochenguang@kylinos.cn>
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

In addition, also rename 'value' variable to 'error_count' and drop
'ret' variable.

Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
---
v2:
 - rename 'value' variable to 'error_count' and drop 'ret' variable
 as Dan suggested.
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fcda9db6ebb5..79d543d88278 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -141,12 +141,12 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
-	int ret = false;
-	int value = atomic_inc_return(&dvobj->continual_io_error);
-	if (value > MAX_CONTINUAL_IO_ERR)
-		ret = true;
+	int error_count = atomic_inc_return(&dvobj->continual_io_error);
 
-	return ret;
+	if (error_count > MAX_CONTINUAL_IO_ERR)
+		return true;
+
+	return false;
 }
 
 /*
-- 
2.25.1

