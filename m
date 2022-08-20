Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D6C320F
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:48 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id qn6so14215877ejc.11
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d7bVOfCwv38NGS3uojI4ID7MCNpzdtxiQF4QB74ZMD4=;
        b=UYyKB/kBaw4qD9DK4I9upqnlygYOxag0a1k8bYxMd61BnvaCPFhrfDynI0xN6qAJ+I
         QTQ+aeS20x1RUZ8q1yX+GRvo4KpvQ562Ux3bObFkYYnLdSzj6OSn+1BtTBhC56DVmO8Z
         Yz0gzNKGriVjCjFae686jH5vce2j3+EfIiSLvMhAxfOYEDj6ur7BL/wyScXohTd546b5
         YHr2Bgce6hrscxmwb1l2F/4NEJmpt1IYBnsmRWqKXfj4BTN7itj7AzcvVoeisZzcVe7B
         yV+dEZn9TCL6YD1unFjpK5OvKlgZnFyyLJJAkVbCO9nnRRAWR4SPzUtFIEgQyyAmiGv1
         NTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d7bVOfCwv38NGS3uojI4ID7MCNpzdtxiQF4QB74ZMD4=;
        b=5YD1cg2hkUFwyF11K9tCIgvYrTlv+SVAv8rgaGnKr/OTseWRtocKer6wKV3P4HnHee
         +CGHfM17YPK6ONKg9Dmnp+z+7ye6+NiQHSaAzQZi7Aw+Otm56jG+pz3fTgb+ctARXzzS
         jKmlde+VIx0M44yVY81JuIECbymYLlzIbF3Ava5l0Obn4pI/AzDAJBfb8ER9P5KtKVFm
         sMr9yNT7iJSC67ksogjy1UTu62Gq0Z0G6trWZO/B/Hn9uj4rqsekvqks5GE8/kD/l24J
         6LxHCGwxa2EFhbCPbZ85FU4P5LzNRbRk2m92q2HQ/lJYfz4OWpfabDpqvTox2OdM7uJ9
         94mA==
X-Gm-Message-State: ACgBeo1ou6Pum4+osOG+uTUYikRkgOmsGeZ2BEdjgP4hH7SlHqJnve9S
	K7rV1EwVl3Qd5/YbdCLRvgs=
X-Google-Smtp-Source: AA6agR6a6LwkzHTcgx9sxjTeQnpwtsR5LOaDUld8VDX9//JPP96UivEMCsKhLH4z8vjYZPz3BrZa7A==
X-Received: by 2002:a17:906:93ef:b0:73c:cf83:5553 with SMTP id yl15-20020a17090693ef00b0073ccf835553mr5881014ejb.441.1661019407407;
        Sat, 20 Aug 2022 11:16:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 16/19] staging: r8188eu: make rtw_os_pkt_complete() static
Date: Sat, 20 Aug 2022 20:16:20 +0200
Message-Id: <20220820181623.12497-17-straube.linux@gmail.com>
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

The function rtw_os_pkt_complete() is only used in rtw_xmit.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c      | 18 ++++++++++++++++++
 drivers/staging/r8188eu/include/rtw_xmit.h   |  3 +++
 drivers/staging/r8188eu/include/xmit_osdep.h |  4 ----
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 20 --------------------
 4 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 760b115938f2..c324dada4f5b 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -229,6 +229,24 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	return res;
 }
 
+static void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
+{
+	u16 queue;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+
+	queue = skb_get_queue_mapping(pkt);
+	if (padapter->registrypriv.wifi_spec) {
+		if (__netif_subqueue_stopped(padapter->pnetdev, queue) &&
+		    (pxmitpriv->hwxmits[queue].accnt < WMM_XMIT_THRESHOLD))
+			netif_wake_subqueue(padapter->pnetdev, queue);
+	} else {
+		if (__netif_subqueue_stopped(padapter->pnetdev, queue))
+			netif_wake_subqueue(padapter->pnetdev, queue);
+	}
+
+	dev_kfree_skb_any(pkt);
+}
+
 void rtw_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe)
 {
 	if (pxframe->pkt)
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 2475ca084265..be9a7afad8ea 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -7,6 +7,9 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
+#define NR_XMITFRAME		256
+#define WMM_XMIT_THRESHOLD	(NR_XMITFRAME * 2 / 5)
+
 #define MAX_XMITBUF_SZ	(20480)	/*  20k */
 #define NR_XMITBUFF		(4)
 
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index b881399fd989..ae738d215e99 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -11,8 +11,6 @@ extern int rtw_ht_enable;
 extern int rtw_cbw40_enable;
 extern int rtw_ampdu_enable;/* for enable tx_ampdu */
 
-#define NR_XMITFRAME	256
-
 struct xmit_priv;
 struct pkt_attrib;
 struct sta_xmit_priv;
@@ -21,6 +19,4 @@ struct xmit_buf;
 
 int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
 
-void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
-
 #endif /* __XMIT_OSDEP_H_ */
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index d67508096209..4721447a02e8 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -11,26 +11,6 @@
 #include "../include/osdep_intf.h"
 #include "../include/usb_osintf.h"
 
-#define WMM_XMIT_THRESHOLD	(NR_XMITFRAME * 2 / 5)
-
-void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
-{
-	u16	queue;
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-
-	queue = skb_get_queue_mapping(pkt);
-	if (padapter->registrypriv.wifi_spec) {
-		if (__netif_subqueue_stopped(padapter->pnetdev, queue) &&
-		    (pxmitpriv->hwxmits[queue].accnt < WMM_XMIT_THRESHOLD))
-			netif_wake_subqueue(padapter->pnetdev, queue);
-	} else {
-		if (__netif_subqueue_stopped(padapter->pnetdev, queue))
-			netif_wake_subqueue(padapter->pnetdev, queue);
-	}
-
-	dev_kfree_skb_any(pkt);
-}
-
 static void rtw_check_xmit_resource(struct adapter *padapter, struct sk_buff *pkt)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-- 
2.37.2

