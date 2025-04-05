Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD48F66;
	Sat,  5 Apr 2025 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822950; cv=none; b=StJuXGhqVdBnF53o3mSUb09JMAHSLSIKPTyRa2WIqY2VIUhDjnEzwRDs7DWtrw44fpIo4ljmGbgFWxBa+HftazDl0QxxU+eTQCLCQxUBEIvRwTMwNXbnxH5A50cxby0pZzCKZc+O0swCSyBTJkyLrVMs42/FKK7Revmo6MXh46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822950; c=relaxed/simple;
	bh=6wmuQ4xBJ/p57V3uZMiwB+aak9YwDuZCThNZhURf6Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTOFuoNWfEqBFWCPrAMBHwKcVHihX0sCRCvBYYAGM2Bg54JZl95r2KuYjzzqFqeH3nIIDfZwspDmXV5VmAA/NQQD0TJaqEVz5fbN/CKEhgkD9r7jMDaGMRonKz2Lei8dpYKCELd29Fnc6cVFscAJf9MyALUNCvbzmLmrfevjX+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzXnlT89; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzXnlT89"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso17582245e9.0;
        Fri, 04 Apr 2025 20:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743822946; x=1744427746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kj8e5KMlBOp/DQsu01vidRr3nQ+UO1HZ+C4LyVGDRs=;
        b=MzXnlT89GAMiKxfZt1X9pR+kq6GAXtpho3yQV3yOeOywWP26RGgzqmu8016h8JbHTs
         B1MN9Yl1tdQfZziV6YqyWv8fm3MgMzzt4OoTYDAsg6Ob+sUjQGED89nP1Egx9rN/iLvB
         q7sd8l/yoXfXuh0fUNHCM3GD4XEkgRybOBSRg8xq/JQWsFG5/yIThM0cibnjCCw2fWGc
         uhs1SRS5ynbHhpgIBbs+btWY9OPbTPFvq5sPjGNU4nDkKRnIqBwss0ijKgRCH2UiAL5V
         XC01IATgBFhkkCgPhq8idi2g4QUZWj4797a/hncXA+Yw5hFDYpix2eNLsO2+56HDyxUh
         nAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743822946; x=1744427746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kj8e5KMlBOp/DQsu01vidRr3nQ+UO1HZ+C4LyVGDRs=;
        b=WQmfjhdWhjl79mHFl0bNPhYqgdlSdHTo+qdNDypKtK7vYGa8kqCQpxvWNIfa9zoHcS
         Y9z8u9HOegmeKyJBSWkuc43AKYa2tI2Y2xOUOKDp/wAzBtveis62YeO4UNu17uwQ1hn7
         pHbJTz8tEWqYVB1s8jv4S9tTAdVegszWNYrt8IUFB7a9R5Jrd6levgBz+8+NjNbdT+hH
         zwUvT7ufcE2DOyq9Fc2Kyptipd5zU7XqhN6JgOO5ZJSb061lkFKhHQtltApGWC6v4Net
         Oion1gg1RVP1TkrA1SYm02ol5hrkL+lzTPwfLPDuLTQJvuzmSqPO8lrDBVB6/5jtRNFy
         h5vw==
X-Forwarded-Encrypted: i=1; AJvYcCVTHf/fgxph+QIObQP0y9MV5Tk+Mz6j2UNpNgVMCc2rjp8IF6FRWWKaXCkrMlXsqDuOJUtyL4PQYyiw@lists.linux.dev, AJvYcCXjJ0SbOiqBIqZbx+GjO6Yp7bcGt5gZxMH89VoFPQw0cQvo2hjJ0f/+5JOG6RJe9lCQGbtiLvHzfOzRfGlG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxaijv4x/AbrC8t2LO3hsF1m4x10/L+uLeQ5V7jgtnc9Inyh338
	9rvluCfGQu4qMj6i1uSGbjWbdw9aU6wjVeYg/bKAfptmhSZRnOH2
X-Gm-Gg: ASbGnctYL7ocMZr1qkTutMvTvJfNMSQ/e2aaGCISkPEyrsEYf/CBwgUVYcBpN4buR8E
	pPW1fWFMJDG2vzFNeKDUPDwqtJMAhrpTzqPiRAZHUQUO4nxGbmkl0/5St2BTv0qez3jhaMMk0+u
	oynRs5Lmfzeb4QrPdABEGti4wQoIxRX1dkIg8QPCRTfEuZ9X6MGZCmyCcOBl3suRvzP9CeYb0+W
	dRQdrwbSilQ9qMmRPkFxKHkW1FNsWGzSYSLJQktyS/GRNtoprDTb5UPRluCt9PNU3mY5IVVOg/1
	PDxIyg4lIK5SwGEafGA+tKk3KL3AK7M79jjY4lH9Cg==
X-Google-Smtp-Source: AGHT+IHJCATuG4/WZlGUnW1DnDSoYaiXP9qbuSMdrAgwY3BMnLvXxrbFycKulef+WVuzh5gLgvnffQ==
X-Received: by 2002:a05:600c:1991:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43ebefb7f50mr98457175e9.15.1743822946094;
        Fri, 04 Apr 2025 20:15:46 -0700 (PDT)
Received: from pc.. ([197.232.62.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm5832250f8f.62.2025.04.04.20.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 20:15:44 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: Initialize local variables at declaration
Date: Sat,  5 Apr 2025 06:14:49 +0300
Message-ID: <ef29adfe7c8a189009b07c2873aa48782cd594ca.1743820815.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743820815.git.karanja99erick@gmail.com>
References: <cover.1743820815.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Optimize variable initialization by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.
This makes the code more concise and readable.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 56 ++++++-------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 5dc1c12fe03e..ebe9562a9606 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
  */
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	u8 queue_empty, queue_pending;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
 		netdev_emerg(padapter->pnetdev,
 			     "%s: down SdioXmitBufSema fail!\n", __func__);
@@ -168,10 +165,10 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
  */
 static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv)
 {
-	s32 err, ret;
+	s32 err = 0, ret;
 	u32 k = 0;
-	struct hw_xmit *hwxmits, *phwxmit;
-	u8 idx, hwentry;
+	struct hw_xmit *hwxmits = pxmitpriv->hwxmits, *phwxmit;
+	u8 idx, hwentry = pxmitpriv->hwxmit_entry;
 	struct tx_servq *ptxservq;
 	struct list_head *sta_plist, *sta_phead, *frame_plist, *frame_phead, *tmp;
 	struct xmit_frame *pxmitframe;
@@ -181,9 +178,6 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 	u8 txdesc_size = TXDESC_SIZE;
 	int inx[4];
 
-	err = 0;
-	hwxmits = pxmitpriv->hwxmits;
-	hwentry = pxmitpriv->hwxmit_entry;
 	ptxservq = NULL;
 	pxmitframe = NULL;
 	pframe_queue = NULL;
@@ -326,8 +320,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 		/*  dump xmit_buf to hw tx fifo */
 		if (pxmitbuf) {
 			if (pxmitbuf->len > 0) {
-				struct xmit_frame *pframe;
-				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+				struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 				pframe->agg_num = k;
 				pxmitbuf->agg_num = k;
 				rtl8723b_update_txdesc(pframe, pframe->buf_addr);
@@ -357,12 +350,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
  */
 static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->SdioXmitStart)) {
 		netdev_emerg(padapter->pnetdev, "%s: SdioXmitStart fail!\n",
 			     __func__);
@@ -408,13 +398,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
 int rtl8723bs_xmit_thread(void *context)
 {
-	s32 ret;
-	struct adapter *padapter;
-	struct xmit_priv *pxmitpriv;
-
-	ret = _SUCCESS;
-	padapter = context;
-	pxmitpriv = &padapter->xmitpriv;
+	s32 ret = _SUCCESS;
+	struct adapter *padapter = context;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	allow_signal(SIGTERM);
 
@@ -435,16 +421,13 @@ s32 rtl8723bs_mgnt_xmit(
 )
 {
 	s32 ret = _SUCCESS;
-	struct pkt_attrib *pattrib;
-	struct xmit_buf *pxmitbuf;
+	struct pkt_attrib *pattrib = &pmgntframe->attrib;
+	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 	u8 txdesc_size = TXDESC_SIZE;
 
-	pattrib = &pmgntframe->attrib;
-	pxmitbuf = pmgntframe->pxmitbuf;
-
 	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
 
 	pxmitbuf->len = txdesc_size + pattrib->last_txcmdsz;
@@ -519,9 +502,8 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 )
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	s32 err;
+	s32 err = rtw_xmitframe_enqueue(padapter, pxmitframe);
 
-	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
 	if (err != _SUCCESS) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
@@ -543,10 +525,7 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-
-	phal = GET_HAL_DATA(padapter);
+	struct hal_com_data *phal = GET_HAL_DATA(padapter);
 
 	spin_lock_init(&phal->SdioTxFIFOFreePageLock);
 	init_completion(&xmitpriv->SdioXmitStart);
@@ -557,16 +536,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 
 void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf;
-	struct __queue *pqueue;
-	struct list_head *plist, *phead;
+	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
+	struct list_head *plist, *phead = get_list_head(pqueue);
 	struct list_head tmplist;
 
 
-	pxmitpriv = &padapter->xmitpriv;
-	pqueue = &pxmitpriv->pending_xmitbuf_queue;
-	phead = get_list_head(pqueue);
 	INIT_LIST_HEAD(&tmplist);
 
 	spin_lock_bh(&pqueue->lock);
-- 
2.43.0

