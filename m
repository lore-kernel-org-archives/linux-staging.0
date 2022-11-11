Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06767F8
	for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 08:37:48 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id 13so11097672ejn.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 00:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DfnILufOOdX5Kg+pMaqFVKzb+AWaHeWfhqHmZ5gkkQ=;
        b=MS0P2McydCUAf7eSsNKhvvmIAlUVNE26AUM7kKUv7Uh0YTiBiU8DFPJuCHGx31eEtd
         Qkz3BNQd43fNTOrFoRHi3E7f/P0xAdFodl7EWgBj7QePxFQITOseXV5/8OcIdxdJry67
         DZF2UCG4dAH7RDbAJbV8WLcV2nf2m6RN/slhibUTcOFwu1ljkuQXHmWhLyj4ikvGA6hN
         e/l0i9aYwI7blBu9KMMP7wyeYSdzPx0ua2PChGIWjvHbKOfCLCuJaJ4R69OEXwgbJR6C
         rT/d2nFb/ztrtOZtyRiIOwV+uo/UjrjsZ+1IMNsFmbJ/3l8Ax6j3WdnGmDmfgUKyDwa6
         kZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DfnILufOOdX5Kg+pMaqFVKzb+AWaHeWfhqHmZ5gkkQ=;
        b=10VDF8d5FGh9EtMPx80QnW9+RINc9SUOPkKhCZKla5zmMfS5zmG6gA3sFjAaXhtbaE
         2lXdppPs/Q3qIMQ14DnTQOk8FNWdw1Qn9pOfDXeHcTfX+p7o/BmzwaemuxzOtdJHyFld
         GsdADCfWdwVj7sANHjwOHCAF1c/n/1dckriViwQYNlW7BUO8b5lbuLcNj/Gc1/xSW8wf
         o0cBZrNNQv9A5+vjZszt0PSWZ1OLxVYsSPEriZu0t2/n1Wns0TQPxTLcNp5EhGR2ndyJ
         UqjV600Xg7rPEHjy9BYv3H2NmsiKeK/JicKV7QAGiBq1zzm+WVA7NsOJuNAVYo4cyNzv
         GWzg==
X-Gm-Message-State: ANoB5pknTNg9HBFKAaKDu+JVZhXrwSYGaRJPInD+Y2wMQcVCYv6qwy3S
	wHJFs4KZsbaXoOElB92fvGKmY+WcWLI=
X-Google-Smtp-Source: AA0mqf5aiyxa09zAtPPNAiiRKTmfcLM33PYOCq9MCHSSdXzYg0180MJzHcdWo1PFH3B8iGrGbyeZfg==
X-Received: by 2002:a17:906:5054:b0:79b:413b:d64 with SMTP id e20-20020a170906505400b0079b413b0d64mr997764ejk.538.1668155867208;
        Fri, 11 Nov 2022 00:37:47 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9a.dynamic.kabel-deutschland.de. [95.90.187.154])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709063ca200b007ae566edb8bsm643190ejh.73.2022.11.11.00.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:37:46 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: convert rtw_xmit_resource_alloc() to common error logic
Date: Fri, 11 Nov 2022 09:37:31 +0100
Message-Id: <20221111083733.3144-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111083733.3144-1-straube.linux@gmail.com>
References: <20221111083733.3144-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function rtw_xmit_resource_alloc() away from returning
_FAIL or _SUCCESS which uses inverted error logic. Use the common
error logic instead. Return 0 for success and negative values for
failure.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index bd6c1a401c59..c0fda6ce7c56 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -38,7 +38,7 @@ static int rtw_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *px
 {
 	pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
 	if (!pxmitbuf->pallocated_buf)
-		return _FAIL;
+		return -ENOMEM;
 
 	pxmitbuf->pbuf = (u8 *)ALIGN((size_t)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
 	pxmitbuf->dma_transfer_addr = 0;
@@ -46,10 +46,10 @@ static int rtw_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *px
 	pxmitbuf->pxmit_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!pxmitbuf->pxmit_urb) {
 		kfree(pxmitbuf->pallocated_buf);
-		return _FAIL;
+		return -ENOMEM;
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 static void rtw_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf,
@@ -151,12 +151,12 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->ext_tag = false;
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
-		res = rtw_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
-		if (res == _FAIL) {
+		if (rtw_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ))) {
 			msleep(10);
-			res = rtw_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
-			if (res == _FAIL)
+			if (rtw_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ))) {
+				res = _FAIL;
 				goto free_xmitbuf;
+			}
 		}
 
 		pxmitbuf->flags = XMIT_VO_QUEUE;
@@ -188,8 +188,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->padapter = padapter;
 		pxmitbuf->ext_tag = true;
 
-		res = rtw_xmit_resource_alloc(padapter, pxmitbuf, max_xmit_extbuf_size + XMITBUF_ALIGN_SZ);
-		if (res == _FAIL) {
+		if (rtw_xmit_resource_alloc(padapter, pxmitbuf, max_xmit_extbuf_size + XMITBUF_ALIGN_SZ)) {
 			res = _FAIL;
 			goto free_xmit_extbuf;
 		}
-- 
2.38.1

