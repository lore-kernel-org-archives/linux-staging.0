Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E87B748C
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:20:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-401d61e9fecso9085415e9.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283604; x=1694888404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0GJntv/tr8/Gm4ETuKdQjTd3AzrBQjbaRNLIIDonBY=;
        b=rtoV/+NEcIqY/BGSLd+ACnA5PEVvFeOZORbLko/x2lJGznE4sYgaJRk5JOF4bFzljN
         mY//53VAcMs6BcOFNgNYgvreyJcAwqMmFSt4PAJepge0ZGnDsXRZYN/KjcCsnOwQ9d82
         hUqt4zFZ4n8pZa+dInOf7X7dcIQxpH/Q19UE3oomy11s9GS0UidAhm6OcYw381E6PLDi
         qi2WFuEipUaODL+KVfQ1ZG2dvhfnvULFaHiMKjEyw5uuRNolNAOxfI7t8Ex5e3iUij0o
         lsGENZGJCgO3G7owHKbdy9DCYLKaVT6pqHunhgiIvpeS6qF9jbIs/NQPcjj/ORqNCjGT
         4ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283604; x=1694888404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0GJntv/tr8/Gm4ETuKdQjTd3AzrBQjbaRNLIIDonBY=;
        b=NVSDI2KJJKvZ0no8BkT9IGLIiJ9ak5XI101es7zuPglCkTOMLtrq0GW/xKIHxUe7et
         Iytzyo5Nj1jV8xx6Sw2ZcbXF72YO3Lhgi/ISNBusPGfAQZpAhi1UZA+KjUnkY5loxRdt
         awpLLlPG5Z2xUAL+/3KIrLMdle06zEMMrc1/g8IW+deUgoZTjb3MWeZ+0F81KzrpwGQR
         th/pAW/PHzlmFoGAHX7zrl5n5tT355HGTnTtiYJK1oJsOOObndHhNdAhBdtd44ryGDqk
         N0611RySUkcBjOirWvsh3AwMCZJaqLy0BUcStGr5AbTA0AuVjenQFBXPS9u/GBp4FLX0
         urxA==
X-Gm-Message-State: AOJu0YwsnQ4WT03rpMP6vpeadG312k/gc6fbgb9+KBTaSPOIkmxVqc5X
	Njd+MBigK7AiW2wWKLEkQ9U=
X-Google-Smtp-Source: AGHT+IGVIBnE+056PTRWKmggLco2irpXki5yrAdaFey/hKmlCTT5C6E0jdbEVHOrytZ5i6374DkO0A==
X-Received: by 2002:a5d:654d:0:b0:317:3d36:b2c1 with SMTP id z13-20020a5d654d000000b003173d36b2c1mr4165167wrv.7.1694283604090;
        Sat, 09 Sep 2023 11:20:04 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id i9-20020a5d5589000000b003141e629cb6sm5330113wrv.101.2023.09.09.11.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:20:03 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:20:02 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] staging: rtl8192e: Use standard function in
 softmac_mgmt_xmit()
Message-ID: <caae14d46f7f5a3072ee3e53f80a27909c86fcbf.1694282907.git.philipp.g.hortmann@gmail.com>
References: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694282907.git.philipp.g.hortmann@gmail.com>

Use standard function ieee80211_is_beacon() to avoid proprietary code to
identify beacon and to increase readability in softmac_mgmt_xmit() and
_rtl92e_translate_rx_signal_stats()

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 1 -
 drivers/staging/rtl8192e/rtllib_softmac.c      | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 58e90b7772ef..8adf53174239 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1584,7 +1584,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 		 (!pstats->bHwError) && (!pstats->bCRC) && (!pstats->bICV));
 	bpacket_toself = bpacket_match_bssid &&		/* check this */
 			 ether_addr_equal(praddr, priv->rtllib->dev->dev_addr);
-	if (WLAN_FC_GET_FRAMETYPE(fc) == RTLLIB_STYPE_BEACON)
+	if (ieee80211_is_beacon(hdr->frame_ctl))
 		bPacketBeacon = true;
 	_rtl92e_process_phyinfo(priv, tmp_buf, &previous_stats, pstats);
 	_rtl92e_query_rxphystatus(priv, pstats, pdesc, pdrvinfo,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 95c9f6679d71..7dfb93f0590c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -459,7 +459,6 @@ enum _REG_PREAMBLE_MODE {
 #define WLAN_FC_GET_STYPE(fc) ((fc) & RTLLIB_FCTL_STYPE)
 #define WLAN_FC_MORE_DATA(fc) ((fc) & RTLLIB_FCTL_MOREDATA)
 
-#define WLAN_FC_GET_FRAMETYPE(fc) ((fc) & RTLLIB_FCTL_FRAMETYPE)
 #define WLAN_GET_SEQ_FRAG(seq) ((seq) & RTLLIB_SCTL_FRAG)
 #define WLAN_GET_SEQ_SEQ(seq)  (((seq) & RTLLIB_SCTL_SEQ) >> 4)
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index de1702491191..5de57331c1cf 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -197,7 +197,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 	/* called with 2nd param 0, no mgmt lock required */
 	rtllib_sta_wakeup(ieee, 0);
 
-	if (le16_to_cpu(header->frame_ctl) == RTLLIB_STYPE_BEACON)
+	if (ieee80211_is_beacon(header->frame_ctl))
 		tcb_desc->queue_index = BEACON_QUEUE;
 	else
 		tcb_desc->queue_index = MGNT_QUEUE;
-- 
2.41.0

