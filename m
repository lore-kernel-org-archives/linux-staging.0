Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B58494A15
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001748; cv=none; b=kXpwj3Kns67p/VKK6eWSCiLgAClhJg/7HSKydg06OJW+f57D76tCudIotqDYx6bCZKEWs/hlUHhSrjMxjw/V/x3UMSTzB1OXO/kGxiW9RA8bc1leYE7162gO6JwgDKnf8KlfuUUGgajodlE6YIy6KPMCaABT3/YNXC2hmERpBd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001748; c=relaxed/simple;
	bh=JPZzn7zMNDqGfRZl0IeSI470609vvY5b/O/uV34wxbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0WzNClIIHIexsVqTzxECtvAa+cO2ciukTm+naidz72DHkpJDZu8dRvCStKRd7uYS0dchzDKIUUHrcAzbMdBP4uY7AQ9fzu3rEvdUWQNeM18YHiq9cr+2nG5erXId7eA/fTvzRr8TrYNspS9Lnsf8myXohJteN9Y6w8NjBwLT5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4bJ/xjS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4bJ/xjS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a786a9a35so2942337f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778001746; x=1778606546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/oPGZFJKTQjbJdiq9IFnoXRIzpps50+CWvpXCFG74k=;
        b=j4bJ/xjSKpBPlCffRAKKN4zY7hWfCrR/g7ELf8SUir17VlzSBST7S4oMYgaDD2tO5q
         m1jT3Zp9ZgizzQ06x9BYVddqG4eXa7fXkeSagFGUTrYIsXey2EmMs9X+7z1sPuFAePY8
         BZlPqbixgY/Kzm6qgeH2Xph0cwfK9sEIR9o9199Kie5fFboxBxsjGAkv64u5i5usJ2dh
         U9tZWARl3ojnoboGYO6U3Ils3DD6kRQ/75vZK8cL2L06HEEtt7kxb8XkGogpnqrFwbTq
         8mglLWFmGgXX3s7cdn1REqmiSAA10UGBEseuaCWKtvbrbDq4YuoBGbbaOd5y9mpkx6JB
         6akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001746; x=1778606546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/oPGZFJKTQjbJdiq9IFnoXRIzpps50+CWvpXCFG74k=;
        b=n4CYoqdhy6kWuV+oAzOSIf+hwaLsBiM4W86J2mSeMerhcGuxxG11FUmEdXHlyBxuj/
         9V+7xKWjqbi440cHD2De0SOd+R2str09B+CpyjAkvDQv6XQMWyeNDDlSvXcJm4HdE9iN
         nNLXHaXawrMy2rCmQS1289K+XgEeyXXAzZ4iBLAsz2LHtoghu9DjZim+JygQu3MDyvdE
         5+OkTWCDIsAvqDNXnWrZunpW6P6/6N7lYXZVlEIGkjHSO4g7Wrs9G3T4oNbHrevOYjdr
         qeSo3g2pN/GWEeVnpxvd3YxZbZRpOslmDSQw48m3GGKFd8i6+S61lizWXEjYzojKVyNZ
         oznA==
X-Gm-Message-State: AOJu0YwAC9XobO9OptgKEhzkPnznAiPLocRWspuz2E+0XWACAeA0BvPn
	TXWBxBXXS5i0n0Z9QhzqcAlAk80tAPSRWHbrrbHGTcKOfP/OcicdV+ucD4LA8w==
X-Gm-Gg: AeBDiethFTmsP5Ly9WPGCdjneEj0ixWd+UuoCAs83dgh5b8JmfUToGNyjshn89b36VJ
	0m9I2Vtpt3uXs8955MkHIm23p+0z1usXe5ryPTt87sqe091hvYgNiSiQtqMAcLiQYYNxRlRK5km
	Bb6W0/BWrgbIOvNaIk9BLU1QiuZhqOm/kqjbggDJPcX9ZeMQPt595TGOInBX3UhRNHZFF6mhteT
	CvpEqzRpOYR3I5eyOTy8zjgFptXHH5TLVJ2fpM6yuEOUtuCUQ4wbWBPn+Le2flCUBQbA0MhybYU
	OcwcE8NMUUpWteK6lvaV3kZOoKNqK5UxT2LPJcNUjJlOiYmatL9cPkivUR3WBeP/VIVxg0S1EMf
	EYvQVyP6srB+ZqEn2XclTOBVhaP7cgRt5ugxeiUT+WMh6EPAqodmGuLJPZi4DsA9We5f5Wky0sR
	Sb8WT42eZ8pCk0/AGDYUOZ07xjGblqbG4rCB2UQZTj64roe1BmssKSQTIWk3IeiixDR8ikIw699
	fOqmO5FzC+b0XjfkP4ntLRpN6/CJQoY9wStEAwi0yVPG7qnCt7Lt1b6xbFq8l7Ve2IPo12wXW82
	08Pcsg==
X-Received: by 2002:a05:6000:26c2:b0:449:c5e2:a8ad with SMTP id ffacd0b85a97d-4515b524480mr55229f8f.11.1778001745557;
        Tue, 05 May 2026 10:22:25 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm6640747f8f.28.2026.05.05.10.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:22:25 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 2/2] staging: rtl8723bs: fix OOB reads in OnAssocRsp() IE parsing
Date: Tue,  5 May 2026 19:22:14 +0200
Message-ID: <20260505172214.3650398-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505172214.3650398-1-hossu.alexandru@gmail.com>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com>
 <20260505172214.3650398-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three out-of-bounds read paths in OnAssocRsp():

1. Missing minimum frame length check before fixed field reads.

   Before entering the IE loop the function reads capability, status,
   and AID from fixed offsets relative to pframe + WLAN_HDR_A3_LEN
   (at offsets +0, +2, and +4 respectively, so 6 bytes total).  There
   is no check that pkt_len is large enough to cover these fields.  A
   malicious AP can send a truncated Association Response frame shorter
   than WLAN_HDR_A3_LEN + 6 bytes, causing out-of-bounds reads and
   loading garbage into MLME state variables.

2. IE header and payload may extend past the packet end.

   The IE loop advances by pIE->length + 2 per iteration but only
   guards on i < pkt_len.  When the last IE has only one byte left in
   the frame, the loop reads pIE->length from pframe[pkt_len], one
   byte past the receive buffer.  Even when the header bytes are in
   bounds, pIE->length can point the data window past pkt_len, silently
   passing a truncated IE to the handler functions.

3. WMM OUI comparison reads 6 bytes past a possibly short IE payload.

   For WLAN_EID_VENDOR_SPECIFIC, the code calls memcmp(pIE->data,
   WMM_PARA_OUI, 6) without checking that pIE->length is at least 6.
   An attacker can craft a vendor-specific IE at the end of the frame
   with pIE->length smaller than 6.  The existing IE bounds check only
   confirms the declared payload fits within pkt_len, not that it is
   large enough for the 6-byte OUI comparison.

Fix all three:
  - Return _FAIL immediately if pkt_len < WLAN_HDR_A3_LEN + 6.
  - Add two guards in the IE loop: break if fewer than sizeof(*pIE)
    bytes remain, and break if the declared IE payload extends past
    pkt_len.
  - Guard the WMM OUI comparison with pIE->length >= 6.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v4:
  - Add pkt_len < WLAN_HDR_A3_LEN + 6 check before reading the three
    fixed fields (capability, status, AID) to prevent OOB reads from
    truncated frames. Caught by sashiko review of v3.
  - Add pIE->length >= 6 guard before the 6-byte WMM OUI memcmp to
    prevent reading past a short IE payload. Caught by sashiko.

Changes in v2:
  - Add IE header bounds check: break if i + sizeof(*pIE) > pkt_len.
  - Add IE payload bounds check: break if the declared IE data extends
    past pkt_len.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..84cc814f069c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1379,6 +1379,9 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 
 	timer_delete_sync(&pmlmeext->link_timer);
 
+	if (pkt_len < WLAN_HDR_A3_LEN + 6)
+		return _FAIL;
+
 	/* status */
 	status = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 2));
 	if (status > 0) {
@@ -1400,11 +1403,16 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
 	/* for not to handle the synchronous IO in the tasklet */
 	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
+		if (i + sizeof(*pIE) > pkt_len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + i);
+		if (i + sizeof(*pIE) + pIE->length > pkt_len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if (!memcmp(pIE->data, WMM_PARA_OUI, 6))	/* WMM */
+			if (pIE->length >= 6 &&
+			    !memcmp(pIE->data, WMM_PARA_OUI, 6))	/* WMM */
 				WMM_param_handler(padapter, pIE);
 			break;
 
-- 
2.53.0

