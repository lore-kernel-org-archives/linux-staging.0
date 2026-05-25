Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373C3D1711
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695190; cv=none; b=uGaXxqtEvpR7HC9uxUkkbbMvmj2YTYZ8L5AbGCStIzCW2KMRyfik060djeFwl5tB/BhoZZfYy3cB0n926f3F4eYD85YdpKo1k0zomM4NJ+++TT5fpba6AIASm4TW4o1CUcgILvhS0Iignq2dVVprB+R8f2CsqY5aeWJ/lhswfwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695190; c=relaxed/simple;
	bh=0wj632bgYmSDdJInEMPNjyJSw9k4yqhecoxwuIZnlJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m21JHWKYnV2i7k44VQkwAb3DyUzf6SzF7RZQNFwmoVgHeW+Z0gLrjaI4XKBOYYC1TOXSo/oTUc9L7uEZ/U0TWA0K87rTH2NIGElgdeOU3XHwjXSlWiEVE7hDxk0lIqzzebMsKLWouuLxra+xkW1CjLq1diJjKtd7XTGY96S0/Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF55QWfd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF55QWfd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bcd3ac3307so54886785ad.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779695188; x=1780299988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7wMezn5P/7XEMTkbT5X0nl1FcmOTHwJPbubUWuSopQ=;
        b=lF55QWfdHbwOEszjq2tJVy2zZoLRp+eyKpw4H/s6TLc5DTKz++uC7Gs5M75Q2gviGl
         BeHThP9BSZZmhJRrBmOSQvqp9QB8bde1w8n2sXP0GAhUSw+qnhFNqefFri/vB2FpFCBh
         zCgE94nnSF32wnw7BAKgmeKCnufPAImulMY9Hl1UKho44F2USf3xhYeL3dCntxC90uFz
         rSvchH5OnpIG3LlMk6qxQAAtnxFYv5iBKfghdptSVnfe5ZohghIWeiILWo7VaYNRJ9Nz
         c5vLy/irz8Hh6MP0+X3Dg/A07uJSI+IOEWiXN1CUwWjcAMz3vT2QRBQ4IOKRZkBV6kli
         BpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695188; x=1780299988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7wMezn5P/7XEMTkbT5X0nl1FcmOTHwJPbubUWuSopQ=;
        b=rkjsIs9X1+IwmA4PXV7gwGXK3LOACyO9zpidzupqmKCASF65AJwCpIGB5MPfMgUt1a
         D5A0Z1pd+Bc2T6y3hg6AJsUh+p98LJ+WsiAMtWww4MnNwh/01Ok2S2WzOyouva7p5USm
         CTaoZM4VzDRRHt1wD+5P6Ije5TmrjVh1NoJnj4TLonCE0A3C+lp8ezwEPHJhZiL4MH+Y
         8RzFg0IFcgPAeubnBMqJAd1XenkEPc0mVfw4JDIy9oKP3PzMY40yrxyuqHLhJRKlpAEs
         uowCofZZoT5jX0KNQ3zXtOS8BLvhLZSxLqS/j6+hhFFm8TwEYRUHMazAEKc4hbcYvW58
         ROdw==
X-Gm-Message-State: AOJu0Yyekg3VWWfi0dHk5AxfJtYPC0tk9a1XRfS26DZwdmqHBAR2bxiB
	NayNYiaTLxCN4agTNQ7vdi5wc/pFLzIVapQ/7j24OiPVxlPPDrLkOZOt
X-Gm-Gg: Acq92OF5pMcWxSGw1GKGejn+/1jCge8I7jCvrmwwXkbcORZTNrU/DRkmWg2eBeN2gr6
	/DBKbZ3GIVejzdA95pj59HQ/V+rzBJkDn4Q3/lur11CYbtPcHj8lXEAsElf2dJke5eTRN1a8pLB
	8NtOMR0UeUomEyk//xENaxrchLtyIOPqeiOBd3ZwwZuoZNkCHBZZzJHcVPKdlGvtMDl9JgdpRD9
	8PN1Y/iAX8GBNE4ekj2UxKOm4doX+HTVIen4SDDO5Usj0UPJclFbrOeunJbL2ZC3cJAfw6VIBIO
	LUCEjKyD3qqDtXqPToYVogKk6sm2hEi3mXhc4SDVw9hpZLDDp97Hh07unKR1MjtatqQHRbINNyq
	+xYSmrD0bKSlbuwjZSxZIi0TeItPrQEEZs0swi0nFrdYNFwcc6Z9mBW/yK39GcOC4L53YEX6J4o
	owQdrwFA1ULjixT/z0aj7/u1nrdcM3
X-Received: by 2002:a17:902:f543:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2beb069c06bmr137208105ad.7.1779695188115;
        Mon, 25 May 2026 00:46:28 -0700 (PDT)
Received: from grand ([2401:4900:1c2b:7e61:dbc5:96cc:845d:a2d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c69a0sm84916885ad.59.2026.05.25.00.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:46:27 -0700 (PDT)
From: Anirban Bose <boses156@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anirban Bose <boses156@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename camelcase variable nSubframe_Length
Date: Mon, 25 May 2026 13:14:19 +0530
Message-ID: <20260525074419.144884-1-boses156@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable 'nSubframe_Length' to 'subframe_len' in
amsdu_to_msdu() and rtw_alloc_msdu_pkt() to resolve a
checkpatch.pl CamelCase warning.

Signed-off-by: Anirban Bose <boses156@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..ddede3ad0e15 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1576,7 +1576,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	return _SUCCESS;
 }
 
-static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
+static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 subframe_len, u8 *pdata)
 {
 	u16 eth_type;
 	struct sk_buff *sub_skb;
@@ -1584,12 +1584,12 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 
 	pattrib = &prframe->u.hdr.attrib;
 
-	sub_skb = __dev_alloc_skb(nSubframe_Length + 12, GFP_ATOMIC);
+	sub_skb = __dev_alloc_skb(subframe_len + 12, GFP_ATOMIC);
 	if (!sub_skb)
 		return NULL;
 
 	skb_reserve(sub_skb, 12);
-	skb_put_data(sub_skb, (pdata + ETH_HLEN), nSubframe_Length);
+	skb_put_data(sub_skb, (pdata + ETH_HLEN), subframe_len);
 
 	eth_type = get_unaligned_be16(&sub_skb->data[6]);
 
@@ -1666,7 +1666,7 @@ static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
 static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 {
 	int	a_len, padding_len;
-	u16 nSubframe_Length;
+	u16 subframe_len;
 	u8 nr_subframes, i;
 	u8 *pdata;
 	struct sk_buff *sub_pkt, *subframes[MAX_SUBFRAME_COUNT];
@@ -1686,12 +1686,12 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 
 	while (a_len > ETH_HLEN) {
 		/* Offset 12 denote 2 mac address */
-		nSubframe_Length = get_unaligned_be16(pdata + 12);
+		subframe_len = get_unaligned_be16(pdata + 12);
 
-		if (a_len < ETH_HLEN + nSubframe_Length)
+		if (a_len < ETH_HLEN + subframe_len)
 			break;
 
-		sub_pkt = rtw_alloc_msdu_pkt(prframe, nSubframe_Length, pdata);
+		sub_pkt = rtw_alloc_msdu_pkt(prframe, subframe_len, pdata);
 		if (!sub_pkt)
 			break;
 
@@ -1704,10 +1704,10 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 		if (nr_subframes >= MAX_SUBFRAME_COUNT)
 			break;
 
-		pdata += nSubframe_Length;
-		a_len -= nSubframe_Length;
+		pdata += subframe_len;
+		a_len -= subframe_len;
 		if (a_len != 0) {
-			padding_len = 4 - ((nSubframe_Length + ETH_HLEN) & (4 - 1));
+			padding_len = 4 - ((subframe_len + ETH_HLEN) & (4 - 1));
 			if (padding_len == 4)
 				padding_len = 0;
 
-- 
2.54.0

