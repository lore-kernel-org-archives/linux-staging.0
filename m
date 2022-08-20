Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2906E3201
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:47 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id x21so9149973edd.3
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=yjcPgw0CG7/5/Itv9oWRmuj8uNx0y9j81u7fcqrcyG8=;
        b=fKY56u27nZCdc2CpciMfhjUjjFmX1muPxps4Tl6+riE/nFQcGjUrmjWc+rmd3mRjQJ
         p9pVfNHdz1Oq7qO5gsHMbLFSOmCxrPlwBZEhNwNr+oO+gCya3XFkA0+Nit8KsXLoXa8l
         6PYTBWeBqz9/vLV7E3hBNFx6eD/CWR1vzCg6K+eh8XJn3b1arvdSspqY5rdbsbxJPMr8
         jDY8N41Tti3CXcb4XU6Dt3y+bVC/OtrmRTsVHz9QPHNEt20GTrKF4rDgwcimK4HxogsL
         XIh+xZLC9uP7Wv/Srvb5SCm3Xv0zO9mUya0bLv8Sl9Onhrv7+AHfiKy/RdWPUPXV/aB2
         bgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=yjcPgw0CG7/5/Itv9oWRmuj8uNx0y9j81u7fcqrcyG8=;
        b=C9JJ6YBfnH1pouVALMAk5BYM5nfr45cfZSBV/+zH9XhnzlsPYiDw4Di+qup8sFQAxg
         KPNtul3/WcekW5h405QORRdWrb0gY8ukLOp29dYSRVMUAQg3BFVFa8fnUoukJmuokZ+e
         BErcl2imXqFa8fQ8s3iBEgm3T1Q7k+WdcwQYVsYmaEAbz0l5kKtazjvSSoTwIwknLYpq
         SJsFDplnMoWO5UTWmh/fiq2AzqiVL3/M8Ts9qI0yqejk2Ml+xz4fASDkP0iVF+ucLXD2
         zQ2DchBHOwgFvW7P7lXeN1unOD+GyNa8EUGxrM/KOGYXRNAubTjUsZg013y9y8At0uZ0
         rdiw==
X-Gm-Message-State: ACgBeo3svXldXZoerGck4EtN3Ck8y8PN8gOgGY9MKKIrgxSIepV9LGYa
	KXyu5Qbwvq/cOgdCjC+Ys1c=
X-Google-Smtp-Source: AA6agR4Ib7WAPazC9WU6QZ/34Vv3a4iM92Pw2z6TiPCIbiX2j8NhLkrvDizzG97CDrxkJXAI6OWfFQ==
X-Received: by 2002:a05:6402:510a:b0:43d:ab25:7d68 with SMTP id m10-20020a056402510a00b0043dab257d68mr10111339edd.102.1661019406769;
        Sat, 20 Aug 2022 11:16:46 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 15/19] staging: r8188eu: rename rtw_os_xmit_complete()
Date: Sat, 20 Aug 2022 20:16:19 +0200
Message-Id: <20220820181623.12497-16-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_xmit_complete() was moved from the os_dep
directory. It looks like the driver was originaly written to support
different operating systems. Obviously we do not need an extra 'os'
in the function name that indicates that the function is operating
system specific. Rename it to rtw_xmit_complete().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  |  2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c      | 10 +++++-----
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c |  4 ++--
 drivers/staging/r8188eu/include/rtw_xmit.h   |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 3103e8871dfd..893dac30e8e6 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -7876,7 +7876,7 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 				spin_unlock_bh(&psta_bmc->sleep_q.lock);
 				if (rtl8188eu_hal_xmit(padapter, pxmitframe))
-					rtw_os_xmit_complete(padapter, pxmitframe);
+					rtw_xmit_complete(padapter, pxmitframe);
 				spin_lock_bh(&psta_bmc->sleep_q.lock);
 			}
 			spin_unlock_bh(&psta_bmc->sleep_q.lock);
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index d5878b31bdbb..760b115938f2 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -229,7 +229,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	return res;
 }
 
-void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe)
+void rtw_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe)
 {
 	if (pxframe->pkt)
 		rtw_os_pkt_complete(padapter, pxframe->pkt);
@@ -249,7 +249,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 		return;
 
 	for (i = 0; i < NR_XMITFRAME; i++) {
-		rtw_os_xmit_complete(padapter, pxmitframe);
+		rtw_xmit_complete(padapter, pxmitframe);
 
 		pxmitframe++;
 	}
@@ -2017,7 +2017,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 
 		spin_unlock_bh(&psta->sleep_q.lock);
 		if (rtl8188eu_hal_xmit(padapter, pxmitframe))
-			rtw_os_xmit_complete(padapter, pxmitframe);
+			rtw_xmit_complete(padapter, pxmitframe);
 		spin_lock_bh(&psta->sleep_q.lock);
 	}
 
@@ -2067,7 +2067,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 
 			spin_unlock_bh(&psta_bmc->sleep_q.lock);
 			if (rtl8188eu_hal_xmit(padapter, pxmitframe))
-				rtw_os_xmit_complete(padapter, pxmitframe);
+				rtw_xmit_complete(padapter, pxmitframe);
 			spin_lock_bh(&psta_bmc->sleep_q.lock);
 		}
 
@@ -2141,7 +2141,7 @@ void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *pst
 		pxmitframe->attrib.triggered = 1;
 
 		if (rtl8188eu_hal_xmit(padapter, pxmitframe))
-			rtw_os_xmit_complete(padapter, pxmitframe);
+			rtw_xmit_complete(padapter, pxmitframe);
 
 		if ((psta->sleepq_ac_len == 0) && (!psta->has_legacy_ac) && (wmmps_ac)) {
 			pstapriv->tim_bitmap &= ~BIT(psta->aid);
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index bdfa51949289..8e4a5acc0b18 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -431,7 +431,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmit
 	rtw_xmitframe_coalesce(adapt, pxmitframe->pkt, pxmitframe);
 
 	/*  always return ndis_packet after rtw_xmitframe_coalesce */
-	rtw_os_xmit_complete(adapt, pxmitframe);
+	rtw_xmit_complete(adapt, pxmitframe);
 
 	/* 3 2. aggregate same priority and same DA(AP or STA) frames */
 	pfirstframe = pxmitframe;
@@ -501,7 +501,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmit
 
 		rtw_xmitframe_coalesce(adapt, pxmitframe->pkt, pxmitframe);
 		/*  always return ndis_packet after rtw_xmitframe_coalesce */
-		rtw_os_xmit_complete(adapt, pxmitframe);
+		rtw_xmit_complete(adapt, pxmitframe);
 
 		/*  (len - TXDESC_SIZE) == pxmitframe->attrib.last_txcmdsz */
 		update_txdesc(pxmitframe, pxmitframe->buf_addr, pxmitframe->attrib.last_txcmdsz, true);
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 0c46b19d2842..2475ca084265 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -364,7 +364,7 @@ u32	rtw_get_ff_hwaddr(struct xmit_frame *pxmitframe);
 int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms);
 void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status);
 
-void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
+void rtw_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
 
 /* include after declaring struct xmit_buf, in order to avoid warning */
 #include "xmit_osdep.h"
-- 
2.37.2

