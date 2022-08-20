Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7C3224
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id gt3so1823159ejb.12
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=c5ehAN+V6o0UyrUy4MpXxQSXfN8Q8ckg1hQmpn4R19w=;
        b=KSqi7rl4+1guhMKdYi9+VP4e2YDJqZXP5I7clqBORFVSYNA81f/iK7jIIUlMa2u9Qe
         WprQl1RL/KmOfk+8tRf0dYwIawmTrp2Vvtboie7OUNkzuoyGIcfarw267CgF89C9uwf1
         WsDzBKAv5dcPfFzhO/iRW+MTeWBrP/iG9XvAZ/LeTMxfctB2Vw7vsMYA79WZd2KggGde
         7XjhkapIFHDyIh3dHqVvVZE17TiBUThobPaymVp3KgSK9pYfIyhJZmSX+AkTu00kLk8+
         aLxuT5oM3rWMA8ev9N0LBXHPMoUZQH5+uxuzrme1t2Hxy/NWYOxiX9a6YQdHvT48QRxq
         HhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=c5ehAN+V6o0UyrUy4MpXxQSXfN8Q8ckg1hQmpn4R19w=;
        b=XGNMUJSAeHaLZifRn6A10mfBuNW5ijtnM0YMp+8BUShcxbUv/UaouVQE0piT1gLWLW
         Tbl2PhM3N/B9TF4Ye5xuJV+MgVzctCay+VAQuOTzqNLfhApfyzDYKiz2spzXkLnINBVf
         T6EcqSN6M5Zej5lVtLYgJ0ZfRs95r6rnqfJJwBYwKF65vFqk7Esvz02t9lquPxGhFgFw
         ehcqcS4rCWxHVLW7+gt8Wh1aEuR6UMxUkGFmk58hRiZHEX4Cz2hsQ8fl3ZRqc3sU3uEz
         GJxuuupzkzfdkiCR6C5wksT6HAVfoSjo7vJS5F6I//sUexyN/CCXaTC2uO0ccIpqzeO5
         QbYg==
X-Gm-Message-State: ACgBeo0qw7KizfyKCXRpkWKKCe+rC3sfYkIfBMpSnhAbnxGcW90Vm+pY
	ja3ZYuCrfT28Gf0NUo2+qpk=
X-Google-Smtp-Source: AA6agR7XGHClFKK38cuEgOKG3DAOv6Day3RPsKs1rVd7WUs7R9RGWljq6EMW+cjz/XGY2ozz9nf8Og==
X-Received: by 2002:a17:907:94d0:b0:730:7a68:3093 with SMTP id dn16-20020a17090794d000b007307a683093mr8687137ejc.760.1661019406059;
        Sat, 20 Aug 2022 11:16:46 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 14/19] staging: r8188eu: move rtw_os_xmit_complete() to rtw_xmit.c
Date: Sat, 20 Aug 2022 20:16:18 +0200
Message-Id: <20220820181623.12497-15-straube.linux@gmail.com>
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

Move the function rtw_os_xmit_complete() from the os_dep/xmit_linux.c
to core/rtw_xmit.c. The goal is to get rid of os_dep/xmit_linux.c in
follow up patches.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c      | 7 +++++++
 drivers/staging/r8188eu/include/rtw_xmit.h   | 2 ++
 drivers/staging/r8188eu/include/xmit_osdep.h | 2 --
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 7 -------
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index f79889011cd1..d5878b31bdbb 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -229,6 +229,13 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	return res;
 }
 
+void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe)
+{
+	if (pxframe->pkt)
+		rtw_os_pkt_complete(padapter, pxframe->pkt);
+	pxframe->pkt = NULL;
+}
+
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 {
 	int i;
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 0e9471fb19e4..0c46b19d2842 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -364,6 +364,8 @@ u32	rtw_get_ff_hwaddr(struct xmit_frame *pxmitframe);
 int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms);
 void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status);
 
+void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
+
 /* include after declaring struct xmit_buf, in order to avoid warning */
 #include "xmit_osdep.h"
 
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 612cdab52a9f..b881399fd989 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -22,7 +22,5 @@ struct xmit_buf;
 int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
 
 void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
-void rtw_os_xmit_complete(struct adapter *padapter,
-			  struct xmit_frame *pxframe);
 
 #endif /* __XMIT_OSDEP_H_ */
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index e216ada44055..d67508096209 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -31,13 +31,6 @@ void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
 	dev_kfree_skb_any(pkt);
 }
 
-void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe)
-{
-	if (pxframe->pkt)
-		rtw_os_pkt_complete(padapter, pxframe->pkt);
-	pxframe->pkt = NULL;
-}
-
 static void rtw_check_xmit_resource(struct adapter *padapter, struct sk_buff *pkt)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-- 
2.37.2

