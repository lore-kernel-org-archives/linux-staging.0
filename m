Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA751CD15
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 03:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765768396; cv=none; b=q3oPJ/iR+o7rReuxbqNdaEJMpVlwYflYxZ6oHqfry7ofi8aaICbZedK1GlUtgKJqhxBOdh034e0t93XSXrCag62GcJRPh8IcMmvhi06d4SzlROkc7nf3oZezPax2J3KvuHKm1v/fN4vHepD+5NpUJ8j3LRwPCDokHjwI8Rd0p6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765768396; c=relaxed/simple;
	bh=4pxfFewNpFp4CVv5v0c8f/D4LB7Lvw+g4E7JJTHYwwY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SPTQ5tBG4fbVFMMuLLrGfgWKdfdBGiCr4l1EKBdTONdB34HixP+lUV86ANHk3h1q3MpZpcDJEmrqOnXEiT9IBLBbVEBsLROiyZRgS8solgJP4GRPtNLqXMLPjbWaBk0RL/BgUcNhr6uppOQE73WTI6q8J/d4UWc264Cx/vKU7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fa4821e4d96311f0a38c85956e01ac42-20251215
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a925372d-6a62-4225-87ee-2826c6c06d16,IP:15,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-15
X-CID-INFO: VERSION:1.3.6,REQID:a925372d-6a62-4225-87ee-2826c6c06d16,IP:15,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-15
X-CID-META: VersionHash:a9d874c,CLOUDID:f031a08fb9f9d2f1a8027034e100339c,BulkI
	D:251215111309TA99YHIR,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa4821e4d96311f0a38c85956e01ac42-20251215
X-User: pengcan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1409653995; Mon, 15 Dec 2025 11:13:07 +0800
From: Can Peng <pengcan@kylinos.cn>
To: gregkh@linuxfoundation.org,
	weibu@redadmin.org,
	karanja99erick@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Can Peng <pengcan@kylinos.cn>
Subject: [PATCH 1/1] staging: rtl8723bs: use LIST_HEAD for stack-allocated list in xmit cleanup
Date: Mon, 15 Dec 2025 11:11:50 +0800
Message-Id: <20251215031150.49165-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the separate declaration of 'tmplist' and subsequent
INIT_LIST_HEAD() call with LIST_HEAD(), which declares and
initializes the list head in a single idiomatic step. This
improves code clarity and follows common kernel coding patterns
without changing functionality.

Signed-off-by: Can Peng <pengcan@kylinos.cn>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..8c227ddc8e53 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -548,11 +548,10 @@ void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 	struct xmit_buf *pxmitbuf;
 	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
 	struct list_head *plist, *phead;
-	struct list_head tmplist;
+	LIST_HEAD(tmplist);
 
 
 	phead = get_list_head(pqueue);
-	INIT_LIST_HEAD(&tmplist);
 
 	spin_lock_bh(&pqueue->lock);
 	if (!list_empty(&pqueue->queue)) {
-- 
2.25.1

