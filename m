Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B343220
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:40 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id q2so7019723edb.6
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PDPIVySPMRGRZRtU+MncznrTlB37IpX4cguK3flnXUA=;
        b=W6DOBFk9VRRaDkpOdo1jv6Hln3uFH5V6mWgZ2gRGnIL3XyaS+XbCDih+xoOeIcVBuF
         zXUuymTgdqlQgfUIHsEbKsdks5120TOf3FFwrAMS5Y8uzZYMootTTKnlamQMQDnq1iux
         YgDuMvwbebdCZjDGtWyqlvEgZtAkWwmeNu0H4x1qc/z7o9E27oQ7NNtopGCeWSdSFypi
         OcWTztYmz/W3dF9LL3U40ZJVDlo24viwujT/jOgiivm5qn4AfJPPyTL82QrCjqyZJPi4
         NtCXr4ug9d1qHfa8Tsdv9JAIPbePoqWT8JvxTlgvYK6hbIZCZM2Uu7Egoz2AnyKwUZMc
         Xagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PDPIVySPMRGRZRtU+MncznrTlB37IpX4cguK3flnXUA=;
        b=eyKyxdvGl5yalS4OZsOFBr5F2ZZdp/0jCmFzv/iKz+PgURvIROInqzBiLm7+u6Oz/2
         1LEtEi4BQ4TPRj70hltCi4JsB+U96fOwD3KSdgvuZSVSX486wgnyaReFfmVas+C+J6GA
         8HI6lXA0an/p4H7KTHd54MAHD+80UGET+W6KLWmGWJl3ppzSSbAY/DUqr+W37uPx7Pmb
         NNc+kiahJ2iI6DJfaANEDF3JZMTA971Tem6IqOf7a6N9lJlNqNArm5udWUPz/0cWm8vL
         C4zzDk8kBY+62hTepOG9GszAlyff4A9UHxFYzXPULtSEr4YPkixYk/DO8PNmeda4WNwv
         zF7g==
X-Gm-Message-State: ACgBeo0wECDkUMQ6rrXxko9vq3ljdhA/gZzuIaNOfBkgYl6YM4OnLEVB
	XmY9JVv2NmHgm3rIZGmnhCs=
X-Google-Smtp-Source: AA6agR51CtFX/BfnsCvvr23jdZ8g508/rK5R9ppuxFwdC6mgQpmJtKQDHeakSfVfJhoNw1s2fv1meg==
X-Received: by 2002:a05:6402:424f:b0:43e:6d89:4316 with SMTP id g15-20020a056402424f00b0043e6d894316mr10190158edb.408.1661019398953;
        Sat, 20 Aug 2022 11:16:38 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/19] staging: r8188eu: make rtw_os_xmit_resource_alloc() static
Date: Sat, 20 Aug 2022 20:16:08 +0200
Message-Id: <20220820181623.12497-5-straube.linux@gmail.com>
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

The function rtw_os_xmit_resource_alloc() is only used in rtw_xmit.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c      | 17 +++++++++++++++++
 drivers/staging/r8188eu/include/xmit_osdep.h |  2 --
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 16 ----------------
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 48631ef56114..6f3a70a1ab3c 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -33,6 +33,23 @@ void	_rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv)
 	INIT_LIST_HEAD(&psta_xmitpriv->apsd);
 }
 
+static int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf,
+				      u32 alloc_sz)
+{
+	pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
+	if (!pxmitbuf->pallocated_buf)
+		return _FAIL;
+
+	pxmitbuf->pbuf = (u8 *)ALIGN((size_t)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
+	pxmitbuf->dma_transfer_addr = 0;
+
+	pxmitbuf->pxmit_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!pxmitbuf->pxmit_urb)
+		return _FAIL;
+
+	return _SUCCESS;
+}
+
 s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 {
 	int i;
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 5a09355a142a..82b47b38bafd 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -30,8 +30,6 @@ struct xmit_buf;
 
 int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter,
-			       struct xmit_buf *pxmitbuf, u32 alloc_sz);
 void rtw_os_xmit_resource_free(struct adapter *padapter,
 			       struct xmit_buf *pxmitbuf, u32 free_sz);
 
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 9759ff5ea76d..fdecb5e1a784 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -54,22 +54,6 @@ uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 	return len;
 }
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz)
-{
-	pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
-	if (!pxmitbuf->pallocated_buf)
-		return _FAIL;
-
-	pxmitbuf->pbuf = (u8 *)ALIGN((size_t)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
-	pxmitbuf->dma_transfer_addr = 0;
-
-	pxmitbuf->pxmit_urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!pxmitbuf->pxmit_urb)
-		return _FAIL;
-
-	return _SUCCESS;
-}
-
 void rtw_os_xmit_resource_free(struct adapter *padapter,
 			       struct xmit_buf *pxmitbuf, u32 free_sz)
 {
-- 
2.37.2

