Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5F156EE
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 17:54:25 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-563531a3ad2so1495632eaf.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689357265; x=1691949265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HhWHTihqEVGZ7UbRv5sTAqbNbXFXUqhxoeSzHop6+CY=;
        b=ZqnJP5TgvB9Lbcr1drQHWN2xw4IoFriyJOsINZdBIg8yPdKqgUpTyWotRA4+3dAd7x
         qCCrJGHQsZc1Ylu3vyhfwJWHNHpicMGfwx6yZ69c/uT49vlFsAF52jfi+xXzi6rpGWCO
         71oMDwUet79DbxBmbD4fGEw+qbDrnSM/2Pf6xDGOtBO/5JJuL5vQI4hnEpBJNWdj+5nb
         XOXBCTN64a/bvOG7KesoCIZ/GeHerSQ4Z2Rz48W8Ag/uu1V1W9STrnzE4/LYbsOwlUWY
         W3Ws+tGgBmTo42GqwBXjVyIRosbhl0Tv92zfyO/HZM171bjctfcvALC0gTvQSN/OT9ap
         5xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357265; x=1691949265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhWHTihqEVGZ7UbRv5sTAqbNbXFXUqhxoeSzHop6+CY=;
        b=EzU6HkOnZs69Tr7igv74+9u2NGIgx6wjwAe9W0UF8Ab7+Lf/PTpTpUFnsc+bth2KTj
         ObIjCjOIZGbMKacNiMOo0Bwrw1S6QqWG1Pr+o2cGO8dLuYwyqlKPC4QWPBVmwHxCv1oN
         INbCkoCRny4Yph084dG8Zs6Muz5AsF1ZSs7c5cMGEkwDMmLb+MVYAiLAWCzSXqvywVMO
         HFX8pqL/x/ZOetgcp+sg8Jft034T6FepT3fBWLFRXjfM48laDJXoYYN42OB61JcIxKfm
         Y7xzDLd9YPmTQU2Z5vOuMpk4eWkhfQkf1k3Tp9z2afb7yFGaPIBo+NemjbZJr+M50US8
         KXUQ==
X-Gm-Message-State: ABy/qLZPORsfaBbp4G0NtHLYCIXFX4j7WF28fTByahb9lw3OaKXjSy0b
	DWfg62VB1tctFQv2hzGPMlwDcZQZBRw=
X-Google-Smtp-Source: APBJJlFRMJy3SCUvftpzui2PVWcCf3sofTpwhHmYLPTFjbDJmiarSyS69sn5j+6JI+Ew88FEBQR/Ow==
X-Received: by 2002:a4a:92ce:0:b0:566:f94f:cd28 with SMTP id j14-20020a4a92ce000000b00566f94fcd28mr4605215ooh.3.1689357264827;
        Fri, 14 Jul 2023 10:54:24 -0700 (PDT)
Received: from localhost.localdomain ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id i19-20020a4a8d93000000b005660ed0becesm4116129ook.39.2023.07.14.10.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:54:24 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Nam Cao <namcaov@gmail.com>
Subject: [PATCH v2] staging: r8712: Fix memory leak in _r8712_init_xmit_priv()
Date: Fri, 14 Jul 2023 12:54:17 -0500
Message-ID: <20230714175417.18578-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the above mentioned routine, memory is allocated in several places.
If the first succeeds and a later one fails, the routine will leak memory.
This patch fixes commit 2865d42c78a9 ("staging: r8712u: Add the new driver
to the mainline kernel"). A potential memory leak in
r8712_xmit_resource_alloc() is also addressed.

Fixes: 2865d42c78a9 ("staging: r8712u: Add the new driver to the mainline kernel")
Reported-by: syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/x/log.txt?x=11ac3fa0a80000
Cc: stable@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
v2 - Added allocations within the loop and urb allocations as suppested by Nam Cao
---
 drivers/staging/rtl8712/rtl871x_xmit.c | 43 ++++++++++++++++++++------
 drivers/staging/rtl8712/xmit_linux.c   |  6 ++++
 2 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
index 090345bad223..6353dbe554d3 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.c
+++ b/drivers/staging/rtl8712/rtl871x_xmit.c
@@ -21,6 +21,7 @@
 #include "osdep_intf.h"
 #include "usb_ops.h"
 
+#include <linux/usb.h>
 #include <linux/ieee80211.h>
 
 static const u8 P802_1H_OUI[P80211_OUI_LEN] = {0x00, 0x00, 0xf8};
@@ -55,6 +56,7 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 	sint i;
 	struct xmit_buf *pxmitbuf;
 	struct xmit_frame *pxframe;
+	int j;
 
 	memset((unsigned char *)pxmitpriv, 0, sizeof(struct xmit_priv));
 	spin_lock_init(&pxmitpriv->lock);
@@ -117,11 +119,8 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 	_init_queue(&pxmitpriv->pending_xmitbuf_queue);
 	pxmitpriv->pallocated_xmitbuf =
 		kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4, GFP_ATOMIC);
-	if (!pxmitpriv->pallocated_xmitbuf) {
-		kfree(pxmitpriv->pallocated_frame_buf);
-		pxmitpriv->pallocated_frame_buf = NULL;
-		return -ENOMEM;
-	}
+	if (!pxmitpriv->pallocated_xmitbuf)
+		goto clean_up_frame_buf;
 	pxmitpriv->pxmitbuf = pxmitpriv->pallocated_xmitbuf + 4 -
 			      ((addr_t)(pxmitpriv->pallocated_xmitbuf) & 3);
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
@@ -129,13 +128,17 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 		INIT_LIST_HEAD(&pxmitbuf->list);
 		pxmitbuf->pallocated_buf =
 			kmalloc(MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ, GFP_ATOMIC);
-		if (!pxmitbuf->pallocated_buf)
-			return -ENOMEM;
+		if (!pxmitbuf->pallocated_buf) {
+			j = 0;
+			goto clean_up_alloc_buf;
+		}
 		pxmitbuf->pbuf = pxmitbuf->pallocated_buf + XMITBUF_ALIGN_SZ -
 				 ((addr_t) (pxmitbuf->pallocated_buf) &
 				 (XMITBUF_ALIGN_SZ - 1));
-		if (r8712_xmit_resource_alloc(padapter, pxmitbuf))
-			return -ENOMEM;
+		if (r8712_xmit_resource_alloc(padapter, pxmitbuf)) {
+			j = 1;
+			goto clean_up_alloc_buf;
+		}
 		list_add_tail(&pxmitbuf->list,
 				 &(pxmitpriv->free_xmitbuf_queue.queue));
 		pxmitbuf++;
@@ -146,6 +149,28 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 	init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 	tasklet_setup(&pxmitpriv->xmit_tasklet, r8712_xmit_bh);
 	return 0;
+
+clean_up_alloc_buf:
+	if (j) {
+		/* failure happened in r8712_xmit_resource_alloc()
+		 * delete extra pxmitbuf->pallocated_buf
+		 */
+		kfree(pxmitbuf->pallocated_buf);
+	}
+	for (j = 0; j < i; j++) {
+		int k;
+
+		pxmitbuf--;			/* reset pointer */
+		kfree(pxmitbuf->pallocated_buf);
+		for (k = 0; k < 8; k++)		/* delete xmit urb's */
+			usb_free_urb(pxmitbuf->pxmit_urb[k]);
+	}
+	kfree(pxmitpriv->pallocated_xmitbuf);
+	pxmitpriv->pallocated_xmitbuf = NULL;
+clean_up_frame_buf:
+	kfree(pxmitpriv->pallocated_frame_buf);
+	pxmitpriv->pallocated_frame_buf = NULL;
+	return -ENOMEM;
 }
 
 void _free_xmit_priv(struct xmit_priv *pxmitpriv)
diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 132afbf49dde..ceb6b590b310 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -112,6 +112,12 @@ int r8712_xmit_resource_alloc(struct _adapter *padapter,
 	for (i = 0; i < 8; i++) {
 		pxmitbuf->pxmit_urb[i] = usb_alloc_urb(0, GFP_KERNEL);
 		if (!pxmitbuf->pxmit_urb[i]) {
+			int k;
+
+			for (k = i - 1; k >= 0; k--) {
+				/* handle allocation errors part way through loop */
+				usb_free_urb(pxmitbuf->pxmit_urb[k]);
+			}
 			netdev_err(padapter->pnetdev, "pxmitbuf->pxmit_urb[i] == NULL\n");
 			return -ENOMEM;
 		}
-- 
2.41.0

