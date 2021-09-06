Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39AF3FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:17 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q11so7281482wrr.9
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZbugpY3IHp5tB0HSnRdP0+hb80LsALpTqBP2HkV4C5s=;
        b=zLY612ZMhk0CO6TBUNdpEMj+f5yl/u9qIp9wM/k+c2c4mxnHyBzgyHw1zcuCBEuayc
         Q2Hf6GxeQlOtiDwmILtiMld+bcSzCF0Kj4bTnwjaghhfA01XnuCEtAM4ANhgqwTzrniD
         Gfav0W5tDcezAE0W4cAYtMqVBMTiJy1No7B1xEhl7LulvE4Ord6z3k2ogAShqDP4DnKO
         oHgP/vNhJYsSMB0eU8AGN2SV2Tm3Zg3hpGphG5Lc4RvHqs/JbhUKXdkaNyCXX0DeqHRP
         a1Vw9IFh+/e/7LlUWQ0x3tSrlOKbavcolSJWTA5crnbxwRhxcP37gp5P2zouanv5bLRe
         T3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbugpY3IHp5tB0HSnRdP0+hb80LsALpTqBP2HkV4C5s=;
        b=oiST3BmxhrQLbE/T5cKnKOMuWKRVAdv0XaxUg7BWV949UFxmSERUmQtW1p2y/v1XTv
         TI5fug1PdO9C7p8u9zsSaZ4Lu6nv7l6DQoR4VQtdV78xPuiaIlP2mY2iRZqdXiOMW3Wu
         TfoOa5wLy8DaIV0ocCaG2LqBBbrgrNJa9zqLI99/tR+5pvisRzB1SmY6cmqlXQIcFjxF
         QU1H90865fP2Dnah0ZKVsj3TRClplyvlF0xebGJ7SRxZR1eTNYrNeK3QUqsxtsSHzKX/
         pFAdBTud1pl0pS1/BoZ4QGSDiXUbi2hXOFNCldDRD6S+JPwc29VNNGggf71sl5huiJza
         n8mA==
X-Gm-Message-State: AOAM530cPbzkULn79LrdyfrSYfThqnylLEE94M8OwxroGftujvzruXeP
	FAylLEGT3/4dRfMHFE+SEcbKxI8rR+7pgw==
X-Google-Smtp-Source: ABdhPJxa4IkTf4eyCtEBXt1jAwJS3aRRrCf8ZPVqza8hCAE+yzZWuZbjz9AkAc4R96S6ZiFxqEulrQ==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr10437587wro.435.1630890076416;
        Sun, 05 Sep 2021 18:01:16 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:16 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/14] staging: r8188eu: remove rtw_hal_xmitframe_enqueue function
Date: Mon,  6 Sep 2021 02:01:01 +0100
Message-Id: <20210906010106.898-10-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_hal_xmitframe_enqueue from hal/hal_intf.c and its one
caller from core/rtw_recv.c, and remove its declaration from
include/hal_intf.h as well. This is just a wrapper function that calls
the function pointer hal_xmitframe_enqueue in struct hal_ops if it
is set, which it never is.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 2 --
 drivers/staging/r8188eu/hal/hal_intf.c     | 8 --------
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 3 files changed, 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 019c5364905b..ba69cf9facfe 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -966,8 +966,6 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 
 				pxmitframe->attrib.triggered = 1;
 
-				rtw_hal_xmitframe_enqueue(padapter, pxmitframe);
-
 				if (psta->sleepq_len == 0) {
 					pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 8b90bf4f5e58..b4fea82bce87 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -177,14 +177,6 @@ u8 rtw_hal_intf_ps_func(struct adapter *adapt,
 	return _FAIL;
 }
 
-s32 rtw_hal_xmitframe_enqueue(struct adapter *padapter,
-			      struct xmit_frame *pxmitframe)
-{
-	if (padapter->HalFunc.hal_xmitframe_enqueue)
-		return padapter->HalFunc.hal_xmitframe_enqueue(padapter, pxmitframe);
-	return false;
-}
-
 s32 rtw_hal_xmit(struct adapter *adapt, struct xmit_frame *pxmitframe)
 {
 	if (adapt->HalFunc.hal_xmit)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c4c04f929225..b30968a94fbf 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -299,8 +299,6 @@ u32	rtw_hal_inirp_deinit(struct adapter *padapter);
 
 u8	rtw_hal_intf_ps_func(struct adapter *padapter,
 			     enum hal_intf_ps_func efunc_id, u8 *val);
-s32 rtw_hal_xmitframe_enqueue(struct adapter *padapter,
-			      struct xmit_frame *pxmitframe);
 
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32	rtw_hal_mgnt_xmit(struct adapter *padapter,
-- 
2.31.1

