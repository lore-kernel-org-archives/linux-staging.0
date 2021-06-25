Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1586F70
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:27 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id h10so4318383qvz.2
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sBfveMBFusywj9cSVD+Uz4e7bJ4plmXSooGcOIkcK7g=;
        b=ywyVLUSCFBc7bu5IALFg2rZq97d5MiqQTQT22I+aYSMSio5k1ALf8asC5BgWiZ6ANM
         HjFS7E5tmC6VRYDsizQuXAxpx5lBYQ5BmZ+tAslVCP1sCcR1x4k6IJ8g6E+0RYDyGlwC
         rHb73//DeLJO1B3jCO4UZ5hG9GEY1hrmF7QIbHB2MfCTwaKrH031X87G1ycgWmqO9Hb5
         pFJLakmmGGyXXIyqaZNB+D9/hBewiNDcSoOsr5HEgbTp8fVqRyHseiTNesev2s3iShdc
         y6AlihJIzBAdqdHAYLkGrkjbznbjUDYOqPufGzOm1HC7+xTIjrPyLvgEGq9g2FDMIvt7
         cQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sBfveMBFusywj9cSVD+Uz4e7bJ4plmXSooGcOIkcK7g=;
        b=YqGQ6BGlTAsSlK68NsiYz/MwGC7S4UH5vXVO0Ov9Wl3o5ZGPr5hYX6GFJA02LEfs/E
         RpZg5ZFX0wmE7lc3gVasN3p4pC7FPjLJ6bHTECi1aJ1461GqAAPJ339GQ/dq040z3oSd
         Rm130dOlcTNSJaetZ+mVaCqFGpdTNt5B+j/g7ocAbPR5i3Ewk4cvH+ppawMWKw9s2crW
         RxzBpFLSUrpXw9dAw4IVbkDEsuzK6rtBvpxszmN28XgO3mMRmw9loYiUeRW0PlwddOwS
         4gUz5j44VBatU39NmGOp4bRDlZNmMroNF1c4Iv/kZ2s8Qo4TXuuvQN8X8YM1IRfNRR63
         ejvA==
X-Gm-Message-State: AOAM532BPGqRv/KWaDCsdjJ6qZK9Rm7E2Rb1rSne/Fr7lfdFaMfWYjK6
	T2a6n5ckO0RHqIT/ahxfBXzEFQ==
X-Google-Smtp-Source: ABdhPJzQoeZuyClHEwoMN5Kg/Qp0GRiFaXbvMYoycHZUkZQgr9ph6gNugr1BtvFpqJxQOfw3SDMnYA==
X-Received: by 2002:a05:6214:1028:: with SMTP id k8mr8314493qvr.13.1624579706215;
        Thu, 24 Jun 2021 17:08:26 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:25 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 17/23] staging: rtl8188eu: remove all RT_TRACE calls from hal/rtl8188eu_xmit.c
Date: Fri, 25 Jun 2021 01:07:50 +0100
Message-Id: <20210625000756.6313-18-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all RT_TRACE calls from hal/rtl8188eu_xmit.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
index 729d3bbf4343..1fa558e0de38 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
@@ -341,15 +341,11 @@ static s32 rtw_dump_xframe(struct adapter *adapt, struct xmit_frame *pxmitframe)
 		rtw_issue_addbareq_cmd(adapt, pxmitframe);
 	mem_addr = pxmitframe->buf_addr;
 
-	RT_TRACE(_module_rtl871x_xmit_c_, _drv_info_, ("%s()\n", __func__));
-
 	for (t = 0; t < pattrib->nr_frags; t++) {
 		if (inner_ret != _SUCCESS && ret == _SUCCESS)
 			ret = _FAIL;
 
 		if (t != (pattrib->nr_frags - 1)) {
-			RT_TRACE(_module_rtl871x_xmit_c_, _drv_err_, ("pattrib->nr_frags=%d\n", pattrib->nr_frags));
-
 			sz = pxmitpriv->frag_len;
 			sz = sz - 4 - pattrib->icv_len;
 		} else {
@@ -372,8 +368,6 @@ static s32 rtw_dump_xframe(struct adapter *adapt, struct xmit_frame *pxmitframe)
 
 		rtw_count_tx_stats(adapt, pxmitframe, sz);
 
-		RT_TRACE(_module_rtl871x_xmit_c_, _drv_info_, ("rtw_write_port, w_sz=%d\n", w_sz));
-
 		mem_addr += w_sz;
 
 		mem_addr = (u8 *)round_up((size_t)mem_addr, 4);
@@ -430,8 +424,6 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
 	/*  dump frame variable */
 	u32 ff_hwaddr;
 
-	RT_TRACE(_module_rtl8192c_xmit_c_, _drv_info_, ("+xmitframe_complete\n"));
-
 	pxmitbuf = rtw_alloc_xmitbuf(pxmitpriv);
 	if (!pxmitbuf)
 		return false;
@@ -626,7 +618,6 @@ bool rtw_hal_xmit(struct adapter *adapt, struct xmit_frame *pxmitframe)
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	if (res != _SUCCESS) {
-		RT_TRACE(_module_xmit_osdep_c_, _drv_err_, ("pre_xmitframe: enqueue xmitframe fail\n"));
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
 		/*  Trick, make the statistics correct */
-- 
2.31.1

