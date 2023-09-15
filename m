Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F911C8D
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:09:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31f85854b9eso319389f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794184; x=1695398984; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VavJ2SF5ZeMDlKp5PL5Yc3lcSs1LF1WWPwssrhVwbYY=;
        b=jnhpERclRSQtqMpxj7ejIyijpIx+VGH86aQYbdn5Lqpk5jUjvACPbU0kl0M5bxl9cR
         3Nj+Uk5Pj1NSf9DcflNpG2Eg51sZJM82JoxcszoAQ0qIHtm+9tTzHhvJt7CwIcW4AQwf
         KbHQb0uBAcaF2OBIErdGMwu7dXzk5uFeBj19pHzIGdR6iM5qUNGPSDmrtPc9kONMC2/y
         yimkNkren0hhnbox9QCjs+JE07fiFs8LWqTui54J5K0qKodSR3nzwWff5/XgVvulmvmZ
         fggOUhoD6W+qmnpyWEp0i3JIM+gw6Frc1mLR1l+D3EVIPO4IuTIbTaK+fOvrb9Gxw9g/
         +mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794184; x=1695398984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VavJ2SF5ZeMDlKp5PL5Yc3lcSs1LF1WWPwssrhVwbYY=;
        b=ZFQy4/9+Ejy8c7e3QG6DH1ujfa7HndiViW8yqbmFUmSkN4vzcO4e441j1M3nuiZH1x
         EthvISk6Bb3z+LHg6aexhJeW0BIhFvoFLAAaJZYbAsRBoc+Z4L0KUqLRHxikFusemr6P
         Z06rXsn/a7K1Iuz8+9QS5xxigenPy/VH6EbvRj+ZdutzOC56kIu3ygyiL9Dsgrg6Tw9k
         ROveJlNbDVf8bLiXuzFpIJ3g+NvqHL1kqNY/Ax3FosIgYdOYtvgar8ZaTgQDwNhmG3+D
         zigr6Ql8VqPGbdiWyztOGosgg8aemmm/SBg0RJWEaGjPQSKyv+wRT115UibaaJf3UBcg
         qG8Q==
X-Gm-Message-State: AOJu0YyeHTlGE/p0mdZmWq+6miq+N19pwnE5whHeLpF2p3wYQ0kLCqug
	KkZebyXL8SWt/BOtXEvpJwM=
X-Google-Smtp-Source: AGHT+IHCec9x7R+dvyIfgtgsaxRx4aocBt8MndvCOx4yRCWf/5mmkZ8l1SlCU3vRYMW+XOLmy1TDJg==
X-Received: by 2002:adf:fdcf:0:b0:319:7624:4c8d with SMTP id i15-20020adffdcf000000b0031976244c8dmr1654013wrs.0.1694794184430;
        Fri, 15 Sep 2023 09:09:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d5704000000b0031fc9402b47sm4806845wrv.4.2023.09.15.09.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:09:44 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:09:42 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] staging: rtl8192e: Replace control subframe types with
 IEEE80211_STYPE_*
Message-ID: <970555ba76dcf3b9896c51aab8ff333a95f12225.1694792595.git.philipp.g.hortmann@gmail.com>
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

Replace control and data subframe types RTLLIB_STYPE_* with
IEEE80211_STYPE_* to avoid proprietary constant names.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         | 23 ++++-------------------
 drivers/staging/rtl8192e/rtllib_rx.c      | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_softmac.c |  6 +++---
 drivers/staging/rtl8192e/rtllib_tx.c      |  4 ++--
 4 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 3cf171a70974..47156eb8f46b 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -350,21 +350,6 @@ enum rt_op_mode {
 #define RTLLIB_FTYPE_CTL		0x0004
 #define RTLLIB_FTYPE_DATA		0x0008
 
-/* control */
-#define RTLLIB_STYPE_PSPOLL		0x00A0
-#define RTLLIB_STYPE_RTS		0x00B0
-#define RTLLIB_STYPE_CTS		0x00C0
-#define RTLLIB_STYPE_ACK		0x00D0
-
-/* data */
-#define RTLLIB_STYPE_DATA		0x0000
-#define RTLLIB_STYPE_DATA_CFACK	0x0010
-#define RTLLIB_STYPE_DATA_CFPOLL	0x0020
-#define RTLLIB_STYPE_DATA_CFACKPOLL	0x0030
-#define RTLLIB_STYPE_NULLFUNC	0x0040
-#define RTLLIB_STYPE_QOS_DATA	0x0080
-#define RTLLIB_STYPE_QOS_NULL	0x00C0
-
 #define RTLLIB_SCTL_FRAG		0x000F
 #define RTLLIB_SCTL_SEQ		0xFFF0
 
@@ -375,8 +360,8 @@ enum rt_op_mode {
 #define IsDataFrame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
 #define	IsLegacyDataFrame(pdu)	(IsDataFrame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
 #define IsQoSDataFrame(pframe)			\
-	((*(u16 *)pframe&(RTLLIB_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
-	(RTLLIB_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
+	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
+	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
 #define Frame_Order(pframe)     (*(u16 *)pframe&RTLLIB_FCTL_ORDER)
 #define SN_LESS(a, b)		(((a-b)&0x800) != 0)
 #define SN_EQUAL(a, b)	(a == b)
@@ -1647,8 +1632,8 @@ static inline int rtllib_get_hdrlen(u16 fc)
 		break;
 	case RTLLIB_FTYPE_CTL:
 		switch (WLAN_FC_GET_STYPE(fc)) {
-		case RTLLIB_STYPE_CTS:
-		case RTLLIB_STYPE_ACK:
+		case IEEE80211_STYPE_CTS:
+		case IEEE80211_STYPE_ACK:
 			hdrlen = RTLLIB_1ADDR_LEN;
 			break;
 		default:
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index cf98b020194b..4d8c3869eb83 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -997,12 +997,12 @@ static int rtllib_rx_data_filter(struct rtllib_device *ieee, u16 fc,
 	 * hostap_handle_sta_rx() before being dropped here.
 	 */
 	if (!ieee->intel_promiscuous_md_info.promiscuous_on) {
-		if (stype != RTLLIB_STYPE_DATA &&
-		    stype != RTLLIB_STYPE_DATA_CFACK &&
-		    stype != RTLLIB_STYPE_DATA_CFPOLL &&
-		    stype != RTLLIB_STYPE_DATA_CFACKPOLL &&
-		    stype != RTLLIB_STYPE_QOS_DATA) {
-			if (stype != RTLLIB_STYPE_NULLFUNC)
+		if (stype != IEEE80211_STYPE_DATA &&
+		    stype != IEEE80211_STYPE_DATA_CFACK &&
+		    stype != IEEE80211_STYPE_DATA_CFPOLL &&
+		    stype != IEEE80211_STYPE_DATA_CFACKPOLL &&
+		    stype != IEEE80211_STYPE_QOS_DATA) {
+			if (stype != IEEE80211_STYPE_NULLFUNC)
 				netdev_dbg(ieee->dev,
 					   "RX: dropped data frame with no data (type=0x%02x, subtype=0x%02x)\n",
 					   type, stype);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 14f402308ecd..87626c15d0d6 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -273,7 +273,7 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
 	type = WLAN_FC_GET_TYPE(fc);
 	stype = WLAN_FC_GET_STYPE(fc);
 
-	if (stype != RTLLIB_STYPE_PSPOLL)
+	if (stype != IEEE80211_STYPE_PSPOLL)
 		tcb_desc->queue_index = MGNT_QUEUE;
 	else
 		tcb_desc->queue_index = HIGH_QUEUE;
@@ -927,7 +927,7 @@ static struct sk_buff *rtllib_null_func(struct rtllib_device *ieee, short pwr)
 	ether_addr_copy(hdr->addr3, ieee->current_network.bssid);
 
 	hdr->frame_control = cpu_to_le16(RTLLIB_FTYPE_DATA |
-		RTLLIB_STYPE_NULLFUNC | RTLLIB_FCTL_TODS |
+		IEEE80211_STYPE_NULLFUNC | RTLLIB_FCTL_TODS |
 		(pwr ? RTLLIB_FCTL_PM : 0));
 
 	return skb;
@@ -950,7 +950,7 @@ static struct sk_buff *rtllib_pspoll_func(struct rtllib_device *ieee)
 	ether_addr_copy(hdr->ta, ieee->dev->dev_addr);
 
 	hdr->aid = cpu_to_le16(ieee->assoc_id | 0xc000);
-	hdr->frame_control = cpu_to_le16(RTLLIB_FTYPE_CTL | RTLLIB_STYPE_PSPOLL |
+	hdr->frame_control = cpu_to_le16(RTLLIB_FTYPE_CTL | IEEE80211_STYPE_PSPOLL |
 			 RTLLIB_FCTL_PM);
 
 	return skb;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 4b730b2c9fef..8b8f4f90ea35 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -660,9 +660,9 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			fc = RTLLIB_FTYPE_DATA;
 
 		if (qos_activated)
-			fc |= RTLLIB_STYPE_QOS_DATA;
+			fc |= IEEE80211_STYPE_QOS_DATA;
 		else
-			fc |= RTLLIB_STYPE_DATA;
+			fc |= IEEE80211_STYPE_DATA;
 
 		if (ieee->iw_mode == IW_MODE_INFRA) {
 			fc |= RTLLIB_FCTL_TODS;
-- 
2.42.0

