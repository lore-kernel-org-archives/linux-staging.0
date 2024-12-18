Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826E5473C
	for <linux-staging@lists.linux.dev>; Wed, 18 Dec 2024 02:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734490418; cv=none; b=Evl+WbFSCllq9uEA+71/Lq1zvlihX70RBAOA2dHZtVYVBgeIAhq5PMXfDrUZd/VYCFI3lrsMCb6wmne6UDNVi0fNyJ/7wTdFLI0kvtZNR/bn8KVkv64EUBHzzzSTZ2UhjaixmzN2WjAZE1u33r6W0u+af44h0ePp1VObPzu7ESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734490418; c=relaxed/simple;
	bh=P13MpzFB28MXXAI9pAmD8x9mJmi7UrWXJDnsPidwUbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M0qkLZ6Ba50TXD1UpJeF0RNGQV7iVQRLVfnKdfDgqXVkA2Og/x89tXQ4Tg0ybiilIPcnk4Y9b63DOY7RHi6Wh3NXCSA8sbraqhqPCOL1C2RDKFo8SvlXmmgftN6fEwLgmUV90rtfIJA2xZ3nHpAVgk9q+8jAtghStzjBVwgDD7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3e94f322bceb11efa216b1d71e6e1362-20241218
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7af7a8ff-ea22-4af3-b512-c4ab1afb936b,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-10
X-CID-INFO: VERSION:1.1.41,REQID:7af7a8ff-ea22-4af3-b512-c4ab1afb936b,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-10
X-CID-META: VersionHash:6dc6a47,CLOUDID:46106bf9ae48c36350ad67386fbc80e4,BulkI
	D:2412181053233PHOL3KN,BulkQuantity:0,Recheck:0,SF:17|19|24|38|44|66|78|10
	2,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULN
X-UUID: 3e94f322bceb11efa216b1d71e6e1362-20241218
X-User: zhaochenguang@kylinos.cn
Received: from localhost.localdomain [(223.70.160.239)] by mailgw.kylinos.cn
	(envelope-from <zhaochenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 989597429; Wed, 18 Dec 2024 10:53:22 +0800
From: Chenguang Zhao <zhaochenguang@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chenguang Zhao <zhaochenguang@kylinos.cn>,
	linux-staging@lists.linux.dev
Subject: [RESEND PATCH v2] staging: rtl8723bs: Cleanups for rtw_inc_and_chk_continual_io_error
Date: Wed, 18 Dec 2024 10:53:09 +0800
Message-Id: <20241218025309.948-1-zhaochenguang@kylinos.cn>
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

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
---
RESEND:
 - add Dan's reviewed-by tag.
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

