Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66EB1ACBB
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:02:35 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-652d1d3e040so3819801b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686150155; x=1688742155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b2ADMSx2umuqEvoBHVVXSUc2jdp3ipOUY5DdCNizpaM=;
        b=ij1M2eNTekSpxOUXRRF9mkoieb28xM8pDUyZvBwBHImPB/I8Dh23nA6BKXriRZHOBg
         sN2xUJ/8QIlJ3TOJ4LHh7Nz9FwqHC9qwA3Lt5DYd25lREOJbFEmRZCt1Z5C6R1IlcyLk
         wpKi9BygFhPohF7qI3PN5gFtAjf2yYO43QCg8CeHezxHbMn7CwFoeebEAKX29SS0s1gq
         k3ZP+QvEFKva1gko2SCEDopH92454YqJg4kie+gIAe1khkRCTDgkFUWs1KSWw17vYoqS
         deL5iF59WFlekjH6IXXOuVu/kx1IJlI87ByglKBI3h96jl4TicMuN/L38X+cBA+RkLo3
         7G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150155; x=1688742155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2ADMSx2umuqEvoBHVVXSUc2jdp3ipOUY5DdCNizpaM=;
        b=hneOGWtPARj6fx9ay6tPxouYBBIfCyWWuOwtWN7f67MJg0k10zV5iCPH/xkR9s64KQ
         bZ3VgZ5HAxuXxCioAP5hj7HJUxRyVLclaVIKDqtSQNNOA20W8hQQv6AntYcc0KXxXvSn
         3ZlsAjloHT+rVb8jYedoThsv9iTTLetH4TiNyogMx3LUdBURHu5Yb1Bw6F0HjKvtbXfI
         zjlDUsgAswiKJly/x0PpGqTfbORbEmXE0U2aEtKq6IBojC4ysho3BeLBNACmi+Gt4YW2
         Wnswbo6pR+DSwN7CZ5EzXynKt7FdBzbGV8PRYd3us6SABaXe1FXUYwrrcm3iwPu9VYTd
         LDlw==
X-Gm-Message-State: AC+VfDx7NqCJVo5DWPGeUXNm6TAC1VWOyl0EdBd39KM4TsLBTswZq2rE
	q4nSYLwLHRRGlYHlenRGK5s=
X-Google-Smtp-Source: ACHHUZ7anfTta4o6oWSTW9RlfDa2eqa4r2iZe046/nK2wrjcPMTEbAVUG2p9+IAoqKlxfnypbO8/IA==
X-Received: by 2002:a05:6a00:b8a:b0:654:9d3a:f970 with SMTP id g10-20020a056a000b8a00b006549d3af970mr4634432pfj.31.1686150155142;
        Wed, 07 Jun 2023 08:02:35 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78058000000b00634dde2992bsm2300379pfm.132.2023.06.07.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:02:34 -0700 (PDT)
Date: Wed, 7 Jun 2023 20:32:31 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] staging: rtl8192e: Remove variable LeisurePSLeave
Message-ID: <e97e9b82c9b3bc3c237d63ac2d9fae21f6c4f839.1686149467.git.yogi.kernel@gmail.com>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686149467.git.yogi.kernel@gmail.com>

The variable LeisurePSLeave is set in only one place throughout the
driver. This patch removes the variable and calls the real function
directly instead, eliminating the unnecessary indirection.
Additionally, the removal of the variable aligns with the checkpatch
guidelines by removing the use of CamelCase.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v2: Removed the variable and called the function direction instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtllib.h            | 1 -
 drivers/staging/rtl8192e/rtllib_rx.c         | 3 ++-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 3 ++-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 6f6c31344441..231903002233 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -716,7 +716,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->check_nic_enough_desc	= _rtl92e_check_nic_enough_desc;
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
-	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
 	priv->rtllib->start_send_beacons = rtl92e_start_beacon;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d22a586043f2..f7fd8b77db99 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1719,7 +1719,6 @@ struct rtllib_device {
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
 	void (*rtllib_ips_leave)(struct net_device *dev);
-	void (*LeisurePSLeave)(struct net_device *dev);
 
 	/* This must be the last item so that it points to the data
 	 * allocated beyond this structure by alloc_rtllib
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d44bf261de54..d8acede4b808 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -35,6 +35,7 @@
 
 #include "rtllib.h"
 #include "dot11d.h"
+#include "rtl8192e/rtl_ps.h"
 
 static void rtllib_rx_mgt(struct rtllib_device *ieee, struct sk_buff *skb,
 			  struct rtllib_rx_stats *stats);
@@ -1212,7 +1213,7 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
 			    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
-				ieee->LeisurePSLeave(ieee->dev);
+				rtl92e_leisure_ps_leave(ieee->dev);
 			}
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 9fb4fee93990..07c46ad4f20e 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -16,6 +16,7 @@
 #include "rtllib.h"
 #include "dot11d.h"
 #include "rtl8192e/r8192E_phy.h"
+#include "rtl8192e/rtl_ps.h"
 /* FIXME: add A freqs */
 
 const long rtllib_wlan_frequencies[] = {
@@ -341,7 +342,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	chan = ieee->current_network.channel;
 
-	ieee->LeisurePSLeave(ieee->dev);
+	rtl92e_leisure_ps_leave(ieee->dev);
 	/* notify AP to be in PS mode */
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 	rtllib_sta_ps_send_null_frame(ieee, 1);
-- 
2.25.1

