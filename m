Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E68A71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:25 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id l4so1812370ejc.10
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbVu3rJMRpPzEvX8KIP4gBi2MNcGzAmk1GnAeQ4drbY=;
        b=BFCHDpLq8dEXFN9JS+QtM/l8NFSbz2BQc8pgsqYp8BcvFKQd8+F798gyZRhOJ+86m1
         SYLiE+1NVz1nHJ3A0270A9XrK3/E0iK5T/i25QqhjJuL5aq8VQD0B3GymvrrhVR8Ik7e
         NVIfCkreA5WsCGUuEQ5WmcKPJs9zo+ZXEC8xVuy4S42HcbEFtYqDGN3UJy/kLmxoBZib
         0AKt1GOpfS7QyoiSugWPMj0Ek1aoUDcQ1Oaz8aRnRA0n32Vn4+Kp//xrv01S/LXv0oqv
         SdvK3GpOeh24vXi9u5CCwNq+xzWP6gJRcSZDeAl6nBc2bzZ8IVo0uD68+BJeJbdwrbz5
         eCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbVu3rJMRpPzEvX8KIP4gBi2MNcGzAmk1GnAeQ4drbY=;
        b=igi7nORZBIAQJFKmlKKklH9d7VTiimEdF/pUbQ8BU3QWyXGzCzc3C0JhLUtgvcBoiG
         RejhUH46YF/aeRsHrlYl2mbJQeH4J0U3W0PIrZh0tDCr5qPy1yPzTV4zoT+7Av/LfpuD
         M8qy8To9R+2ZSIvQRaGtD5W3c+5A354Nc+CGnyJemU/Dfw7AD+1SIMmQtlb60J9UsYGD
         KFKMEl8fV2wwukYvSeLEefAZpoAsJ1OnVy6ToLx5LFfMAYya/QAMra3AcLR6rX9CaC5f
         UVl6vgRPFZECpFj3MPbaEFSl19PUJP51HkOo5tjCzXSxXY0QaAaGMmQb5GtPe0fboLs2
         UjTQ==
X-Gm-Message-State: AOAM5325qItG9BJvO1w7Cjkz4jYuRTz64oeV7eD9XQfqRCLeUNvWD7hs
	LsdQZGqfrbGf82ze5fU7jy0=
X-Google-Smtp-Source: ABdhPJxPsIoWME7YkIcLeozvKjqTy+Q9LRsFfinJXnT2VETyMnLpcy9/cUhCFjQGlCRqf6VwP3hpxw==
X-Received: by 2002:a17:906:7102:: with SMTP id x2mr8215718ejj.355.1617268943904;
        Thu, 01 Apr 2021 02:22:23 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id u24sm2455302ejr.34.2021.04.01.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 37/49] staging: rtl8723bs: remove RT_TRACE logs in hal/rtl8723bs_recv.c
Date: Thu,  1 Apr 2021 11:21:07 +0200
Message-Id: <f09fd8c6f74ff72d3e0067c2b6d9d13808060893.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 17a3e7bf66ef..d27d56920a11 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -346,7 +346,6 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 						update_recvframe_phyinfo(precvframe, (struct phy_stat *)ptr);
 
 					if (rtw_recv_entry(precvframe) != _SUCCESS) {
-						RT_TRACE(_module_rtl871x_recv_c_, _drv_dump_, ("%s: rtw_recv_entry(precvframe) != _SUCCESS\n", __func__));
 					}
 				} else if (pattrib->pkt_rpt_type == C2H_PACKET) {
 					struct c2h_evt_hdr_t	C2hEvent;
@@ -404,7 +403,6 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 	precvpriv->pallocated_recv_buf = rtw_zmalloc(n);
 	if (!precvpriv->pallocated_recv_buf) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_recv_c_, _drv_err_, ("alloc recv_buf fail!\n"));
 		goto exit;
 	}
 
-- 
2.20.1

