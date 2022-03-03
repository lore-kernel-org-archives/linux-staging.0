Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691367E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:43 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id b5so1681629ilj.9
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V4T+72bNaixsP6whwl4epw9DvUMQf2MR/4xeNX8CKus=;
        b=e0Zgh+DqhD52J8WAaHGlSKClW1RHp7C3vneMlmKxXj+AIA9ZmSUXGv8yDlk6Tdhqvq
         RqVvE8CHzOTBINmEe00AP4oEruoxrK+y+fsEZeELmkRZQOObWcWtJ2+kQwpFLeoNc7Tr
         X0milOeSx/Wd1JtkaPXfj8VXBQxmRPj3UeYIw2uKhx/sdU+K3WTbhuVSlrHThtRdXJ1j
         YmeJi9Y7Y6CyWjlNZpmCOnW/mQB4k0IUFKG57y7Elc2JaLX11D1Fb0slGXFfPtqgpecx
         zHNjZsknyUGxfsYJ+nLCsMVZFP5ug8PgcL30zB1K3tnmlU7b31IBx6+9jbbGwdnuc7iZ
         dDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V4T+72bNaixsP6whwl4epw9DvUMQf2MR/4xeNX8CKus=;
        b=K/nkHiikj6CkXqePxIK4g7YP1QEHhIX1/D+9KAX8Q/WmldQoMx1j6Oz0fH0bBQAhLD
         ocEPX6AmHwu/jUtzVeKkruO8SYlPcrrMgFCIesuZkgkpriQf2Ot4xO0fDOrI10nTIOkF
         PlniHYHCQt6SSlCJbUkyNkD6RawHF5UQD2fbUvPE4rwvXYH/WSgamesWgtuuHwQ4JkUl
         07w8QNkxasNYQNvzhEI0X1upbr3AN9AXC42Pdqzd29dXGrxkgchixqpVTQtZ4H7qSvPl
         P41c0E6EaBoYF9LcwCPtrEv9X5rb7KyH2LiRLDG1Ct5dB+6pqbQNODzhHZ4pTGpVq+Sb
         kMWQ==
X-Gm-Message-State: AOAM5332fM6b3M1LvqDm5Y01VH5hyUeKfeDbA22H0eTM+d++dyQiX9E+
	TK7GDtcUGh8WyJIaQAGdoP8=
X-Google-Smtp-Source: ABdhPJxH6IIYwY/ncZSCvF9ZK0v4MZotRSe9o4+oEvT+7kco2Y5wYpueeUw/dgWQykh7qLnOswxiew==
X-Received: by 2002:a05:6e02:190c:b0:2c2:6851:bce3 with SMTP id w12-20020a056e02190c00b002c26851bce3mr31911042ilu.28.1646322822581;
        Thu, 03 Mar 2022 07:53:42 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:42 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] staging: r8188eu: remove unused fields in struct recv_buf
Date: Thu,  3 Mar 2022 21:21:11 +0530
Message-Id: <d731acb15f82c597de53ecce8fdf1bb82dc4c386.1646321515.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646321515.git.abdun.nihaal@gmail.com>
References: <cover.1646321515.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fields alloc_sz, irp_pending and pallocated_buf in struct recv_buf
are set but not used. And the field dma_transfer_addr is not used.
Remove them.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 1 -
 drivers/staging/r8188eu/include/rtw_recv.h   | 4 ----
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 2960e349638d..322b4549a92d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -38,7 +38,6 @@ int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		precvbuf->alloc_sz = MAX_RECVBUF_SZ;
 		res = rtw_os_recvbuf_resource_alloc(padapter, precvbuf);
 		if (res == _FAIL)
 			break;
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index e62cda94bc90..4ac4e6b3e177 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -208,11 +208,7 @@ struct sta_recv_priv {
 
 struct recv_buf {
 	struct adapter *adapter;
-	u8	*pallocated_buf;
 	struct urb *purb;
-	dma_addr_t dma_transfer_addr;	/* (in) dma addr for transfer_buffer */
-	u32 alloc_sz;
-	u8  irp_pending;
 	struct sk_buff *pskb;
 	u8	reuse;
 };
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 898ae944bd7d..1e14b6d49795 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -18,13 +18,11 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 {
 	int res = _SUCCESS;
 
-	precvbuf->irp_pending = false;
 	precvbuf->purb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!precvbuf->purb)
 		res = _FAIL;
 	precvbuf->pskb = NULL;
 	precvbuf->reuse = false;
-	precvbuf->pallocated_buf = NULL;
 	return res;
 }
 
-- 
2.35.1

