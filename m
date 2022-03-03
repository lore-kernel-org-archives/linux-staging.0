Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059F97E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:29 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id c14so6181209ioa.12
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YihgJUJcKUepElU6ZGSDtmFFyQk1sWFC8hH6Pg8liNU=;
        b=fADTev/VBuZIkxTgMAAcFysd6mPMYFTZNXYLcHb+GE0KUeHD5I8MFKVpujuhp5iGA1
         diclXF6fhvXuwUivl3jjJDrTAbL18WO1GijShBsDlypsT2edvEnl1/LD1Faly2Ct1ZNE
         zah4EtYX8paQ1LL9/0nlZFL1/x5k7dBcYBXoYCpUF9vxryUsuGRLYyAaCDfkvpEK48Lp
         eW+8VYphGRopSi8I6WRm3RiyTWMQvRyL6zhN/ZPdCQg5eMh7QI/UFRxb4pypN4urEFlz
         9aBLCoUTOIGqI2X0mSs+EYw1An4vwgYoyo116RGEFBQ2jtUMU/0wuHeCXXX4GuyPNYiN
         58kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YihgJUJcKUepElU6ZGSDtmFFyQk1sWFC8hH6Pg8liNU=;
        b=Lap93iUW6JsHxQCENsVMv46AjBOOaOPlJgegk6pmZ0eb8WbTjso7Ihg6opjjm++2El
         XLwy1DyuyOuWgoXO1M96uV+Ogic6pr9zN844ww4YbjeFcucnBaqHZUZkDKI5j/MzYh1h
         DSwFYnU2C13nUP/bNBgpDm80D+sZXxiqguy1sgv9btOEf6T72n5b6Zyw5aU+3ZXuIEdk
         V+cCmAD+VK/DbHDCBObGpWiqnjlNWoFQY7oxPXeqpVLnYiQx/0YUdFYQAV1VfCDPBt9M
         trI8etHKaFLVZa1AR8ZLv6AGxybA8rcu+rXWeCCKKL6S/k3ZSXeHBQ2luLnnQ9tqX7k0
         WKUQ==
X-Gm-Message-State: AOAM5306P73TkC0ma7s2Ns1F9fLOg/3Uww8wteTpqQCwaXgkeGy5ixDZ
	S1zXkwWY4vI3m5ar+cpfBZM=
X-Google-Smtp-Source: ABdhPJzXsA6ckuejxDUGB0IHIIN7T6tWsz71XsI4jTdRl3o20IZXjgKCbN6l+KGl4FWm6BWoAGNAdg==
X-Received: by 2002:a05:6602:3c5:b0:613:8644:591c with SMTP id g5-20020a05660203c500b006138644591cmr28148980iov.161.1646322809228;
        Thu, 03 Mar 2022 07:53:29 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:28 -0800 (PST)
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
Subject: [PATCH 6/9] staging: r8188eu: remove unused field pend
Date: Thu,  3 Mar 2022 21:21:08 +0530
Message-Id: <2ccf7067c411716a05bb6fa0acc04d5a612b5f12.1646321515.git.abdun.nihaal@gmail.com>
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

The field pend in struct recv_buf is set but not used.
Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 1 -
 drivers/staging/r8188eu/hal/usb_ops_linux.c  | 2 --
 drivers/staging/r8188eu/include/rtw_recv.h   | 1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 1 -
 4 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 7a787944064f..9f772fc7d6c1 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -16,7 +16,6 @@ void rtl8188eu_init_recvbuf(struct recv_buf *precvbuf)
 {
 	if (precvbuf->pbuf) {
 		precvbuf->pdata = precvbuf->pbuf;
-		precvbuf->pend = precvbuf->pdata + MAX_RECVBUF_SZ;
 	}
 }
 
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 74a221db1c3d..f16a6bb21ab4 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -441,11 +441,9 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 		skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 
 		precvbuf->pdata = precvbuf->pskb->data;
-		precvbuf->pend = skb_end_pointer(precvbuf->pskb);
 		precvbuf->pbuf = precvbuf->pskb->data;
 	} else { /* reuse skb */
 		precvbuf->pdata = precvbuf->pskb->data;
-		precvbuf->pend = skb_end_pointer(precvbuf->pskb);
 		precvbuf->pbuf = precvbuf->pskb->data;
 
 		precvbuf->reuse = false;
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index c97ec9d0feed..f7bc1c9579fc 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -211,7 +211,6 @@ struct recv_buf {
 	u8	*pbuf;
 	u8	*pallocated_buf;
 	u8	*pdata;
-	u8	*pend;
 	struct urb *purb;
 	dma_addr_t dma_transfer_addr;	/* (in) dma addr for transfer_buffer */
 	u32 alloc_sz;
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index fd29f06b375a..c8a0ac80df69 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -27,7 +27,6 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 	precvbuf->pallocated_buf = NULL;
 	precvbuf->pbuf = NULL;
 	precvbuf->pdata = NULL;
-	precvbuf->pend = NULL;
 	return res;
 }
 
-- 
2.35.1

