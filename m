Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C96F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:01 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id ap14so15938361ejc.0
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IJ04qPwZQoG/udgicot4c9qejEU4WCDTOW8eSD6SHqY=;
        b=HMXwsjfTx/w5+cd1yFjdywftczD0R0dORvT7/HZx0OrnWzAE2HTcqd/hlqiWK8qRWS
         Pgr+AkRvYEgHqPLdeLhwpZhhkoyii2eRYkM2P2UCIHwU74mRIUGuZ+sEW6WxvpsugBNU
         Dq80YleaeKobEEibt/SV179f8dE7uLf19zUsKhrsxaXd1OMbvJMdKP8AsQonlIS47mx6
         mqb6EOOXsWZ61LVyWngIqh3Bj5Qoqs2okDydGREz7ZinjBPNy2/BlPh33qp5p3q0pcGL
         xXD+WkQTmuqBqobPnmcW4ENAYxRqredqppNC7fOZ6NCyh4lDlcjBPWbkMmSP52Usv4os
         7+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IJ04qPwZQoG/udgicot4c9qejEU4WCDTOW8eSD6SHqY=;
        b=Hf6Mm/9Thke2WqKb1ZEpxjwTO/gQTCt1OKyD/EV/iJuYqq6Y/Gi+JiP2Lv0qhFyqGe
         CBCxhGPFqjG9qkK+8KTqJ7r3/ICupDZpSpynCgSqcmhR/HN3SvNi1/Hk1XqAYYXvNyI8
         qjwJ8D2jQs0w+eIO2oFuI4FSoyPkXOt+esgG0v61b02axUcDTsVaEZjh2Ge0zhfTC1qR
         /S+piLihuSiU3q7c5zLDG54lI5sqXzp8Z2cgddJdlEgFrpZh2Fwi+qmERqRiGwlcZp3+
         d83pjQ9/cFkLB3vWTWiXINYTgn7EK/8CoRuwzzEBwialc8cfj7KNLo2bsVauqo8FWrRY
         oj6A==
X-Gm-Message-State: AOAM53113V4hq0O6aeb60O9kDp313iT527CetOHSCEIdTUVIuDpKColb
	J9JKBCHJSsq0wxeTMfHVtl4=
X-Google-Smtp-Source: ABdhPJyIWSDl8UOArK7bmGFTijaW6RWgBEd+3VK/4LBRZTZUEPtxyAlPtNSg2obnwSYVAHOfWT7xUw==
X-Received: by 2002:a17:906:d8c6:: with SMTP id re6mr2453291ejb.311.1617183659810;
        Wed, 31 Mar 2021 02:40:59 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id i11sm822017ejf.76.2021.03.31.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 25/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in hal/rtl8723bs_xmit.c
Date: Wed, 31 Mar 2021 11:39:53 +0200
Message-Id: <e06a037ec6164c21908986f1a89c8600183a8edd.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 42 ++++++-------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 597cf3a88c51..ad27ba1592ed 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -102,11 +102,8 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 		(padapter->bSurpriseRemoved) ||
 		(padapter->bDriverStopped)
 	) {
-		RT_TRACE(
-			_module_hal_xmit_c_,
-			_drv_notice_,
-			("%s: bSurpriseRemoved(write port)\n", __func__)
-		);
+		pr_notice("%s %s: bSurpriseRemoved(write port)\n",
+			  DRIVER_PREFIX, __func__);
 		goto free_xmitbuf;
 	}
 
@@ -151,16 +148,9 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 
 	ret = (padapter->bDriverStopped) || (padapter->bSurpriseRemoved);
 	if (ret) {
-		RT_TRACE(
-			_module_hal_xmit_c_,
-			_drv_err_,
-			(
-				"%s: bDriverStopped(%d) bSurpriseRemoved(%d)!\n",
-				__func__,
-				padapter->bDriverStopped,
-				padapter->bSurpriseRemoved
-			)
-		);
+		pr_err("%s %s: bDriverStopped(%d) bSurpriseRemoved(%d)!\n",
+		       DRIVER_PREFIX, __func__,	padapter->bDriverStopped,
+		       padapter->bSurpriseRemoved);
 		return _FAIL;
 	}
 
@@ -374,7 +364,8 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 		/*  dump xmit_buf to hw tx fifo */
 		if (pxmitbuf) {
-			RT_TRACE(_module_hal_xmit_c_, _drv_info_, ("pxmitbuf->len =%d enqueue\n", pxmitbuf->len));
+			pr_info("%s pxmitbuf->len =%d enqueue\n",
+				DRIVER_PREFIX, pxmitbuf->len);
 
 			if (pxmitbuf->len > 0) {
 				struct xmit_frame *pframe;
@@ -424,16 +415,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 		(padapter->bDriverStopped) ||
 		(padapter->bSurpriseRemoved)
 	) {
-		RT_TRACE(
-			_module_hal_xmit_c_,
-			_drv_notice_,
-			(
-				"%s: bDriverStopped(%d) bSurpriseRemoved(%d)\n",
-				__func__,
-				padapter->bDriverStopped,
-				padapter->bSurpriseRemoved
-			)
-		);
+		pr_notice("%s %s: bDriverStopped(%d) bSurpriseRemoved(%d)\n",
+			  DRIVER_PREFIX, __func__, padapter->bDriverStopped,
+			  padapter->bSurpriseRemoved);
 		return _FAIL;
 	}
 
@@ -492,7 +476,7 @@ int rtl8723bs_xmit_thread(void *context)
 
 	complete(&pxmitpriv->SdioXmitTerminate);
 
-	RT_TRACE(_module_hal_xmit_c_, _drv_notice_, ("-%s\n", __func__));
+	pr_notice("%s-%s\n", DRIVER_PREFIX, __func__);
 
 	thread_exit();
 }
@@ -509,7 +493,7 @@ s32 rtl8723bs_mgnt_xmit(
 	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 	u8 txdesc_size = TXDESC_SIZE;
 
-	RT_TRACE(_module_hal_xmit_c_, _drv_info_, ("+%s\n", __func__));
+	pr_info("%s+%s\n", DRIVER_PREFIX, __func__);
 
 	pattrib = &pmgntframe->attrib;
 	pxmitbuf = pmgntframe->pxmitbuf;
@@ -572,7 +556,7 @@ s32 rtl8723bs_hal_xmit(
 	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
 	spin_unlock_bh(&pxmitpriv->lock);
 	if (err != _SUCCESS) {
-		RT_TRACE(_module_hal_xmit_c_, _drv_err_, ("rtl8723bs_hal_xmit: enqueue xmitframe fail\n"));
+		pr_err("%s %s: enqueue xmitframe fail\n", DRIVER_PREFIX, __func__);
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
 		pxmitpriv->tx_drop++;
-- 
2.20.1

