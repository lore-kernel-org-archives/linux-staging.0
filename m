Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E4411C8D
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:09:33 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40471c054f9so5604715e9.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794172; x=1695398972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e6zJX8M1AWA9AzHjlXWzMk/8ZyhOyB9WL4ZHECa3qZU=;
        b=DtTd82krbTplisTkTgFdYuHLLsAHgGujFaF7svV6elILgmjC/tJFdjJ1o0EgZqrAXU
         69meUCALHOmRV3u8WklZdCB2efDK6Lb3d5ZAAdpbVwZ8tH02aS1ONVh5cjLPJ32NBwgo
         NBfv+wPtDNPPjc6ryYgk+ay03nCqYTRwYaCm3cyaXqc61RsvehubNHMiyqSq5zJ/dDrR
         YDzvv5cuQnjAbTsL2bWjB8HvewGhQ3cOaiXPJBvwdjBW9Eahgl8MLe9vqSCNeZErDHGD
         xhjJN5cQMwSLn9eIQmuW5Y1NnNFr+IzHf8qSA99tpaj02AJ1L4SZP3rgKGxF+Jn7+5t2
         ylRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794172; x=1695398972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6zJX8M1AWA9AzHjlXWzMk/8ZyhOyB9WL4ZHECa3qZU=;
        b=tIffxPDDI9M8eCYnKxFWB+Pz1BBK6ffqFUNGVEvLsTfuR3Q+a72PiCk3SEvZ2PC9Cr
         I0pp4fJyNEzbgxTY1XDcbJn5dZqx4LzjDSgQ/GErBC7POtprb3rFrCgAnH4sBE7UduzO
         aYHdK3OkgUsv9ayF18tQTUo3Ho1HBliAIjwA2dOGiKBICIKIob08L3q85mH+pbTvWryQ
         nYrmL7KS/ktu//n2gF0uheza7FMp5vK0wgCKjTyLRT342j44bADWtM9LUj2jShiUDkOy
         BAfvvMMWqBqz3dcTZ0TqN2fONYzBUE9gNy3JeDG20qdNbn7GrcA5kS96os7yeJUBkXnv
         Efbg==
X-Gm-Message-State: AOJu0YxmB6DxXL5q6LErVpCW033V4rOZsSXwH0gbeFDp7XWlg7MSSkQm
	JMBhrrzZalj6prqXcwzgv5k=
X-Google-Smtp-Source: AGHT+IFyxrTxRAsIwCf8BBHzAO91OQPuLLNKoI3058A7oHSnOlVsCIqQIHOdGDmOvw6/Wy6NNCrTLg==
X-Received: by 2002:adf:ef88:0:b0:317:3d36:b2c1 with SMTP id d8-20020adfef88000000b003173d36b2c1mr1777666wro.7.1694794172048;
        Fri, 15 Sep 2023 09:09:32 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d568d000000b0031fd849e797sm4720098wrv.105.2023.09.15.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:09:31 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:09:30 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] staging: rtl8192e: Remove struct rtllib_pspoll_hdr
Message-ID: <a4bd004fcbba81f96fd09f5adec5f029e2de3d6d.1694792595.git.philipp.g.hortmann@gmail.com>
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

Replace struct rtllib_pspoll_hdr with struct ieee80211_pspoll to avoid
proprietary code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         | 7 -------
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 24060c9722e6..ef6e2187f847 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -672,13 +672,6 @@ enum rtllib_mfie {
  * information to determine what type of underlying data type is actually
  * stored in the data.
  */
-struct rtllib_pspoll_hdr {
-	__le16 frame_ctl;
-	__le16 aid;
-	u8 bssid[ETH_ALEN];
-	u8 ta[ETH_ALEN];
-} __packed;
-
 struct rtllib_info_element {
 	u8 id;
 	u8 len;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 3c61b6f4f69f..e51bdfd847d2 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -936,21 +936,21 @@ static struct sk_buff *rtllib_null_func(struct rtllib_device *ieee, short pwr)
 static struct sk_buff *rtllib_pspoll_func(struct rtllib_device *ieee)
 {
 	struct sk_buff *skb;
-	struct rtllib_pspoll_hdr *hdr;
+	struct ieee80211_pspoll *hdr;
 
-	skb = dev_alloc_skb(sizeof(struct rtllib_pspoll_hdr) + ieee->tx_headroom);
+	skb = dev_alloc_skb(sizeof(struct ieee80211_pspoll) + ieee->tx_headroom);
 	if (!skb)
 		return NULL;
 
 	skb_reserve(skb, ieee->tx_headroom);
 
-	hdr = skb_put(skb, sizeof(struct rtllib_pspoll_hdr));
+	hdr = skb_put(skb, sizeof(struct ieee80211_pspoll));
 
 	ether_addr_copy(hdr->bssid, ieee->current_network.bssid);
 	ether_addr_copy(hdr->ta, ieee->dev->dev_addr);
 
 	hdr->aid = cpu_to_le16(ieee->assoc_id | 0xc000);
-	hdr->frame_ctl = cpu_to_le16(RTLLIB_FTYPE_CTL | RTLLIB_STYPE_PSPOLL |
+	hdr->frame_control = cpu_to_le16(RTLLIB_FTYPE_CTL | RTLLIB_STYPE_PSPOLL |
 			 RTLLIB_FCTL_PM);
 
 	return skb;
-- 
2.42.0

