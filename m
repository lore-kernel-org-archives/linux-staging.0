Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70CE17CA
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:36:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3177d3bdfb3so682988f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691908611; x=1692513411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yafTvXOw9qDIGS3IGLglUTI/sT6XCgYCEECZPdC93mM=;
        b=SpndYIL5xHz95OsitFo/24m0F5jbfwCYwe5HO3nITx7B6LHHoRBmleN2Pn/ZOgt91c
         f6xm+iVH69ErRScFz0ZisVdpoavkRTpV9Cnqm0wRhIGbKEVhXtrF0BOcGEKqIGSfN6QQ
         fufTNJAdTmZbApS39fWGQEBMjcTy1aiPWByzvLd7nZFWRmZs8kVFSxbOHLfeU4RtnpxX
         k1MAKcGCFtB6iAn7F/wMOGLo9roc2UZ8l9i4KQ1Ub+N+jP7gm91zLk8pfb/shAoJppea
         dkKLYAMvB0uqjW1ADg4Dl2OqNHrCRow+/rtfpBAxGtGVq5OWM5KZlFpf5r7TW32Atwon
         zFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691908611; x=1692513411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yafTvXOw9qDIGS3IGLglUTI/sT6XCgYCEECZPdC93mM=;
        b=R3PBhlRug5/dZrwe+a3/Ah3uzcHPsrw1+0EZ6CTKcjOoBzUL8Nfy1H7hkE+8s/z8/U
         zbUmmpnW8DJoJjzS+p2O6LPNExbVSsGVfUaKX2elTx1llwSa+lfi55ePKJLFOCOhneXO
         Yca18fSuq6fYqZA1YfJD2xLixA+zVFd6UOmBfQLC0MIWD4Y7SMTtut8SrnmpQ2WZ1kCe
         KPl26QRUDyaOyvu/PaOJCt8/uH54YR91Ve3jsvk9o+7yMAswtaS1nA/gzktUkVpblWoo
         zksm6lkHDUWNmvzGKtmxCH3JmH/vlfSCmppOs1M/UgEqCinLgNWVlIw5DqIBGfPEqY9w
         NDaA==
X-Gm-Message-State: AOJu0YzkHwAddWde6mh00d0szz+dOC8GdQ4qF7Y1vwrEAcgfn//Jin8w
	IaDgYwavaqugqmA5xyys8Ig=
X-Google-Smtp-Source: AGHT+IEqm6+RA5GwptemXwxHBIgaAKqI9h+sx0dE6FHQDA2UxR5Z78pHLD4svgwEvyUCbS0pKpmDtA==
X-Received: by 2002:a05:600c:5111:b0:3fe:5228:b78c with SMTP id o17-20020a05600c511100b003fe5228b78cmr6279334wms.1.1691908610821;
        Sat, 12 Aug 2023 23:36:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id z5-20020a7bc7c5000000b003fbe4cecc3bsm13152437wmk.16.2023.08.12.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 23:36:50 -0700 (PDT)
Date: Sun, 13 Aug 2023 08:36:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8192e: Remove unsupported mode IW_MODE_MESH
Message-ID: <54230361abba9f33827eac9bf5074dd9f62d787b.1691908402.git.philipp.g.hortmann@gmail.com>
References: <cover.1691908402.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1691908402.git.philipp.g.hortmann@gmail.com>

Tasklet irq_rx_tasklet is scheduled when hw is receiving frames. Function
_rtl92e_irq_rx_tasklet() is then called which calls then
_rtl92e_rx_normal(). In _rtl92e_rx_normal() all frames are processed by
rtllib_rx(). When ieee->iw_mode is IW_MODE_MESH the function returns
0. The calling function then calls: dev_kfree_skb_any() which clears
the skb. So the driver clears all packets received in this mode. Remove
dead code in mode IW_MODE_MESH.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h    |  4 ----
 drivers/staging/rtl8192e/rtllib_rx.c | 20 ++++++++------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0c812eb02ba6..afde4812a221 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -89,10 +89,6 @@ static inline void *netdev_priv_rsl(struct net_device *dev)
 #define HIGH_QUEUE			     7
 #define BEACON_QUEUE			   8
 
-#ifndef IW_MODE_MESH
-#define IW_MODE_MESH			7
-#endif
-
 #define IE_CISCO_FLAG_POSITION		0x08
 #define SUPPORT_CKIP_MIC			0x08
 #define SUPPORT_CKIP_PK			0x10
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 322e603237d4..40e7bbb17c0d 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1013,17 +1013,15 @@ static int rtllib_rx_data_filter(struct rtllib_device *ieee, u16 fc,
 		}
 	}
 
-	if (ieee->iw_mode != IW_MODE_MESH) {
-		/* packets from our adapter are dropped (echo) */
-		if (!memcmp(src, ieee->dev->dev_addr, ETH_ALEN))
-			return -1;
+	/* packets from our adapter are dropped (echo) */
+	if (!memcmp(src, ieee->dev->dev_addr, ETH_ALEN))
+		return -1;
 
-		/* {broad,multi}cast packets to our BSS go through */
-		if (is_multicast_ether_addr(dst)) {
-			if (memcmp(bssid, ieee->current_network.bssid,
-				   ETH_ALEN))
-				return -1;
-		}
+	/* {broad,multi}cast packets to our BSS go through */
+	if (is_multicast_ether_addr(dst)) {
+		if (memcmp(bssid, ieee->current_network.bssid,
+			   ETH_ALEN))
+			return -1;
 	}
 	return 0;
 }
@@ -1499,8 +1497,6 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 	case IW_MODE_MONITOR:
 		ret = rtllib_rx_Monitor(ieee, skb, rx_stats);
 		break;
-	case IW_MODE_MESH:
-		break;
 	default:
 		netdev_info(ieee->dev, "%s: ERR iw mode!!!\n", __func__);
 		break;
-- 
2.41.0

