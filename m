Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA011C9A
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:07:46 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4047ef37f55so1660365e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794065; x=1695398865; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncph5CZexW9We6WezbStn7amj7O6xH1iwRr3VCr+5No=;
        b=MOfMaO68RixczSuV873knNEJShURws3tIt+A7mLCr9/JcYH3T1A4Orwg5o09TxV70+
         pT1jhGZwePDuJGVq1T6pXmaqVUnkzENtL/0yQ1XpCZNBNqSlS5X0cy+jZZ1Jk4znIdKM
         YCOaALWnbq4QoKANfoSgc/6zEorZbwk3uok53jV2QpIkl/33R+O4q2jaFPnItFgz+zZS
         oQBFnlJblaMGStDwlW2HCyfWztAndH4gfepvxRKmvSrP3QmbZWePV3jXOSg03dDszXSk
         URTeHD5nq2y4WmHHDKtQwqhB2AP7He+9BNi23pOi8SPHo4zBoidrl/r8LwzX5XdTaGrc
         f2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794065; x=1695398865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncph5CZexW9We6WezbStn7amj7O6xH1iwRr3VCr+5No=;
        b=t6UkwBdXIAlvqemKYRxUlFD0wl1qwhgQ+zasdDBAJNKtOfYlAIU2LhkxEYz7o/99YJ
         8OTfdcYqtGdwOBqnoRU40A7MndxYsqvxZ8KFkVvC5z5vUyy+GKoxsZqN2M8waf2dTxUt
         sTuOqPWc/QrUSw1fzxCsJg1qnZnQcQ1sTVVAFRHd4BJZ2XLYlIzoU+1MZU/J3xlnSimf
         Pa8YhdIKC8St+Tjwy9IcTVwwDsrkPl5xr4clMFN/DPiPmphl8ujoYuahlgz8N/oHRWi5
         GIvdLTjUGFzYPQYOEzNt9+m+2TZn30yk0ufp0NobCoLgqzSArG6eaZ/N9y7b45GFKYCk
         KuUw==
X-Gm-Message-State: AOJu0Yzz1EzPstoEixrHwSj2sZ40uNGxK2Li7S8jwhpWNOa0r7UHqLwt
	RPC3aQcy1stRPwj6N+fGlGN0s/l0LKMw1Q==
X-Google-Smtp-Source: AGHT+IGOT/xnETxLKyDTThowNdS754Ym3aj6G+n144gWatSq6v+KRmw4LbBKPyVe0l9ooADpm6mmzA==
X-Received: by 2002:a05:600c:3ba3:b0:401:c392:d28d with SMTP id n35-20020a05600c3ba300b00401c392d28dmr1902210wms.2.1694794064932;
        Fri, 15 Sep 2023 09:07:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc445000000b003fee849df23sm5029379wmi.22.2023.09.15.09.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:07:44 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:07:43 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/16] staging: rtl8192e: Replace struct rtllib_hdr_4addr in
 rtllib_crypt*.c
Message-ID: <6bbbe6617e62fb9e04b4bc23f8bac6c31befcfa8.1694792595.git.philipp.g.hortmann@gmail.com>
References: <cover.1694792595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694792595.git.philipp.g.hortmann@gmail.com>

Replace struct rtllib_hdr_4addr with struct ieee80211_hdr to avoid
proprietary code in rtllib_crypt_tkip.c and rtllib_crypt_ccmp.c.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 14 ++++-----
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 32 ++++++++++----------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index f88096bcb181..8e4514cc132c 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -83,7 +83,7 @@ static void rtllib_ccmp_deinit(void *priv)
 	kfree(priv);
 }
 
-static int ccmp_init_iv_and_aad(struct rtllib_hdr_4addr *hdr,
+static int ccmp_init_iv_and_aad(struct ieee80211_hdr *hdr,
 				u8 *pn, u8 *iv, u8 *aad)
 {
 	u8 *pos, qc = 0;
@@ -91,7 +91,7 @@ static int ccmp_init_iv_and_aad(struct rtllib_hdr_4addr *hdr,
 	u16 fc;
 	int a4_included, qc_included;
 
-	fc = le16_to_cpu(hdr->frame_ctl);
+	fc = le16_to_cpu(hdr->frame_control);
 	a4_included = ((fc & (RTLLIB_FCTL_TODS | RTLLIB_FCTL_FROMDS)) ==
 		       (RTLLIB_FCTL_TODS | RTLLIB_FCTL_FROMDS));
 
@@ -134,7 +134,7 @@ static int ccmp_init_iv_and_aad(struct rtllib_hdr_4addr *hdr,
 	memcpy(&aad[2], &hdr->addr1, ETH_ALEN);
 	memcpy(&aad[8], &hdr->addr2, ETH_ALEN);
 	memcpy(&aad[14], &hdr->addr3, ETH_ALEN);
-	pos = (u8 *)&hdr->seq_ctl;
+	pos = (u8 *)&hdr->seq_ctrl;
 	aad[20] = pos[0] & 0x0f;
 	aad[21] = 0; /* all bits masked */
 	memset(aad + 22, 0, 8);
@@ -153,7 +153,7 @@ static int rtllib_ccmp_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	struct rtllib_ccmp_data *key = priv;
 	int i;
 	u8 *pos;
-	struct rtllib_hdr_4addr *hdr;
+	struct ieee80211_hdr *hdr;
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb +
 				    MAX_DEV_ADDR_SIZE);
 	if (skb_headroom(skb) < CCMP_HDR_LEN ||
@@ -182,7 +182,7 @@ static int rtllib_ccmp_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	*pos++ = key->tx_pn[1];
 	*pos++ = key->tx_pn[0];
 
-	hdr = (struct rtllib_hdr_4addr *)skb->data;
+	hdr = (struct ieee80211_hdr *)skb->data;
 	if (!tcb_desc->bHwSec) {
 		struct aead_request *req;
 		struct scatterlist sg[2];
@@ -220,7 +220,7 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 {
 	struct rtllib_ccmp_data *key = priv;
 	u8 keyidx, *pos;
-	struct rtllib_hdr_4addr *hdr;
+	struct ieee80211_hdr *hdr;
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb +
 				    MAX_DEV_ADDR_SIZE);
 	u8 pn[6];
@@ -230,7 +230,7 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 		return -1;
 	}
 
-	hdr = (struct rtllib_hdr_4addr *)skb->data;
+	hdr = (struct ieee80211_hdr *)skb->data;
 	pos = skb->data + hdr_len;
 	keyidx = pos[3];
 	if (!(keyidx & (1 << 5))) {
diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index 9fdfcc017ee6..b7f9ea0e4f51 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -255,7 +255,7 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	struct rtllib_tkip_data *tkey = priv;
 	int len;
 	u8 *pos;
-	struct rtllib_hdr_4addr *hdr;
+	struct ieee80211_hdr *hdr;
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb +
 				    MAX_DEV_ADDR_SIZE);
 	int ret = 0;
@@ -266,7 +266,7 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	    skb->len < hdr_len)
 		return -1;
 
-	hdr = (struct rtllib_hdr_4addr *)skb->data;
+	hdr = (struct ieee80211_hdr *)skb->data;
 
 	if (!tcb_desc->bHwSec) {
 		if (!tkey->tx_phase1_done) {
@@ -330,7 +330,7 @@ static int rtllib_tkip_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	u8 keyidx, *pos;
 	u32 iv32;
 	u16 iv16;
-	struct rtllib_hdr_4addr *hdr;
+	struct ieee80211_hdr *hdr;
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb +
 				    MAX_DEV_ADDR_SIZE);
 	u8 rc4key[16];
@@ -341,7 +341,7 @@ static int rtllib_tkip_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	if (skb->len < hdr_len + 8 + 4)
 		return -1;
 
-	hdr = (struct rtllib_hdr_4addr *)skb->data;
+	hdr = (struct ieee80211_hdr *)skb->data;
 	pos = skb->data + hdr_len;
 	keyidx = pos[3];
 	if (!(keyidx & (1 << 5))) {
@@ -465,10 +465,10 @@ static int michael_mic(struct crypto_shash *tfm_michael, u8 *key, u8 *hdr,
 
 static void michael_mic_hdr(struct sk_buff *skb, u8 *hdr)
 {
-	struct rtllib_hdr_4addr *hdr11;
+	struct ieee80211_hdr *hdr11;
 
-	hdr11 = (struct rtllib_hdr_4addr *)skb->data;
-	switch (le16_to_cpu(hdr11->frame_ctl) &
+	hdr11 = (struct ieee80211_hdr *)skb->data;
+	switch (le16_to_cpu(hdr11->frame_control) &
 		(RTLLIB_FCTL_FROMDS | RTLLIB_FCTL_TODS)) {
 	case RTLLIB_FCTL_TODS:
 		ether_addr_copy(hdr, hdr11->addr3); /* DA */
@@ -501,9 +501,9 @@ static int rtllib_michael_mic_add(struct sk_buff *skb, int hdr_len, void *priv)
 {
 	struct rtllib_tkip_data *tkey = priv;
 	u8 *pos;
-	struct rtllib_hdr_4addr *hdr;
+	struct ieee80211_hdr *hdr;
 
-	hdr = (struct rtllib_hdr_4addr *)skb->data;
+	hdr = (struct ieee80211_hdr *)skb->data;
 
 	if (skb_tailroom(skb) < 8 || skb->len < hdr_len) {
 		netdev_dbg(skb->dev,
@@ -514,7 +514,7 @@ static int rtllib_michael_mic_add(struct sk_buff *skb, int hdr_len, void *priv)
 
 	michael_mic_hdr(skb, tkey->tx_hdr);
 
-	if (RTLLIB_QOS_HAS_SEQ(le16_to_cpu(hdr->frame_ctl)))
+	if (RTLLIB_QOS_HAS_SEQ(le16_to_cpu(hdr->frame_control)))
 		tkey->tx_hdr[12] = *(skb->data + hdr_len - 2) & 0x07;
 	pos = skb_put(skb, 8);
 	if (michael_mic(tkey->tx_tfm_michael, &tkey->key[16], tkey->tx_hdr,
@@ -525,7 +525,7 @@ static int rtllib_michael_mic_add(struct sk_buff *skb, int hdr_len, void *priv)
 }
 
 static void rtllib_michael_mic_failure(struct net_device *dev,
-				       struct rtllib_hdr_4addr *hdr,
+				       struct ieee80211_hdr *hdr,
 				       int keyidx)
 {
 	union iwreq_data wrqu;
@@ -550,15 +550,15 @@ static int rtllib_michael_mic_verify(struct sk_buff *skb, int keyidx,
 {
 	struct rtllib_tkip_data *tkey = priv;
 	u8 mic[8];
-	struct rtllib_hdr_4addr *hdr;
+	struct ieee80211_hdr *hdr;
 
-	hdr = (struct rtllib_hdr_4addr *)skb->data;
+	hdr = (struct ieee80211_hdr *)skb->data;
 
 	if (!tkey->key_set)
 		return -1;
 
 	michael_mic_hdr(skb, tkey->rx_hdr);
-	if (RTLLIB_QOS_HAS_SEQ(le16_to_cpu(hdr->frame_ctl)))
+	if (RTLLIB_QOS_HAS_SEQ(le16_to_cpu(hdr->frame_control)))
 		tkey->rx_hdr[12] = *(skb->data + hdr_len - 2) & 0x07;
 
 	if (michael_mic(tkey->rx_tfm_michael, &tkey->key[24], tkey->rx_hdr,
@@ -566,9 +566,9 @@ static int rtllib_michael_mic_verify(struct sk_buff *skb, int keyidx,
 		return -1;
 
 	if (memcmp(mic, skb->data + skb->len - 8, 8) != 0) {
-		struct rtllib_hdr_4addr *hdr;
+		struct ieee80211_hdr *hdr;
 
-		hdr = (struct rtllib_hdr_4addr *)skb->data;
+		hdr = (struct ieee80211_hdr *)skb->data;
 		netdev_dbg(skb->dev,
 			   "Michael MIC verification failed for MSDU from %pM keyidx=%d\n",
 			   hdr->addr2, keyidx);
-- 
2.42.0

