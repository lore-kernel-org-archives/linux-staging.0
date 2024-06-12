Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A318E3F
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162556; cv=none; b=e+hhjC0QAcxKKWDvADWDDR5QwHH1xIGXM+SLofqi+8y9oEWHUSy2xfPQZuRAHoWxNX8Zs/b8TcM7gaMR4fJcP3iIdHKoxEFrFEMezs58s2andA3XB3lyaN5kgo+cQ+2P2UJmhuTqeq2dEXQ13pIT14Ek0bc75/pZCii8vkIkU6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162556; c=relaxed/simple;
	bh=LaU6dQaJxZXXUJQeF0eU9sdx2/otptNdwAGBmWkZyaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tB0TaHelsMtWkHiQVVuKjY+B/vLlYVjD44igXLeLKC6GFxTfcrx/BgovGzYTAXNaPL9yM+23tz1Nyomblt0jdXucqxnAoI2ClSoCqTcosnBwvScEeAAfnZvUjv22OFd6JtJgQkKahX6h/vAskMPrjVAuDX/DUxoV7WSg2c9qMII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=SrOJ4pdJ; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SrOJ4pdJ"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7eb9e7f3da2so86128439f.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162554; x=1718767354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9ddKnwqsJlVTx2fCcXGsBbSpiYsicphmf2Gt297Zag=;
        b=SrOJ4pdJTGUCU7w3Ttnw9r54Mt7BJ80A2lDGO6rsJD2/pnBKzFLxtaYn21Zwcckn3G
         NhxICp94P7MTXNtOBFMCjpj4gZQtTLqKjHBhkpGzNU/uRs5Fez5+AFEWSd7PHjOslrPp
         1QOQXfhtzBvR6eNAZz2OslYgSLCptHb/43yU0kpilgKUehmaIRGYCasKJVeEIEM35U0r
         wpiB8G+Ttgxe+ObwHt/c696TNkYQwvOkJ6F1Qep5AB1tMaei3xWmwtG6MlhE8YNy2UBs
         ywdVd2ENTnFUxGqFyy0xhgN6XSqYkqmfSAJrKR7sMsXZwT9xoXfHaIrCPW5Wpt43JSP6
         /Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162554; x=1718767354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9ddKnwqsJlVTx2fCcXGsBbSpiYsicphmf2Gt297Zag=;
        b=I1+6FBG+eiYRzEVk8x1X2hDzAuYK42R+rvQTYJ4FafSQ63a3qa3IGLQsDhSI0FBE59
         o/ViqknV1+hQITitJqmILAe1Rfl5BLY+NdFDIaFuYdFhaZ+6/fou0fwRpyVV4l963dnF
         CH8pFBSy7X+JdVe6B8o9PAaTOLg+LfKJiTt4kIb6lkhrIYWZ4hkdcO0Rnlm2+GglMyw7
         x+4ZG7R78w4TcR8kFoQe8ff7PwMD6SzA+2QXlQLY2WJ1VRF1FM/SMPuNRpCZDxaw/KTw
         /o1NQKPp7j3/KpZaRFLsFqT14GqYmxejdmkv7Iez7p7/0PAGVYVA3EdzrcYUZCWRU5NV
         F+0Q==
X-Gm-Message-State: AOJu0YynmzlEk/VZ3Iiqx6rCcTxujqeXqmFASoWuXEWXks5PICS39dYm
	GAMoCrWLkHIzco/9vNXBcw69aSwCJBNC5ohI2YiVRcgggOH4z+djjEA3JvKHa/o=
X-Google-Smtp-Source: AGHT+IHHz3bKu1atGUUrnNmNiCS5fZ/nu6nktF9MFYPNfiVFZU2nkjAfyA4uugdWzGNSMg5LI/sPlw==
X-Received: by 2002:a05:6e02:216f:b0:375:a48d:fd9e with SMTP id e9e14a558f8ab-375cd1d1e96mr6679325ab.24.1718162554091;
        Tue, 11 Jun 2024 20:22:34 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:33 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 01/24] Staging: rtl8192e: Rename variable bHwSec
Date: Tue, 11 Jun 2024 20:22:07 -0700
Message-Id: <20240612032230.9738-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bHwSec to hw_sec
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  2 +-
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c   |  4 ++--
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c   | 10 +++++-----
 drivers/staging/rtl8192e/rtllib_crypt_wep.c    |  4 ++--
 drivers/staging/rtl8192e/rtllib_rx.c           |  8 ++++----
 drivers/staging/rtl8192e/rtllib_tx.c           |  6 +++---
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index a0fc33f984e8..27dfa268cd68 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -934,7 +934,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 
 	pdesc->NoEnc = 1;
 	pdesc->SecType = 0x0;
-	if (cb_desc->bHwSec) {
+	if (cb_desc->hw_sec) {
 		static u8 tmp;
 
 		if (!tmp)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 62af48c20229..46bc3561f56f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -105,7 +105,7 @@ struct cb_desc {
 	u8 bCmdOrInit:1;
 	u8 tx_dis_rate_fallback:1;
 	u8 tx_use_drv_assinged_rate:1;
-	u8 bHwSec:1;
+	u8 hw_sec:1;
 
 	u8 nStuckCount;
 
diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index cbb8c8dbe9b0..230552dd2b4d 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -182,7 +182,7 @@ static int rtllib_ccmp_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	*pos++ = key->tx_pn[0];
 
 	hdr = (struct ieee80211_hdr *)skb->data;
-	if (!tcb_desc->bHwSec) {
+	if (!tcb_desc->hw_sec) {
 		struct aead_request *req;
 		struct scatterlist sg[2];
 		u8 *aad = key->tx_aad;
@@ -265,7 +265,7 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 		key->dot11rsna_stats_ccmp_replays++;
 		return -4;
 	}
-	if (!tcb_desc->bHwSec) {
+	if (!tcb_desc->hw_sec) {
 		size_t data_len = skb->len - hdr_len - CCMP_HDR_LEN;
 		struct aead_request *req;
 		struct scatterlist sg[2];
diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index 0244b524a7d4..a45fcb13bd54 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -268,7 +268,7 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 
 	hdr = (struct ieee80211_hdr *)skb->data;
 
-	if (!tcb_desc->bHwSec) {
+	if (!tcb_desc->hw_sec) {
 		if (!tkey->tx_phase1_done) {
 			tkip_mixing_phase1(tkey->tx_ttak, tkey->key, hdr->addr2,
 					   tkey->tx_iv32);
@@ -285,7 +285,7 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	memmove(pos, pos + 8, hdr_len);
 	pos += hdr_len;
 
-	if (tcb_desc->bHwSec) {
+	if (tcb_desc->hw_sec) {
 		*pos++ = Hi8(tkey->tx_iv16);
 		*pos++ = (Hi8(tkey->tx_iv16) | 0x20) & 0x7F;
 		*pos++ = Lo8(tkey->tx_iv16);
@@ -301,7 +301,7 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	*pos++ = (tkey->tx_iv32 >> 16) & 0xff;
 	*pos++ = (tkey->tx_iv32 >> 24) & 0xff;
 
-	if (!tcb_desc->bHwSec) {
+	if (!tcb_desc->hw_sec) {
 		icv = skb_put(skb, 4);
 		crc = ~crc32_le(~0, pos, len);
 		icv[0] = crc;
@@ -319,7 +319,7 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 		tkey->tx_iv32++;
 	}
 
-	if (!tcb_desc->bHwSec)
+	if (!tcb_desc->hw_sec)
 		return ret;
 	return 0;
 }
@@ -371,7 +371,7 @@ static int rtllib_tkip_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	iv32 = pos[4] | (pos[5] << 8) | (pos[6] << 16) | (pos[7] << 24);
 	pos += 8;
 
-	if (!tcb_desc->bHwSec || (skb->cb[0] == 1)) {
+	if (!tcb_desc->hw_sec || (skb->cb[0] == 1)) {
 		if ((iv32 < tkey->rx_iv32 ||
 		     (iv32 == tkey->rx_iv32 && iv16 <= tkey->rx_iv16)) &&
 		     tkey->initialized) {
diff --git a/drivers/staging/rtl8192e/rtllib_crypt_wep.c b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
index 21c2b7666d6f..bd732c562b82 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_wep.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
@@ -102,7 +102,7 @@ static int prism2_wep_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	/* Copy rest of the WEP key (the secret part) */
 	memcpy(key + 3, wep->key, wep->key_len);
 
-	if (!tcb_desc->bHwSec) {
+	if (!tcb_desc->hw_sec) {
 		/* Append little-endian CRC32 and encrypt it to produce ICV */
 		crc = ~crc32_le(~0, pos, len);
 		icv = skb_put(skb, 4);
@@ -155,7 +155,7 @@ static int prism2_wep_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	/* Apply RC4 to data and compute CRC32 over decrypted data */
 	plen = skb->len - hdr_len - 8;
 
-	if (!tcb_desc->bHwSec) {
+	if (!tcb_desc->hw_sec) {
 		arc4_setkey(&wep->rx_ctx_arc4, key, klen);
 		arc4_crypt(&wep->rx_ctx_arc4, pos, pos, plen + 4);
 
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 86b8d342ac80..3bff54efe66e 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -282,10 +282,10 @@ rtllib_rx_frame_decrypt(struct rtllib_device *ieee, struct sk_buff *skb,
 		struct cb_desc *tcb_desc = (struct cb_desc *)
 						(skb->cb + MAX_DEV_ADDR_SIZE);
 
-		tcb_desc->bHwSec = 1;
+		tcb_desc->hw_sec = 1;
 
 		if (ieee->need_sw_enc)
-			tcb_desc->bHwSec = 0;
+			tcb_desc->hw_sec = 0;
 	}
 
 	hdr = (struct ieee80211_hdr *)skb->data;
@@ -321,10 +321,10 @@ rtllib_rx_frame_decrypt_msdu(struct rtllib_device *ieee, struct sk_buff *skb,
 		struct cb_desc *tcb_desc = (struct cb_desc *)
 						(skb->cb + MAX_DEV_ADDR_SIZE);
 
-		tcb_desc->bHwSec = 1;
+		tcb_desc->hw_sec = 1;
 
 		if (ieee->need_sw_enc)
-			tcb_desc->bHwSec = 0;
+			tcb_desc->hw_sec = 0;
 	}
 
 	hdr = (struct ieee80211_hdr *)skb->data;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index b1bde5c0050a..87d1ff943617 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -751,14 +751,14 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 
 		if (encrypt) {
 			if (ieee->hwsec_active)
-				tcb_desc->bHwSec = 1;
+				tcb_desc->hw_sec = 1;
 			else
-				tcb_desc->bHwSec = 0;
+				tcb_desc->hw_sec = 0;
 			skb_reserve(skb_frag,
 				    crypt->ops->extra_mpdu_prefix_len +
 				    crypt->ops->extra_msdu_prefix_len);
 		} else {
-			tcb_desc->bHwSec = 0;
+			tcb_desc->hw_sec = 0;
 		}
 		frag_hdr = skb_put_data(skb_frag, &header, hdr_len);
 
-- 
2.30.2

