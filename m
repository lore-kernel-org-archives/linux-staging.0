Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535F11C8D
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:09:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe4f3b5f25so6773875e9.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794192; x=1695398992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ruUqNqg+klzqg8DIZkV1fJ8TK4DrEnEOQmLelzItfAk=;
        b=TBfzy/M2EjP9qIk/wuqbLyFPaIPZJ29n9YEqaH+gbL7wk2u+NyylW/oWC6KDqNMz50
         G1sr44MjZILIjBeYz5xCwZdPgv0ZrAap5IFKdu1PtgFVjrN3iXPvfy44ckcnp05eGkVb
         2Ibv2V0ogtgc+xUJpaBv5LegEww4HrErGN9gQ2FF9UPi+T4nYsgIyeU4ZznkJP0Cjvla
         17QYhek4Cf28WPaWFw3163BlenKheeJXgva8KPUt9Q7gc1S/yELccCog11oyXe1s82cZ
         j80XCUXtBkQ0wXPVffFBtHd5apO9NcM/8yoqiiB37QjdVj4+N+NE+gny1TVB1UD+6Fdi
         19Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794192; x=1695398992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruUqNqg+klzqg8DIZkV1fJ8TK4DrEnEOQmLelzItfAk=;
        b=HuOFiN1McFH3MfwgIcvho6Dgsv18H0XNmpIPzTgMXY3V+DVE3bu1BqGzM0MM2sHQaB
         6vOHWpTaEgzBkzG7EImBYTWX/byGbUPjUVozN9XJy1hq9VH+4VP9l76LpHNjulZHT9Xk
         MamCrdNxaIq2ltdLXDNEK9cVZq2Qs8tsNUfnVIprNBK0uPfvZk7DUAgqPJTkid/ryOEm
         auWYr8mbIV9WiW/IHKCRgBCfBv61pdC/m+t86H79gTcmBRpcaBO23qmqwrBLDGAyzxoa
         KSH3sV/7BKMIJ+JATve+h9PkwIPG7b5EY23auaFDBOaCkgeLsvRzUFvxfMm5KWt1PJDe
         JjBA==
X-Gm-Message-State: AOJu0Yy2QwUiBEX4/KfLnecJB3ibmYNfYXHKeIVXHNO0X3/MTe44jwDs
	XVnUBU5ZaPhj6EtS31KVTIzuYkTgNAS4dw==
X-Google-Smtp-Source: AGHT+IHLFCFEhdew0V6dS/n9rKcDRpe1AoatqJjezrn3Dd+4f1btZ1AZCX6b0W0XIWWgWujXhx8iog==
X-Received: by 2002:a05:6000:110b:b0:31f:af30:1bd4 with SMTP id z11-20020a056000110b00b0031faf301bd4mr1814580wrw.1.1694794191738;
        Fri, 15 Sep 2023 09:09:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id s10-20020a5d510a000000b0031971ab70c9sm4811105wrt.73.2023.09.15.09.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:09:51 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:09:50 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] staging: rtl8192e: Replace usage of RTLLIB_FCTL_DSTODS
 with function
Message-ID: <69f72a352b8129bcc6610c1355a41d966abf24d8.1694792595.git.philipp.g.hortmann@gmail.com>
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

Replace usage of RTLLIB_FCTL_DSTODS with function ieee80211_has_a4() to
avoid proprietary code and to increase readability. To achieve this goal
it was required to change a parameter of function rtllib_rx_data_filter().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h            |  1 -
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c |  3 +--
 drivers/staging/rtl8192e/rtllib_rx.c         | 14 +++++++-------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 47156eb8f46b..9179c3c14ab3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -338,7 +338,6 @@ enum rt_op_mode {
 #define RTLLIB_FCTL_FRAMETYPE	0x00fc
 #define RTLLIB_FCTL_TODS		0x0100
 #define RTLLIB_FCTL_FROMDS		0x0200
-#define RTLLIB_FCTL_DSTODS		0x0300
 #define RTLLIB_FCTL_MOREFRAGS	0x0400
 #define RTLLIB_FCTL_RETRY		0x0800
 #define RTLLIB_FCTL_PM		0x1000
diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index 8e4514cc132c..5621261d66b9 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -92,8 +92,7 @@ static int ccmp_init_iv_and_aad(struct ieee80211_hdr *hdr,
 	int a4_included, qc_included;
 
 	fc = le16_to_cpu(hdr->frame_control);
-	a4_included = ((fc & (RTLLIB_FCTL_TODS | RTLLIB_FCTL_FROMDS)) ==
-		       (RTLLIB_FCTL_TODS | RTLLIB_FCTL_FROMDS));
+	a4_included = ieee80211_has_a4(hdr->frame_control);
 
 	qc_included = ((WLAN_FC_GET_TYPE(fc) == RTLLIB_FTYPE_DATA) &&
 		       (WLAN_FC_GET_STYPE(fc) & 0x80));
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4d8c3869eb83..ef042dfd89cb 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -97,7 +97,7 @@ rtllib_frag_cache_get(struct rtllib_device *ieee,
 	struct ieee80211_qos_hdr_4addr *hdr_4addrqos;
 	u8 tid;
 
-	if (((fc & RTLLIB_FCTL_DSTODS) == RTLLIB_FCTL_DSTODS) &&
+	if (ieee80211_has_a4(hdr->frame_control) &&
 	    RTLLIB_QOS_HAS_SEQ(fc)) {
 		hdr_4addrqos = (struct ieee80211_qos_hdr_4addr *)hdr;
 		tid = le16_to_cpu(hdr_4addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
@@ -166,7 +166,7 @@ static int rtllib_frag_cache_invalidate(struct rtllib_device *ieee,
 	struct ieee80211_qos_hdr_4addr *hdr_4addrqos;
 	u8 tid;
 
-	if (((fc & RTLLIB_FCTL_DSTODS) == RTLLIB_FCTL_DSTODS) &&
+	if (ieee80211_has_a4(hdr->frame_control) &&
 	    RTLLIB_QOS_HAS_SEQ(fc)) {
 		hdr_4addrqos = (struct ieee80211_qos_hdr_4addr *)hdr;
 		tid = le16_to_cpu(hdr_4addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
@@ -359,7 +359,7 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 	struct ieee80211_qos_hdr_4addr *hdr_4addrqos;
 	u8 tid;
 
-	if (((fc & RTLLIB_FCTL_DSTODS) == RTLLIB_FCTL_DSTODS) &&
+	if (ieee80211_has_a4(header->frame_control) &&
 	    RTLLIB_QOS_HAS_SEQ(fc)) {
 		hdr_4addrqos = (struct ieee80211_qos_hdr_4addr *)header;
 		tid = le16_to_cpu(hdr_4addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
@@ -968,16 +968,16 @@ static void rtllib_rx_extract_addr(struct rtllib_device *ieee,
 	}
 }
 
-static int rtllib_rx_data_filter(struct rtllib_device *ieee, u16 fc,
+static int rtllib_rx_data_filter(struct rtllib_device *ieee, struct ieee80211_hdr *hdr,
 				 u8 *dst, u8 *src, u8 *bssid, u8 *addr2)
 {
 	u8 type, stype;
-
+	u16 fc = le16_to_cpu(hdr->frame_control);
 	type = WLAN_FC_GET_TYPE(fc);
 	stype = WLAN_FC_GET_STYPE(fc);
 
 	/* Filter frames from different BSS */
-	if (((fc & RTLLIB_FCTL_DSTODS) != RTLLIB_FCTL_DSTODS) &&
+	if (ieee80211_has_a4(hdr->frame_control) &&
 	    !ether_addr_equal(ieee->current_network.bssid, bssid) &&
 	    !is_zero_ether_addr(ieee->current_network.bssid)) {
 		return -1;
@@ -1341,7 +1341,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	rtllib_rx_extract_addr(ieee, hdr, dst, src, bssid);
 
 	/* Filter Data frames */
-	ret = rtllib_rx_data_filter(ieee, fc, dst, src, bssid, hdr->addr2);
+	ret = rtllib_rx_data_filter(ieee, hdr, dst, src, bssid, hdr->addr2);
 	if (ret < 0)
 		goto rx_dropped;
 
-- 
2.42.0

