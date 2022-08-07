Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11DD3C15
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:15:51 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id y13so12815762ejp.13
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CLsK8zyKuvk6BZGE5Y5TZ/KuheYdgzde52aWp1HCe2w=;
        b=MpOFy8JsXjXRXS7sUnFo5CZ6bZkjGKKDTIi4APUpbGeKaADxOHoOC3kaMh13qO8QG7
         Fc04oiFT8VcUOVpUSZZm4XEBZOQxiSJ9dhJElra03xtqLCfZj8OURZ+aGlb69XDWqR7T
         bGpKfmZpB5zrHswcxdEZ5Si3eGRsvpoECsLtZLCWAgKuqgIkF2CphDgijfApwdCr65i/
         5RLwNyJJsLEn2gydgKY91VESc7vWBtKgxei1NII27BcXRXry0PAr7iLXEjhoLBc3p6An
         CqnBeicTShzFJ5vVnZPcd6aC6pLwaUj2DwqmmGJLuHtDuuMNsW+AJBOrX+0DO2EEq6iA
         19qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CLsK8zyKuvk6BZGE5Y5TZ/KuheYdgzde52aWp1HCe2w=;
        b=IwIRp02tx3zmAOM1AOCiC/UcFeVIunU2fVeE6ABlMY3yu4DWrs7BhmtDf7Jr2aKDyX
         l5S9qXcC/QEiS/OW6m5wqv67huK5es+PUTFv70fl5tNbNKedijHk0sOaHN94A9CKmSMu
         bvPxaSdb4gkeyk1HE8hPpMBd2aJD9UHf1N/92xKg2sYazuc/9JTjOEx4umcZCq9Yak1N
         c4/FKV10i4Vb0ATk6649RyO3EeFIrfSmMRcs8nFg3nD5RTn7jFR4MCz2n+zV/udnEovH
         kb5VFPcLY7m818WT8CpSq954tYdX35x1NOGW8rLLidOsgU6m76izfZabPQmVmRDn/NKy
         qMhw==
X-Gm-Message-State: ACgBeo33QeCJt6s/zoXGkk9dlwFfyFotid4ret4vsBEnU9kdooJzli+p
	0S0aRA8uVARIPg2MpgjrtR4=
X-Google-Smtp-Source: AA6agR6/OjEybgEzJ3bZozk1S++gsbuswCKK5JOUkRVcNEwOYtezdZ1ebHHrHAzuDdrYtS9ms0uwYw==
X-Received: by 2002:a17:907:6e88:b0:730:e16e:b760 with SMTP id sh8-20020a1709076e8800b00730e16eb760mr10353049ejc.5.1659896150263;
        Sun, 07 Aug 2022 11:15:50 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb84.dynamic.kabel-deutschland.de. [95.90.187.132])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090630c700b0072b92daef1csm4157441ejb.146.2022.08.07.11.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:15:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: merge rtw_os_recvbuf_resource_alloc() into rtw_recv.c
Date: Sun,  7 Aug 2022 20:15:35 +0200
Message-Id: <20220807181538.8499-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807181538.8499-1-straube.linux@gmail.com>
References: <20220807181538.8499-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the functionality of the function rtw_os_recvbuf_resource_alloc()
into rtl8188eu_init_recv_priv(). Merging the functionality instead of
just making the function static improves readability and we have one
function less to care about when converting the uses of _FAIL/_SUCCESS
to normal kernel error code logic.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c      |  8 ++++++--
 drivers/staging/r8188eu/include/recv_osdep.h |  2 --
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 14 --------------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 7a97c090f297..5de4e13b4b17 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -62,9 +62,13 @@ static int rtl8188eu_init_recv_priv(struct adapter *padapter)
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		res = rtw_os_recvbuf_resource_alloc(padapter, precvbuf);
-		if (res == _FAIL)
+		precvbuf->pskb = NULL;
+		precvbuf->reuse = false;
+		precvbuf->purb = usb_alloc_urb(0, GFP_KERNEL);
+		if (!precvbuf->purb) {
+			res = _FAIL;
 			break;
+		}
 		precvbuf->adapter = padapter;
 		precvbuf++;
 	}
diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index b9dc32c20cfd..51dc287f263c 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -19,8 +19,6 @@ void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup);
 int rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-int rtw_os_recvbuf_resource_alloc(struct adapter *adapt, struct recv_buf *buf);
-
 void rtw_init_recv_timer(struct recv_reorder_ctrl *preorder_ctrl);
 int _netdev_open(struct net_device *pnetdev);
 int netdev_open(struct net_device *pnetdev);
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index abdb42ab649b..c180f0e4dd3c 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -12,20 +12,6 @@
 #include "../include/osdep_intf.h"
 #include "../include/usb_ops.h"
 
-/* alloc os related resource in struct recv_buf */
-int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
-		struct recv_buf *precvbuf)
-{
-	int res = _SUCCESS;
-
-	precvbuf->purb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!precvbuf->purb)
-		res = _FAIL;
-	precvbuf->pskb = NULL;
-	precvbuf->reuse = false;
-	return res;
-}
-
 void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 {
 	union iwreq_data wrqu;
-- 
2.37.1

