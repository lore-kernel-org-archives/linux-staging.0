Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD31C68A;
	Mon, 16 Oct 2023 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iptXZGfv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4065f29e933so46398635e9.1;
        Mon, 16 Oct 2023 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697448040; x=1698052840; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJfBRp5VD6FpfPviX6UT8LSGqMMMF7yFcNY8gKLmCHs=;
        b=iptXZGfvsHS2vMTJdczQzfbWiFFWxiW18sB/m+K4xpGCpvkfPLGL3xSS/+/AmIeXRt
         dHi3m6qCRgdnbOsRC6H7b/76j3Ifz98wTjeRnG/HJqfri/0XfbAx8i8Kn9eZkbO/HsdO
         xoVaRBATXZNE5SqN704HO3Lztu0yo/0Ck32ziyuP/eY8X1qDS6cHIwtJOio9YGcE2Ov9
         Dc1F9UCdWoFYKZRoty7oX9U+KVMUVrWIH+a7lxyjsKYrr2YNi47XAO6Nkr6EqAgZDJdv
         fcCgPy6ys7Qm6sFuH/6U9JWxx2f6T/3pbXt0KE8JPlNdmv97RhH6REQXlPwhabIhCiWs
         hd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697448040; x=1698052840;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJfBRp5VD6FpfPviX6UT8LSGqMMMF7yFcNY8gKLmCHs=;
        b=iCsVMSmuoX2wkoj2kgLvvRMIhK9yXLpAiyczKVX521F0Km5hIs1cwTc09Co5OKSMvF
         x9h/5GnAU05noDGQ0tItnU+zch+28/pO5SRqNsdLMSXcXq8MRDZd5Af51am40q50KFcR
         eoZc0tjcWrFvFa+yOA65A3j+/v9rixgzcZHaqSQ5Bi9ZC/4VeXqZcV+IygXvppwkAOqR
         aIGDxXxF3Lb+y7hFoRYi5PkEAfEUsl5ZNpvec2cUpuwPiU5Cj5OQzOCj30n61r7DDLrK
         ISgsD6CvmISLk+8UdNLDTToQV6YJdk2bazXEQbEDQJk8fVUbnsqWJTAB1cbJjHvleMSX
         YflQ==
X-Gm-Message-State: AOJu0Yz70AG/LUNqjBXO78TI8Tpr3E3kTqF6+o9lxifHqbJsuudldJwu
	/7Spni8jt3hj1sYQusA3kC4=
X-Google-Smtp-Source: AGHT+IEzEWonZB1xm24SGr71/E3ez9Wnn2Ifz8W/kECAf52uERj4/tTjaZw6skTUUAGecguYZCnOXA==
X-Received: by 2002:a7b:c5c9:0:b0:405:40ab:7693 with SMTP id n9-20020a7bc5c9000000b0040540ab7693mr27898824wmk.31.1697448040274;
        Mon, 16 Oct 2023 02:20:40 -0700 (PDT)
Received: from lab-ubuntu ([41.90.67.11])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c290c00b0040588d85b3asm6573166wmd.15.2023.10.16.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 02:20:39 -0700 (PDT)
Date: Mon, 16 Oct 2023 12:20:37 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Calvince Otieno <calvncce@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] staging: wlan-ng: replace pr_debug() with netdev_dbg()
Message-ID: <ZS0AZahhusLoN4b/@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch replaces the usage of pr_debug() with netdev_dbg().
The change is made to enhance context-aware debugging,
improve code clarity, and maintain compatibility with established
network debugging practices. There were no functional code changes.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/p80211conv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
index 048e1c3fe19b..8336435eccc2 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -312,8 +312,8 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 				  payload_length - 4);
 		if (foo) {
 			/* de-wep failed, drop skb. */
-			pr_debug("Host de-WEP failed, dropping frame (%d).\n",
-				 foo);
+			netdev_dbg(netdev, "Host de-WEP failed, dropping frame (%d).\n",
+				   foo);
 			wlandev->rx.decrypt_err++;
 			return 2;
 		}
@@ -340,7 +340,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 	    (e_llc->dsap != 0xaa || e_llc->ssap != 0xaa) &&
 	    ((!ether_addr_equal_unaligned(daddr, e_hdr->daddr)) ||
 	     (!ether_addr_equal_unaligned(saddr, e_hdr->saddr)))) {
-		pr_debug("802.3 ENCAP len: %d\n", payload_length);
+		netdev_dbg(netdev, "802.3 ENCAP len: %d\n", payload_length);
 		/* 802.3 Encapsulated */
 		/* Test for an overlength frame */
 		if (payload_length > (netdev->mtu + ETH_HLEN)) {
@@ -367,7 +367,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 		   (p80211_stt_findproto(be16_to_cpu(e_snap->type)))) ||
 		   (memcmp(e_snap->oui, oui_rfc1042, WLAN_IEEE_OUI_LEN) !=
 			0))) {
-		pr_debug("SNAP+RFC1042 len: %d\n", payload_length);
+		netdev_dbg(netdev, "SNAP+RFC1042 len: %d\n", payload_length);
 		/* it's a SNAP + RFC1042 frame && protocol is in STT */
 		/* build 802.3 + RFC1042 */
 
@@ -397,7 +397,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 		(e_llc->dsap == 0xaa) &&
 		(e_llc->ssap == 0xaa) &&
 		(e_llc->ctl == 0x03)) {
-		pr_debug("802.1h/RFC1042 len: %d\n", payload_length);
+		netdev_dbg(netdev, "802.1h/RFC1042 len: %d\n", payload_length);
 		/* it's an 802.1h frame || (an RFC1042 && protocol not in STT)
 		 * build a DIXII + RFC894
 		 */
@@ -433,7 +433,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 		/* chop off the 802.11 CRC */
 		skb_trim(skb, skb->len - WLAN_CRC_LEN);
 	} else {
-		pr_debug("NON-ENCAP len: %d\n", payload_length);
+		netdev_dbg(netdev, "NON-ENCAP len: %d\n", payload_length);
 		/* any NON-ENCAP */
 		/* it's a generic 80211+LLC or IPX 'Raw 802.3' */
 		/*  build an 802.3 frame */
-- 
2.34.1

