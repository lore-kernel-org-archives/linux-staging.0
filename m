Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613A211C9A
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:07:27 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40472fef044so4418315e9.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794045; x=1695398845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvG4f3NcsI8Xfv36MOL6iAucxTOlBE34b3xcrtfbeuU=;
        b=e1DCu5TKWCuCRL7lLM7geLq6P/F3q5jDXqzYbyDBM+SfvSqjlLvY/5joJZxaitqu8A
         6ktrfwWm/KzS29qCZB5R4bAZy6cS/E/L+1PBLfI3BbPd24+W/ZJfm3NwKY1wPjXnjroV
         jUrkxBW7VFiq0NjSbB/woQP7LG6I6FoR9i1354S2j/sPGDE5hpSDjwGTcOWV9gM/6LM1
         fEM9NF2WHF7OmkO0IDZxnHlK1yBPWJmJepKYE7Az2z5HW/+DOclnJ4LMYLWLbmAnZ5Hu
         3/m4iudvPLVOLWGrevCQQdvb6fLOd1FxXYyKs94Nh4GPALoQRLpbqJI6gd405+uiDO7J
         LlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794045; x=1695398845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvG4f3NcsI8Xfv36MOL6iAucxTOlBE34b3xcrtfbeuU=;
        b=RZof59rv6+Df1tv8eAn00GqmgCgP3TjN4KZN1Yq9gXQg/80jwX8dtvYu+r1gshgJi0
         fsJHTPv4VmOWq+bgCV1tu7CNI7WwEw0vXfHISJHD31pNwZtBIPqvW9O7GQ80kZZyNmq8
         Ypdmo6ZxTzyq/MXl89Zt3Kupe7fwAYxchWU0TgdQ9orkDG3y18e0kBhZHCiCqDLIqstB
         BCEr5SvbE2BUp+dH9Y3DpGieX2c0D2OHQDPWS2IG1uqQydQQC1ue6gXiU0zfCwj8WNT0
         5hhSZ2qceO1/aaxlhhXG/slOP8oxfv16q9bgaotSLpwHyQDjSqGtYowguo09znHUIjAm
         7Rmg==
X-Gm-Message-State: AOJu0YzJqeJ65NrA7eOnhtthwY8K8ziaImdgJiTkVxvkEKUVSJREIKSz
	RgXLV1QpLfSWzR2UWf46MDY=
X-Google-Smtp-Source: AGHT+IHpBqjfNyt9FrXLR3IvrIElvMmMCFxj5FnVrXW+k+S450qF5huVzeUb8FvQDfR7OIkpvJrTfA==
X-Received: by 2002:a1c:7507:0:b0:401:b0f8:c26a with SMTP id o7-20020a1c7507000000b00401b0f8c26amr1894999wmc.4.1694794045460;
        Fri, 15 Sep 2023 09:07:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c214d00b00401dc20a070sm7871465wml.43.2023.09.15.09.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:07:25 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:07:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/16] staging: rtl8192e: Replace struct rtllib_hdr_3addr in
 r8192E_dev.c
Message-ID: <8e5901c4ecb0961374610f627deb6a6ad9bc53df.1694792595.git.philipp.g.hortmann@gmail.com>
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

Replace struct rtllib_hdr_3addr with struct ieee80211_hdr_3addr to avoid
proprietary struct in r8192E_dev.c, rtllib_tx.c and in functions of
rtllib.h.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib.h              |  6 +++---
 drivers/staging/rtl8192e/rtllib_tx.c           |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 70e1eff9c600..6528807311ba 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1411,12 +1411,12 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	static u32 slide_beacon_adc_pwdb_index;
 	static u32 slide_beacon_adc_pwdb_statistics;
 	static u32 last_beacon_adc_pwdb;
-	struct rtllib_hdr_3addr *hdr;
+	struct ieee80211_hdr_3addr *hdr;
 	u16 sc;
 	unsigned int seq;
 
-	hdr = (struct rtllib_hdr_3addr *)buffer;
-	sc = le16_to_cpu(hdr->seq_ctl);
+	hdr = (struct ieee80211_hdr_3addr *)buffer;
+	sc = le16_to_cpu(hdr->seq_ctrl);
 	seq = WLAN_GET_SEQ_SEQ(sc);
 	curr_st->Seq_Num = seq;
 	if (!prev_st->bIsAMPDU)
@@ -1561,7 +1561,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 	bool bpacket_match_bssid, bpacket_toself;
 	bool bPacketBeacon = false;
-	struct rtllib_hdr_3addr *hdr;
+	struct ieee80211_hdr_3addr *hdr;
 	bool bToSelfBA = false;
 	static struct rtllib_rx_stats  previous_stats;
 	u16 fc, type;
@@ -1570,8 +1570,8 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 
 	tmp_buf = skb->data + pstats->RxDrvInfoSize + pstats->RxBufShift;
 
-	hdr = (struct rtllib_hdr_3addr *)tmp_buf;
-	fc = le16_to_cpu(hdr->frame_ctl);
+	hdr = (struct ieee80211_hdr_3addr *)tmp_buf;
+	fc = le16_to_cpu(hdr->frame_control);
 	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
 
@@ -1584,7 +1584,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 		 (!pstats->bHwError) && (!pstats->bCRC) && (!pstats->bICV));
 	bpacket_toself = bpacket_match_bssid &&		/* check this */
 			 ether_addr_equal(praddr, priv->rtllib->dev->dev_addr);
-	if (ieee80211_is_beacon(hdr->frame_ctl))
+	if (ieee80211_is_beacon(hdr->frame_control))
 		bPacketBeacon = true;
 	_rtl92e_process_phyinfo(priv, tmp_buf, &previous_stats, pstats);
 	_rtl92e_query_rxphystatus(priv, pstats, pdesc, pdrvinfo,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 3ffebe12e279..c13268ad6b56 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -931,11 +931,11 @@ static inline const char *eap_get_type(int type)
 
 static inline u8 Frame_QoSTID(u8 *buf)
 {
-	struct rtllib_hdr_3addr *hdr;
+	struct ieee80211_hdr_3addr *hdr;
 	u16 fc;
 
-	hdr = (struct rtllib_hdr_3addr *)buf;
-	fc = le16_to_cpu(hdr->frame_ctl);
+	hdr = (struct ieee80211_hdr_3addr *)buf;
+	fc = le16_to_cpu(hdr->frame_control);
 	return (u8)((union frameqos *)(buf + (((fc & RTLLIB_FCTL_TODS) &&
 		    (fc & RTLLIB_FCTL_FROMDS)) ? 30 : 24)))->field.tid;
 }
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 53eaf6330a98..a244a072e551 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -853,7 +853,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				ieee->seq_ctrl[0]++;
 		}
 	} else {
-		if (unlikely(skb->len < sizeof(struct rtllib_hdr_3addr))) {
+		if (unlikely(skb->len < sizeof(struct ieee80211_hdr_3addr))) {
 			netdev_warn(ieee->dev, "skb too small (%d).\n",
 				    skb->len);
 			goto success;
-- 
2.42.0

