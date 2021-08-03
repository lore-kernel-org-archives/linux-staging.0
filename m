Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679C3480
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 23:05:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b13so150153wrs.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 16:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nCPkD1dwsnQaA+afTXqBn/SyTpbp0k/+8Ot/Elq5978=;
        b=RcBbqFV8YV23LRHzAvE800zfKpPv4CppSzON37JHwqbz1pcSsehZdOFMM6l2TklLs7
         /hi4yLxnoIVo8OWPnBd8GJSLheOX6qRzvbPOHSajdhgdmUPh81Vb1a7zHgvXwt+ElTgz
         Q4W4r5I/fhtiIe0S+nJocOKBybSxoIKuwEaMjpw8UcMU3nwSx9ZXKTWUIHK+U5yf3Z1L
         li7jCW6kKOhQEtFU0feFx6ryMCFHW2Ln/agMNRRMbjIoZFIg3L1tmHmTSYl28D0Y31BZ
         YoR+c6I3T1TKEJgNz4X0Kypqx4dZK+I+PX6EcMGwuAYi+M72FVSkmRVK+utt2WfsseqY
         HZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCPkD1dwsnQaA+afTXqBn/SyTpbp0k/+8Ot/Elq5978=;
        b=RDADSOsQmhYNNYr4zaKrSEVpQhYDd+nJDKjRs87dHJkrk1MnSxuslOnx0os18keKA/
         hq1unXKTfIKGiLYTOLopdlTyaSN/3GN5F9CJwLgZ3C6yTB13eI+yEphwO82NhlK4OEzr
         /CgMiApqmTKiwaJ0ugMfIPkRH/SzgEfaAzqZuxOgodzXjhdXZctdtnJDxm+m5M44/Thl
         WfOi0400xtjJ+/iImWpMKa37T4ugG490Rq44emuDyuzFRMhSra7a1RIjkurG2xIkTuyE
         qMZYSDckLmcArJmBisA+TACBRs7keFBGflBa/klm0NFigXsExK2DhReWPy/1NN4fQwkC
         AAOg==
X-Gm-Message-State: AOAM533AXIv43O2I+mIJ4exJU1Rmji4L+67ls8R/xTKSFALcPVUmfxJ/
	DBrmrwWXmUuNTsOU8YKqutYaXQ==
X-Google-Smtp-Source: ABdhPJw2shYsqMNCU8gzlCwQeyE4AOekTFHvZGp6BT4M98pSqQY1oucwTUVbcXSChnlzCFyLXZytAA==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr24380664wrs.321.1628031938108;
        Tue, 03 Aug 2021 16:05:38 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id i29sm330045wmb.20.2021.08.03.16.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:05:37 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] staging: r8188eu: remove RT_TRACE calls from hal/rtl8188eu_xmit.c
Date: Wed,  4 Aug 2021 00:05:28 +0100
Message-Id: <20210803230535.74254-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803230535.74254-1-phil@philpotter.co.uk>
References: <20210803230535.74254-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from hal/rtl8188eu_xmit.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index e44a01af7f5c..33470170453e 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -354,15 +354,11 @@ static s32 rtw_dump_xframe(struct adapter *adapt, struct xmit_frame *pxmitframe)
 		rtw_issue_addbareq_cmd(adapt, pxmitframe);
 	mem_addr = pxmitframe->buf_addr;
 
-	RT_TRACE(_module_rtl871x_xmit_c_, _drv_info_, ("rtw_dump_xframe()\n"));
-
 	for (t = 0; t < pattrib->nr_frags; t++) {
 		if (inner_ret != _SUCCESS && ret == _SUCCESS)
 			ret = _FAIL;
 
 		if (t != (pattrib->nr_frags - 1)) {
-			RT_TRACE(_module_rtl871x_xmit_c_, _drv_err_, ("pattrib->nr_frags=%d\n", pattrib->nr_frags));
-
 			sz = pxmitpriv->frag_len;
 			sz = sz - 4 - (psecuritypriv->sw_encrypt ? 0 : pattrib->icv_len);
 		} else {
@@ -385,8 +381,6 @@ static s32 rtw_dump_xframe(struct adapter *adapt, struct xmit_frame *pxmitframe)
 
 		rtw_count_tx_stats(adapt, pxmitframe, sz);
 
-		RT_TRACE(_module_rtl871x_xmit_c_, _drv_info_, ("rtw_write_port, w_sz=%d\n", w_sz));
-
 		mem_addr += w_sz;
 
 		mem_addr = (u8 *)RND4(((size_t)(mem_addr)));
@@ -441,8 +435,6 @@ s32 rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmitp
 	/*  dump frame variable */
 	u32 ff_hwaddr;
 
-	RT_TRACE(_module_rtl8192c_xmit_c_, _drv_info_, ("+xmitframe_complete\n"));
-
 	/*  check xmitbuffer is ok */
 	if (pxmitbuf == NULL) {
 		pxmitbuf = rtw_alloc_xmitbuf(pxmitpriv);
@@ -659,7 +651,6 @@ static s32 pre_xmitframe(struct adapter *adapt, struct xmit_frame *pxmitframe)
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	if (res != _SUCCESS) {
-		RT_TRACE(_module_xmit_osdep_c_, _drv_err_, ("pre_xmitframe: enqueue xmitframe fail\n"));
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
 		/*  Trick, make the statistics correct */
-- 
2.31.1

